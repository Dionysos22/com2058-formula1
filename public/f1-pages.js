/** Page controllers — hydrate public HTML from /api/*. */
(function () {
  const { esc, formatRaceDate, fillYearSelect } = F1Util;

  async function initResultPage() {
    const yearSel = document.getElementById("select-year");
    const raceSel = document.getElementById("select-race");
    const content = document.getElementById("result-content");
    if (!yearSel || !raceSel || !content) return;

    let races = [];
    const params = new URLSearchParams(location.search);

    async function loadRaces(year) {
      races = await F1Api.races(year);
      raceSel.innerHTML = '<option value="all">All</option>';
      for (const r of races) {
        const opt = document.createElement("option");
        opt.value = r.round_number;
        opt.textContent = r.grand_prix_name;
        raceSel.appendChild(opt);
      }
    }

    function renderSeasonTable(year) {
      if (!races.length) {
        content.innerHTML = '<p class="result-empty">No races in database for this season.</p>';
        return;
      }
      const rows = races
        .map((r) => {
          const winner = r.winner ? esc(r.winner) : '<span style="color:#bbb">—</span>';
          return `<tr><td class="col-round">${r.round_number}</td><td class="col-gp">${esc(r.grand_prix_name)}</td><td class="col-winner">${winner}</td></tr>`;
        })
        .join("");
      content.innerHTML = `
        <h2 class="result-heading">${year} Race Results</h2>
        <table class="result-table"><thead><tr><th>RND</th><th>Grand Prix</th><th>Winner</th></tr></thead>
        <tbody>${rows}</tbody></table>`;
    }

    async function renderRaceDetail(year, round) {
      const race = races.find((r) => String(r.round_number) === String(round));
      if (!race) {
        content.innerHTML = '<p class="result-empty">Race not found.</p>';
        return;
      }
      const results = await F1Api.raceResults(year, round);
      if (!results.length) {
        content.innerHTML = `<h2 class="result-heading">${esc(race.grand_prix_name)}</h2><p class="result-empty">No results yet.</p>`;
        return;
      }
      const rows = results
        .map((r) => {
          const pos = r.finish_position;
          const posCell = pos ? `<td class="col-pos">${pos}</td>` : '<td class="col-pos"><span class="badge-dnf">DNF</span></td>';
          const cls = pos === 1 ? ' class="pos-1"' : "";
          return `<tr${cls}>${posCell}<td class="col-no">${r.car_no ?? "—"}</td><td class="col-driver">${esc(r.driver_name)}</td></tr>`;
        })
        .join("");
      content.innerHTML = `
        <h2 class="result-heading">${esc(race.grand_prix_name)} — Race Result</h2>
        <table class="result-table"><thead><tr><th>POS</th><th>NO</th><th>Driver</th></tr></thead>
        <tbody>${rows}</tbody></table>`;
    }

    async function render() {
      content.innerHTML = '<p class="result-empty">Loading…</p>';
      const year = Number(yearSel.value);
      const round = raceSel.value;
      try {
        if (round === "all") renderSeasonTable(year);
        else await renderRaceDetail(year, round);
      } catch (e) {
        content.innerHTML = `<p class="result-empty">Error: ${esc(e.message)}</p>`;
      }
    }

    yearSel.addEventListener("change", async () => {
      await loadRaces(Number(yearSel.value));
      raceSel.value = "all";
      await render();
    });
    raceSel.addEventListener("change", render);

    const year = await fillYearSelect(yearSel, params.get("year"));
    await loadRaces(year);
    if (params.get("round")) raceSel.value = params.get("round");
    await render();
  }

  async function initSchedulePage() {
    const list = document.getElementById("schedule-list");
    const yearSel = document.getElementById("schedule-year");
    if (!list) return;

    async function render(year) {
      list.innerHTML = '<p class="result-empty" style="padding:24px">Loading schedule…</p>';
      try {
        const races = await F1Api.races(year);
        if (!races.length) {
          list.innerHTML = `<p class="result-empty" style="padding:24px">No races for ${year}.</p>`;
          return;
        }
        list.innerHTML = races
          .map((r) => {
            const img = F1Meta.circuitImage(r.circuit_name);
            const href = `race-detail.html?year=${r.season_year}&round=${r.round_number}`;
            return `
              <a href="${href}" class="race-card-link">
                <article class="race-card">
                  <div class="race-card__header">
                    <span class="race-card__round">${r.round_number}</span>
                    <span class="race-card__country">${esc(r.country || r.circuit_name)}</span>
                    <span class="race-card__date">${formatRaceDate(r.race_start_date, r.race_end_date)}</span>
                  </div>
                  <p class="race-card__name">${esc(r.grand_prix_name)}</p>
                  <div class="race-card__circuit">
                    <img src="${esc(img)}" alt="${esc(r.circuit_name)}" class="race-card__circuit-img" />
                  </div>
                </article>
              </a>`;
          })
          .join("");
      } catch (e) {
        list.innerHTML = `<p class="result-empty">Error: ${esc(e.message)}</p>`;
      }
    }

    if (yearSel) {
      yearSel.addEventListener("change", () => render(Number(yearSel.value)));
      const year = await fillYearSelect(yearSel);
      await render(year);
    } else {
      const years = await F1Api.years();
      await render(years[years.length - 1] || 2024);
    }
  }

  async function initDriversPage() {
    const grid = document.getElementById("pilots-grid");
    const yearSel = document.getElementById("drivers-year");
    if (!grid) return;

    await F1Meta.loadPhotoRegistry();

    async function render(year) {
      grid.innerHTML = '<p class="result-empty">Loading drivers…</p>';
      try {
        const drivers = await F1Api.seasonDrivers(year);
        grid.innerHTML = drivers
          .map((d) => {
            const meta = F1Meta.team(d.constructor);
            const href = F1Meta.driverPage(d.forename, d.surname);
            const seat = d.seat_no ?? 1;
            const photo = F1Meta.driverPhoto(year, d.driver_id);
            const num = F1Meta.driverNumber(d.car_no, d.driver_code);
            const fallback = "formula-1-logo.png";
            return (
              '<a href="' + href + '" class="pilot-card pilot-card--' + meta.css + '">' +
              '<div class="pilot-card__info">' +
              '<div class="pilot-card__name-group">' +
              '<span class="pilot-card__firstname">' + esc(d.forename) + '</span>' +
              '<span class="pilot-card__lastname">' + esc(d.surname) + '</span>' +
              '<span class="pilot-card__team">' + esc(d.constructor) + '</span>' +
              '</div>' +
              '<span class="pilot-card__number">' + esc(num) + '</span>' +
              '</div>' +
              '<div class="pilot-card__photo-wrapper">' +
              '<img src="' + esc(photo) + '" alt="' + esc(d.forename + ' ' + d.surname) + '" class="pilot-card__photo" loading="lazy" decoding="async" ' +
              'onerror="this.onerror=null;this.src=\'' + fallback + '\';this.classList.add(\'pilot-card__photo--placeholder\')" />' +
              '</div></a>'
            );
          })
          .join("");
      } catch (e) {
        grid.innerHTML = '<p class="result-empty">Error: ' + esc(e.message) + '</p>';
      }
    }

    if (yearSel) {
      yearSel.addEventListener("change", () => render(Number(yearSel.value)));
      const year = await fillYearSelect(yearSel);
      await render(year);
    } else {
      const years = await F1Api.years();
      await render(years[years.length - 1] || 2024);
    }
  }

  async function initTeamsPage() {
    const grid = document.getElementById("teams-grid");
    const yearSel = document.getElementById("teams-year");
    if (!grid) return;

    async function render(year) {
      grid.innerHTML = '<p class="result-empty">Loading teams…</p>';
      try {
        const teams = await F1Api.teams(year);
        grid.innerHTML = teams
          .map((t) => {
            const meta = F1Meta.team(t.team_name);
            const pts = t.points != null ? t.points + " pts" : "";
            const pos = t.position != null ? "P" + t.position : "";
            return `
              <a href="${meta.page}" class="team-card team-card--${meta.css}">
                <div class="team-card__header">
                  <h2 class="team-card__name">${esc(t.team_name)}</h2>
                  <img src="${esc(meta.logo)}" alt="" class="team-card__logo" />
                </div>
                <p class="team-card__meta">${esc(pos)} ${esc(pts)}</p>
                <div class="team-card__car-wrapper">
                  <img src="${esc(meta.car)}" alt="" class="team-card__car" />
                </div>
              </a>`;
          })
          .join("");
      } catch (e) {
        grid.innerHTML = `<p class="result-empty">Error: ${esc(e.message)}</p>`;
      }
    }

    if (yearSel) {
      yearSel.addEventListener("change", () => render(Number(yearSel.value)));
      const year = await fillYearSelect(yearSel);
      await render(year);
    } else {
      const years = await F1Api.years();
      await render(years[years.length - 1] || 2024);
    }
  }

  async function initRaceDetailPage() {
    const params = new URLSearchParams(location.search);
    const year = Number(params.get("year"));
    const round = Number(params.get("round"));
    const heroRound = document.getElementById("race-hero-round");
    const heroName = document.getElementById("race-hero-name");
    const heroDate = document.getElementById("race-hero-date");
    const resultBody = document.getElementById("race-result-body");
    const showAll = document.getElementById("race-show-all");
    const circuitImg = document.getElementById("race-circuit-img");
    const circuitDl = document.getElementById("race-circuit-dl");
    if (!year || !round) return;

    try {
      const [race, results] = await Promise.all([F1Api.race(year, round), F1Api.raceResults(year, round)]);
      if (heroRound) heroRound.textContent = "Round " + round + " / " + year + " Season";
      if (heroName) heroName.textContent = race.grand_prix_name;
      if (heroDate) heroDate.textContent = formatRaceDate(race.race_start_date, race.race_end_date);
      if (showAll) showAll.href = "result.html?year=" + year + "&round=" + round;

      if (resultBody) {
        const top = results.slice(0, 10);
        resultBody.innerHTML = top.length
          ? top
              .map((r) => {
                const cls = r.finish_position === 1 ? ' class="pos-1"' : "";
                return "<tr" + cls + "><td class=\"col-pos\">" + (r.finish_position ?? "—") + "</td><td class=\"col-no\">" + (r.car_no ?? "—") + "</td><td class=\"col-driver\">" + esc(r.driver_name) + "</td></tr>";
              })
              .join("")
          : '<tr><td colspan="3" class="no-result">No results yet</td></tr>';
      }

      if (circuitImg) {
        circuitImg.src = F1Meta.circuitImage(race.circuit_name);
        circuitImg.alt = race.circuit_name;
      }
      if (circuitDl) {
        const km = race.length_m ? (race.length_m / 1000).toFixed(3) + " km" : "—";
        circuitDl.innerHTML =
          "<dt>Circuit</dt><dd>" + esc(race.circuit_name) + "</dd>" +
          "<dt>Country</dt><dd>" + esc(race.country || "—") + "</dd>" +
          "<dt>City</dt><dd>" + esc(race.city || "—") + "</dd>" +
          "<dt>Laps</dt><dd>" + (race.laps ?? "—") + "</dd>" +
          "<dt>Length</dt><dd>" + km + "</dd>" +
          "<dt>First GP</dt><dd>" + (race.first_gp_year ?? "—") + "</dd>";
      }
    } catch (e) {
      if (heroName) heroName.textContent = "Error: " + e.message;
    }
  }

  document.addEventListener("DOMContentLoaded", function () {
    const page = document.body.dataset.page;
    if (page === "result") initResultPage();
    if (page === "schedule") initSchedulePage();
    if (page === "drivers") initDriversPage();
    if (page === "teams") initTeamsPage();
    if (page === "race-detail") initRaceDetailPage();
  });
})();
