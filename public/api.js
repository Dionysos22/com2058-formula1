const statusText = document.getElementById("statusText");
const errorBox = document.getElementById("errorBox");
const tableHeadRow = document.getElementById("tableHeadRow");
const tableBody = document.getElementById("tableBody");

const yearSelect = document.getElementById("yearSelect");
const searchInput = document.getElementById("searchInput");
const loadBtn = document.getElementById("loadBtn");

const pageTitle = document.getElementById("pageTitle");

const statSeason = document.getElementById("statSeason");
const statDrivers = document.getElementById("statDrivers");
const statConstructors = document.getElementById("statConstructors");
const statRaces = document.getElementById("statRaces");
const resultsHint = document.getElementById("resultsHint");
const sidebarNav = document.getElementById("sidebarNav");

function setActiveNav(view) {
  if (!sidebarNav) return;
  const items = sidebarNav.querySelectorAll("a[data-view]");
  for (const a of items) {
    const isActive = a.getAttribute("data-view") === view;
    a.classList.toggle("nav-item-active", isActive);
    a.setAttribute("aria-current", isActive ? "page" : "false");
  }
}

function setLoading(isLoading, msg = "") {
  if (!statusText) return;
  statusText.textContent = isLoading ? msg || "Loading..." : "";
  if (loadBtn) loadBtn.disabled = isLoading;
  if (loadBtn) loadBtn.classList.toggle("opacity-60", isLoading);
}

function setError(message) {
  if (!errorBox) return;
  if (!message) {
    errorBox.classList.add("hidden");
    errorBox.textContent = "";
    return;
  }
  errorBox.classList.remove("hidden");
  errorBox.textContent = message;
}

function escapeHtml(value) {
  return String(value ?? "")
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

function setTableColumns(columns) {
  if (!tableHeadRow) return;
  tableHeadRow.innerHTML = columns.map((c) => `<th class="th">${escapeHtml(c)}</th>`).join("");
}

function setTableRowsHtml(html, colCount) {
  if (!tableBody) return;
  tableBody.innerHTML =
    html ||
    `
      <tr>
        <td class="td muted" colspan="${colCount}">No data.</td>
      </tr>
    `;
}

function showTableLoading(colCount) {
  setTableRowsHtml(
    `
    <tr>
      <td class="td muted" colspan="${colCount}">Loading…</td>
    </tr>
  `,
    colCount
  );
}

function currentView() {
  const h = (location.hash || "#drivers").replace("#", "");
  return ["drivers", "circuits", "races", "standings", "constructors"].includes(h)
    ? h
    : "drivers";
}

async function apiGetJson(path) {
  const res = await fetch(path, { headers: { Accept: "application/json" } });
  if (!res.ok) {
    const text = await res.text().catch(() => "");
    throw new Error(`API error ${res.status}: ${text || res.statusText || "Request failed"}`);
  }
  return res.json();
}

async function fetchDrivers(year, q) {
  setError("");
  setLoading(true, "Loading drivers...");

  const columns = ["Forename", "Surname", "Nationality", "Constructor"];
  setTableColumns(columns);
  showTableLoading(columns.length);

  try {
    const data = await apiGetJson(`/api/seasons/${encodeURIComponent(year)}/drivers`);
    const list = Array.isArray(data) ? data : [];

    const needle = (q || "").trim().toLowerCase();
    const filtered = needle
      ? list.filter((d) => {
          const forename = String(d.forename ?? d.givenName ?? "").toLowerCase();
          const surname = String(d.surname ?? d.familyName ?? "").toLowerCase();
          const nat = String(d.nationality ?? "").toLowerCase();
          const cons = String(d.constructor ?? "").toLowerCase();
          return (
            forename.includes(needle) ||
            surname.includes(needle) ||
            nat.includes(needle) ||
            cons.includes(needle)
          );
        })
      : list;

    const constructorsSet = new Set(filtered.map((d) => String(d.constructor ?? "")).filter(Boolean));

    const rowsHtml = filtered
      .map((d) => {
        const forename = escapeHtml(d.forename ?? d.givenName ?? "");
        const surname = escapeHtml(d.surname ?? d.familyName ?? "");
        const nat = escapeHtml(d.nationality ?? "");
        const constructor = escapeHtml(d.constructor ?? "—");
        return `
          <tr class="hover:bg-slate-900/40">
            <td class="td">${forename}</td>
            <td class="td">${surname}</td>
            <td class="td muted">${nat}</td>
            <td class="td muted">${constructor}</td>
          </tr>
        `;
      })
      .join("");

    setTableRowsHtml(rowsHtml, columns.length);

    if (statSeason) statSeason.textContent = String(year);
    if (statDrivers) statDrivers.textContent = String(filtered.length ?? "—");
    if (statConstructors) statConstructors.textContent = String(constructorsSet.size ?? "—");
    if (statRaces) statRaces.textContent = "—";
    if (resultsHint) resultsHint.textContent = `(${filtered.length} drivers)`;
  } catch (err) {
    setTableRowsHtml("", columns.length);
    setError(
      err instanceof Error ? err.message : "Unknown error while fetching drivers."
    );
  } finally {
    setLoading(false);
  }
}

async function fetchCircuits(q) {
  setError("");
  setLoading(true, "Loading circuits...");
  const columns = ["Circuit", "Location", "Country"];
  setTableColumns(columns);
  showTableLoading(columns.length);
  try {
    const data = await apiGetJson(`/api/circuits`);
    const list = Array.isArray(data) ? data : [];
    const needle = (q || "").trim().toLowerCase();
    const filtered = needle
      ? list.filter((c) => {
          const name = String(c.circuit_name ?? "").toLowerCase();
          const city = String(c.city ?? "").toLowerCase();
          const country = String(c.country ?? "").toLowerCase();
          return name.includes(needle) || city.includes(needle) || country.includes(needle);
        })
      : list;

    const rowsHtml = filtered
      .map((c) => {
        const location = [c.city, c.country].filter(Boolean).join(", ");
        return `
          <tr class="hover:bg-slate-900/40">
            <td class="td">${escapeHtml(c.circuit_name ?? "")}</td>
            <td class="td muted">${escapeHtml(location || "—")}</td>
            <td class="td muted">${escapeHtml(c.country ?? "—")}</td>
          </tr>
        `;
      })
      .join("");
    setTableRowsHtml(rowsHtml, columns.length);

    if (statSeason) statSeason.textContent = "—";
    if (statDrivers) statDrivers.textContent = "—";
    if (statConstructors) statConstructors.textContent = "—";
    if (statRaces) statRaces.textContent = "—";
    if (resultsHint) resultsHint.textContent = `(${filtered.length} circuits)`;
  } catch (err) {
    setTableRowsHtml("", columns.length);
    setError(err instanceof Error ? err.message : "Unknown error while fetching circuits.");
  } finally {
    setLoading(false);
  }
}

async function fetchRaces(year, q) {
  setError("");
  setLoading(true, "Loading races...");
  const columns = ["Round", "Race", "Circuit", "Winner", "Date"];
  setTableColumns(columns);
  showTableLoading(columns.length);
  try {
    const data = await apiGetJson(`/api/races?year=${encodeURIComponent(year)}`);
    const list = Array.isArray(data) ? data : [];
    const needle = (q || "").trim().toLowerCase();
    const filtered = needle
      ? list.filter((r) => {
          return (
            String(r.grand_prix_name ?? r.name ?? "").toLowerCase().includes(needle) ||
            String(r.circuit_name ?? r.circuit ?? "").toLowerCase().includes(needle) ||
            String(r.winner ?? "").toLowerCase().includes(needle)
          );
        })
      : list;

    const rowsHtml = filtered
      .map((r) => {
        const date = r.race_start_date ?? r.date ?? "—";
        return `
          <tr class="hover:bg-slate-900/40">
            <td class="td">${escapeHtml(r.round_number ?? r.round ?? "")}</td>
            <td class="td">${escapeHtml(r.grand_prix_name ?? r.name ?? "")}</td>
            <td class="td muted">${escapeHtml(r.circuit_name ?? r.circuit ?? "")}</td>
            <td class="td muted">${escapeHtml(r.winner ?? "—")}</td>
            <td class="td muted">${escapeHtml(date)}</td>
          </tr>
        `;
      })
      .join("");
    setTableRowsHtml(rowsHtml, columns.length);

    if (statSeason) statSeason.textContent = String(year);
    if (statDrivers) statDrivers.textContent = "—";
    if (statConstructors) statConstructors.textContent = "—";
    if (statRaces) statRaces.textContent = String(filtered.length ?? "—");
    if (resultsHint) resultsHint.textContent = `(${filtered.length} races)`;
  } catch (err) {
    setTableRowsHtml("", columns.length);
    setError(err instanceof Error ? err.message : "Unknown error while fetching races.");
  } finally {
    setLoading(false);
  }
}

async function fetchConstructorStandings(year, q) {
  setError("");
  setLoading(true, "Loading constructor standings...");
  const columns = ["Pos", "Team", "Points"];
  setTableColumns(columns);
  showTableLoading(columns.length);
  try {
    const data = await apiGetJson(
      `/api/standings/constructors?year=${encodeURIComponent(year)}`
    );
    const list = Array.isArray(data) ? data : [];
    const needle = (q || "").trim().toLowerCase();
    const filtered = needle
      ? list.filter((s) => String(s.team_name ?? "").toLowerCase().includes(needle))
      : list;

    const rowsHtml = filtered
      .map((s) => {
        return `
          <tr class="hover:bg-slate-900/40">
            <td class="td">${escapeHtml(s.position ?? "")}</td>
            <td class="td">${escapeHtml(s.team_name ?? "")}</td>
            <td class="td muted">${escapeHtml(s.points ?? "")}</td>
          </tr>
        `;
      })
      .join("");
    setTableRowsHtml(rowsHtml, columns.length);

    if (statSeason) statSeason.textContent = String(year);
    if (statDrivers) statDrivers.textContent = "—";
    if (statConstructors) statConstructors.textContent = String(filtered.length ?? "—");
    if (statRaces) statRaces.textContent = "—";
    if (resultsHint) resultsHint.textContent = `(${filtered.length} teams)`;
  } catch (err) {
    setTableRowsHtml("", columns.length);
    setError(
      err instanceof Error ? err.message : "Unknown error while fetching constructor standings."
    );
  } finally {
    setLoading(false);
  }
}

async function fetchStandings(year, q) {
  setError("");
  setLoading(true, "Loading standings...");
  const columns = ["Pos", "Driver", "Constructor", "Points", "Wins"];
  setTableColumns(columns);
  showTableLoading(columns.length);
  try {
    const data = await apiGetJson(`/api/standings/drivers?year=${encodeURIComponent(year)}`);
    const list = Array.isArray(data) ? data : [];
    const needle = (q || "").trim().toLowerCase();
    const filtered = needle
      ? list.filter((s) => {
          return (
            String(s.driver ?? "").toLowerCase().includes(needle) ||
            String(s.constructor ?? "").toLowerCase().includes(needle)
          );
        })
      : list;

    const constructorsSet = new Set(filtered.map((s) => String(s.constructor ?? "")).filter(Boolean));

    const rowsHtml = filtered
      .map((s) => {
        return `
          <tr class="hover:bg-slate-900/40">
            <td class="td">${escapeHtml(s.position ?? "")}</td>
            <td class="td">${escapeHtml(s.driver ?? "")}</td>
            <td class="td muted">${escapeHtml(s.constructor ?? "—")}</td>
            <td class="td muted">${escapeHtml(s.points ?? "")}</td>
            <td class="td muted">${escapeHtml(s.wins ?? "")}</td>
          </tr>
        `;
      })
      .join("");
    setTableRowsHtml(rowsHtml, columns.length);

    if (statSeason) statSeason.textContent = String(year);
    if (statDrivers) statDrivers.textContent = "—";
    if (statConstructors) statConstructors.textContent = String(constructorsSet.size ?? "—");
    if (statRaces) statRaces.textContent = "—";
    if (resultsHint) resultsHint.textContent = `(${filtered.length} drivers)`;
  } catch (err) {
    setTableRowsHtml("", columns.length);
    setError(err instanceof Error ? err.message : "Unknown error while fetching standings.");
  } finally {
    setLoading(false);
  }
}

async function loadCurrentView() {
  const view = currentView();
  const year = Number(yearSelect?.value || 2021);
  const q = String(searchInput?.value || "");

  setActiveNav(view);

  if (pageTitle) {
    pageTitle.textContent =
      view === "drivers"
        ? "Drivers by Season"
        : view === "circuits"
        ? "Circuits"
        : view === "races"
        ? "Races by Season"
        : view === "constructors"
        ? "Constructors' Standings"
        : "Driver Standings";
  }

  if (yearSelect) yearSelect.parentElement?.classList.toggle("hidden", view === "circuits");

  if (view === "drivers") return fetchDrivers(year, q);
  if (view === "circuits") return fetchCircuits(q);
  if (view === "races") return fetchRaces(year, q);
  if (view === "constructors") return fetchConstructorStandings(year, q);
  return fetchStandings(year, q);
}

function init() {
  window.addEventListener("hashchange", loadCurrentView);

  loadBtn?.addEventListener("click", loadCurrentView);

  yearSelect?.addEventListener("change", loadCurrentView);

  searchInput?.addEventListener("keydown", (e) => {
    if (e.key === "Enter") loadCurrentView();
  });

  (async () => {
    await initYears();
    loadCurrentView();
    if (!location.hash) location.hash = "#drivers";
  })();
}

init();

async function initYears() {
  if (!yearSelect) return;
  try {
    const years = await apiGetJson("/api/years?max_year=2026");
    const list = Array.isArray(years) ? years : [];
    yearSelect.innerHTML = list
      .slice()
      .sort((a, b) => Number(b) - Number(a))
      .map((y) => `<option value="${escapeHtml(y)}">${escapeHtml(y)}</option>`)
      .join("");

    // Default: latest year that has race results; otherwise latest year.
    if (list.length > 0) {
      const desc = list.slice().sort((a, b) => Number(b) - Number(a));
      let chosen = desc[0];
      for (const y of desc) {
        const st = await apiGetJson(`/api/season-status?year=${encodeURIComponent(y)}`);
        if (st && Number(st.results) > 0) {
          chosen = y;
          break;
        }
      }
      yearSelect.value = String(chosen);
    } else {
      yearSelect.value = "2021";
    }
  } catch (e) {
    // fallback
    yearSelect.innerHTML = ["2026", "2025", "2024", "2023", "2022", "2021"]
      .map((y) => `<option value="${y}">${y}</option>`)
      .join("");
    yearSelect.value = "2025";
  }
}

