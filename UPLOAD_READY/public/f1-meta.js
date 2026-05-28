/** Static UI assets + team styling (photos/logos not in DB). */
const F1Meta = {
  teams: {
    Ferrari: { css: "ferrari", page: "ferrari.html", logo: "ferrari logo.png", car: "ferrari araba.avif", photo1: "ferrari 1.avif", photo2: "ferrari 2.avif" },
    "Aston Martin": { css: "aston-martin", page: "aston-martin.html", logo: "aston martin logo.png", car: "aston araba.avif", photo1: "aston 1.avif", photo2: "aston 2.avif" },
    "Racing Point": { css: "aston-martin", page: "aston-martin.html", logo: "aston martin logo.png", car: "aston araba.avif", photo1: "aston 1.avif", photo2: "aston 2.avif" },
    "Force India": { css: "aston-martin", page: "aston-martin.html", logo: "aston martin logo.png", car: "aston araba.avif", photo1: "aston 1.avif", photo2: "aston 2.avif" },
    Alpine: { css: "alpine", page: "alpine.html", logo: "Alpine logo.avif", car: "Alpine araba.avif", photo1: "alpine 1.avif", photo2: "alpine 2.avif" },
    Renault: { css: "alpine", page: "alpine.html", logo: "Alpine logo.avif", car: "Alpine araba.avif", photo1: "alpine 1.avif", photo2: "alpine 2.avif" },
    Audi: { css: "audi", page: "audi.html", logo: "audi logo.avif", car: "audi araba.avif", photo1: "audi 1.avif", photo2: "audi 2.avif" },
    Cadillac: { css: "cadillac", page: "cadillac.html", logo: "cadillac logo.avif", car: "cadillac araba.avif", photo1: "cadillac 1.avif", photo2: "cadillac 2.avif" },
    Haas: { css: "haas", page: "haas.html", logo: "haas logo.avif", car: "haas araba.avif", photo1: "haas 1.avif", photo2: "haas 2.avif" },
    McLaren: { css: "mclaren", page: "mclaren.html", logo: "mclaren logo.avif", car: "mclaren araba.avif", photo1: "mclaren 1.avif", photo2: "mclaren 2.avif" },
    Mercedes: { css: "mercedes", page: "mercedes.html", logo: "mercedes logo.avif", car: "mercedes araba.avif", photo1: "mercedes 1.avif", photo2: "mercedes 2.avif" },
    RB: { css: "racing-bulls", page: "racing-bulls.html", logo: "racing bulls logo.avif", car: "racing bulls araba.avif", photo1: "racing bulls 1.avif", photo2: "racing bulls 2.avif" },
    "Racing Bulls": { css: "racing-bulls", page: "racing-bulls.html", logo: "racing bulls logo.avif", car: "racing bulls araba.avif", photo1: "racing bulls 1.avif", photo2: "racing bulls 2.avif" },
    AlphaTauri: { css: "racing-bulls", page: "racing-bulls.html", logo: "racing bulls logo.avif", car: "racing bulls araba.avif", photo1: "racing bulls 1.avif", photo2: "racing bulls 2.avif" },
    "Toro Rosso": { css: "racing-bulls", page: "racing-bulls.html", logo: "racing bulls logo.avif", car: "racing bulls araba.avif", photo1: "racing bulls 1.avif", photo2: "racing bulls 2.avif" },
    "Red Bull": { css: "red-bull", page: "red-bull.html", logo: "red bull logo.avif", car: "red bull araba.avif", photo1: "red bull 1.avif", photo2: "red bull 2.avif" },
    Williams: { css: "williams", page: "williams.html", logo: "williams logo.avif", car: "williams araba.avif", photo1: "williams 1.avif", photo2: "williams 2.avif" },
    "Kick Sauber": { css: "williams", page: "williams.html", logo: "williams logo.avif", car: "williams araba.avif", photo1: "williams 1.avif", photo2: "williams 2.avif" },
    Sauber: { css: "williams", page: "williams.html", logo: "williams logo.avif", car: "williams araba.avif", photo1: "williams 1.avif", photo2: "williams 2.avif" },
    "Alfa Romeo": { css: "williams", page: "williams.html", logo: "williams logo.avif", car: "williams araba.avif", photo1: "williams 1.avif", photo2: "williams 2.avif" },
    Lotus: { css: "williams", page: "williams.html", logo: "williams logo.avif", car: "williams araba.avif", photo1: "williams 1.avif", photo2: "williams 2.avif" },
    Manor: { css: "williams", page: "williams.html", logo: "williams logo.avif", car: "williams araba.avif", photo1: "williams 1.avif", photo2: "williams 2.avif" },
    Marussia: { css: "williams", page: "williams.html", logo: "williams logo.avif", car: "williams araba.avif", photo1: "williams 1.avif", photo2: "williams 2.avif" },
  },

  circuitImages: {
    Melbourne: "1melbournedetailed.avif",
    Shanghai: "2shanghaidetailed.avif",
    Suzuka: "3suzukadetailed.avif",
    Miami: "4miamidetailed.avif",
    "Gilles Villeneuve": "5montrealdetailed.avif",
    Monaco: "6montecarlodetailed.avif",
    Catalunya: "7catalunyadetailed.avif",
    "Red Bull Ring": "8spielbergdetailed.avif",
    Silverstone: "9silverstonedetailed.avif",
    "Spa-Francorchamps": "10spafrancorchampsdetailed.avif",
    Hungaroring: "11hungaroringdetailed.avif",
    Zandvoort: "12zandvoortdetailed.avif",
    Monza: "13monzadetailed.avif",
    Americas: "17austindetailed.avif",
    Baku: "15bakudetailed.avif",
    "Marina Bay": "16singaporedetailed.avif",
    "Hermanos Rodr": "18mexicocitydetailed.avif",
    "Jos": "19interlagosdetailed.avif",
    "Carlos Pace": "19interlagosdetailed.avif",
    "Las Vegas": "20lasvegasdetailed.avif",
    Lusail: "21lusaildetailed.avif",
    "Yas Marina": "22yasmarinacircuitdetailed.avif",
    Bahrain: "1melbournedetailed.avif",
    Jeddah: "15bakudetailed.avif",
    Sepang: "3suzukadetailed.avif",
    Hockenheimring: "7catalunyadetailed.avif",
    Nurburgring: "7catalunyadetailed.avif",
    Istanbul: "7catalunyadetailed.avif",
    Sochi: "7catalunyadetailed.avif",
    Portimao: "7catalunyadetailed.avif",
    Mugello: "13monzadetailed.avif",
    "Paul Ricard": "6montecarlodetailed.avif",
  },

  team(name) {
    return (
      this.teams[name] || {
        css: "mclaren",
        page: "teams.html",
        logo: "formula-1-logo.png",
        car: "mclaren araba.avif",
        photo1: "mclaren 1.avif",
        photo2: "mclaren 2.avif",
      }
    );
  },

  /** Team slot fallback when no year-specific photo in registry. */
  teamDriverPhoto(teamName, seatNo) {
    const meta = this.team(teamName);
    return Number(seatNo) === 2 ? meta.photo2 : meta.photo1;
  },

  _photoRegistry: null,
  _photoRegistryPromise: null,

  /** Load public/f1-photo-registry.json (run scripts/build_photo_registry.py). */
  loadPhotoRegistry() {
    if (this._photoRegistry) return Promise.resolve(this._photoRegistry);
    if (this._photoRegistryPromise) return this._photoRegistryPromise;
    this._photoRegistryPromise = fetch("f1-photo-registry.json")
      .then((r) => {
        if (!r.ok) throw new Error("Photo registry not found");
        return r.json();
      })
      .then((data) => {
        this._photoRegistry = data;
        return data;
      })
      .catch(() => {
        this._photoRegistry = { by_year: {} };
        return this._photoRegistry;
      });
    return this._photoRegistryPromise;
  },

  /** Year + driver_id photo from registry (local path or Wikimedia URL). */
  driverPhoto(year, driverId) {
    const y = String(year);
    const id = String(driverId);
    const entry = this._photoRegistry?.by_year?.[y]?.[id];
    if (entry?.photo) return entry.photo;
    return "formula-1-logo.png";
  },

  driverSlug(forename, surname) {
    const s = String(surname || "")
      .normalize("NFD")
      .replace(/[\u0300-\u036f]/g, "")
      .replace(/\s+(Jr\.?|Sr\.?)$/i, "")
      .trim();
    return F1Util.slugify(forename) + "-" + F1Util.slugify(s);
  },

  driverNumber(carNo, driverCode) {
    if (carNo != null && carNo !== "") return String(carNo);
    return driverCode || "";
  },

  circuitImage(circuitName) {
    if (!circuitName) return "formula-1-logo.png";
    for (const [key, file] of Object.entries(this.circuitImages)) {
      if (circuitName.includes(key) || key.includes(circuitName)) return file;
    }
    return "formula-1-logo.png";
  },

  driverPage(forename, surname) {
    return this.driverSlug(forename, surname) + ".html";
  },
};

window.F1Meta = F1Meta;
