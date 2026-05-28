/** Shared API client for F1 public site (MySQL via FastAPI). */
const F1Api = {
  async get(path) {
    const res = await fetch(path);
    if (!res.ok) {
      throw new Error(`${path} → HTTP ${res.status}`);
    }
    return res.json();
  },

  years() {
    return this.get("/api/years?max_year=2100");
  },

  races(year) {
    return this.get(`/api/races?year=${year}`);
  },

  race(year, round) {
    return this.get(`/api/races/${year}/${round}`);
  },

  raceResults(year, round) {
    return this.get(`/api/races/${year}/${round}/results`);
  },

  seasonDrivers(year) {
    return this.get(`/api/seasons/${year}/drivers`);
  },

  teams(year) {
    return this.get(`/api/teams?year=${year}`);
  },

  team(teamId, year) {
    return this.get(`/api/teams/${teamId}?year=${year}`);
  },

  driverCareer(driverId) {
    return this.get(`/api/drivers/${driverId}/career`);
  },

  driverResults(driverId, year) {
    const q = year ? `?year=${year}` : "";
    return this.get(`/api/drivers/${driverId}/results${q}`);
  },

  driverStandings(year) {
    return this.get(`/api/standings/drivers?year=${year}`);
  },

  constructorStandings(year) {
    return this.get(`/api/standings/constructors?year=${year}`);
  },
};

function esc(s) {
  return String(s ?? "")
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;");
}

function slugify(name) {
  return String(name)
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-|-$/g, "");
}

function formatRaceDate(start, end) {
  if (!start) return "TBC";
  const s = new Date(start + "T12:00:00");
  const months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
  const d1 = String(s.getDate()).padStart(2, "0");
  if (!end || end === start) {
    return `${d1} ${months[s.getMonth()]}`;
  }
  const e = new Date(end + "T12:00:00");
  const d2 = String(e.getDate()).padStart(2, "0");
  return `${d1} - ${d2} ${months[s.getMonth()]}`;
}

async function fillYearSelect(select, preferred) {
  const years = await F1Api.years();
  select.innerHTML = "";
  const list = years.length ? years : [new Date().getFullYear()];
  for (const y of [...list].reverse()) {
    const opt = document.createElement("option");
    opt.value = y;
    opt.textContent = y;
    select.appendChild(opt);
  }
  const pick = preferred && list.includes(Number(preferred)) ? preferred : list[list.length - 1];
  select.value = pick;
  return Number(select.value);
}

window.F1Api = F1Api;
window.F1Util = { esc, slugify, formatRaceDate, fillYearSelect };
