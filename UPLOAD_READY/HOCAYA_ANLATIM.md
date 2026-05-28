## COM2058 – Formula 1 Projesi (Sunumsuz Anlatım Belgesi)

Bu belge, hocanın istediği şekilde “sunum değil; oturup neyin neden olduğunu, sorguları (queries) ve sistemin nasıl çalıştığını” anlatmak için hazırlanmıştır.

### 1) Projenin amacı ve mini-world

Amaç: Formula 1 şampiyonasına ait **sezonlar, takımlar, pilotlar, pistler, yarışlar ve yarış sonuçları** üzerinden istatistik üretmek ve bunu web arayüzünde göstermek.

- **Sezon (SEASON)**: \(season\_year \ge 1950\)
- **Takım (TEAM)**: benzersiz `team_id`, isim ve opsiyonel metadata
- **Pilot (DRIVER)**: benzersiz `driver_id`, `driver_code`, `car_no`, ülke vb.
- **Pist (CIRCUIT)**: `circuit_id`, isim, ülke/şehir ve pist metrikleri
- **Yarış (RACE)**: sezon içindeki tur/round ile tanımlanır
- **Sonuç (RESULTS)**: yarış–pilot eşlemesi; grid/finish/points
- **Sözleşme / Roster (CONTRACTS)**: sezon–takım–pilot; `role` ve `seat_no`
- **Takım sıralaması (STANDINGS)**: sezon–takım; `season_position`, `season_points`

Bu mini-world, `Requirements.md` ve `ERD.pdf` (Chen) üzerinden modellenip MySQL’de uygulanmıştır.

### 2) Şema tasarımı: neden böyle?

#### 2.1 Weak Entity: `races`

F1’de yarış, bir sezon içinde “round” ile anlam kazanır. Bu yüzden `races` tablosu **zayıf varlık** gibi ele alınır:

- **PK**: `(season_year, round_number)`
- **FK**: `season_year -> seasons`, `circuit_id -> circuits`

Bu tasarım, “aynı pistte farklı yıllarda farklı yarışlar” gibi durumları net ayırır ve sorguları basitleştirir.

#### 2.2 Ternary ilişki: `team_drivers`

Pilot bir sezonda bir takıma bağlıdır ve aynı pilot farklı sezonda farklı takıma geçebilir. Bu nedenle “pilot–takım” tek başına yetmez; **sezon boyutu** gerekir.

`team_drivers(season_year, team_id, driver_id, role, seat_no)`:

- Sezon bazlı roster, seat dağılımı, MAIN/RESERVE gibi kurallar burada tutulur.
- UI’de pilot fotoğrafları da bu roster üzerinden (yıl/pilot) bağlanır.

#### 2.3 Sonuçlar: `race_results`

`race_results(season_year, round_number, driver_id, grid_position, finish_position, points)`:

- Bir yarışta bir pilota ait grid/finish/points gibi ölçümler burada.
- `races` ile composite FK ilişkisi var.

### 3) Uygulama mimarisi (Backend + Frontend)

- **MySQL 8**: `Formula_1.sql` (DDL) + `db/init/02_seed_data.sql` (seed, 2015–2025)
- **FastAPI (raw SQL)**: `app/routes_*.py` dosyalarında ORM yok; her endpoint SQL çalıştırır.
- **Frontend**: `public/` altında statik site; sayfalar `public/f1-api.js` ile `/api/*` çağırıp DOM’u doldurur.

Çalıştırma özeti:

```bash
docker compose up -d
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

### 4) Hocanın soracağı “neden” soruları için kritik noktalar

- **Neden composite key?** Yarışın kimliği sezon+round’dur; tek `race_id` yerine doğal anahtar.
- **Neden `team_drivers` ayrı?** Pilot transferleri + seat/role kuralı sezonla birlikte tutulmalı.
- **Neden raw SQL?** Ders gereği; endpoint’ler birebir SQL ile raporlanabilir.
- **Neden bazı değerler “derived ama stored”?** `drivers.num_poles/num_podiums/num_championships` gibi sayaçlar raporlama için hızlı okuma sağlar (denormalizasyon bilinçli).

### 5) 12 örnek sorgu (SAMPLE_QUERIES.sql) — Ne gösteriyorlar?

Bu sorguların her biri “şema doğru mu, ilişkiler çalışıyor mu, istenen bilgi üretilebiliyor mu?” sorusuna cevap verir.

1. **Sezonun yarışları**: `races` + `circuits` join; kronolojik liste.
2. **Constructor standings (hesaplı)**: `race_results` + `team_drivers` ile takım puanı toplanır; `DENSE_RANK()` ile sıra.
3. **Bir pilotun tüm yarışları**: driver filter + race join; grid/finish/points.
4. **Takım roster**: `team_drivers` + `drivers`; role/seat dağılımı.
5. **Bir pistin tüm GP eventleri**: `races` filtre `circuit_id`.
6. **Pilot kariyer sayaçları**: `drivers` tablosundaki derived alanlar.
7. **Pilot şampiyona standings (hesaplı)**: `race_results` aggregation + ranking.
8. **Belirli yarışın podyumu**: finish_position 1–3 + takım join.
9. **Ülkeye göre pist sayısı + toplam yarış**: circuits left join races; group by country.
10. **Stored team_standings cache**: `team_standings` üzerinden sezon takım sıralaması.
11. **Bir pistteki yarış kazananları**: finish_position=1 join ile winner listesi.
12. **Sezonda takım baş pilotları + araç numarası**: `team_drivers` MAIN + seat.

### 6) Fotoğraf konusu (yıl yıl değişmeli)

Bu projede driver kartı fotoğrafları DB’de tutulmadığı için “yıl–pilot” fotoğraf eşlemesi ayrı bir registry ile yapılır:

- Registry: `public/f1-photo-registry.json`
- Cache: `public/photos/{year}/{driver_id}.jpg`
- Üretim: `python scripts/build_photo_registry.py`

Not: Bazı pilotlar için uygun, yıl-uyumlu fotoğraf otomatik bulunamayabilir; bu durumda UI `formula-1-logo.png` placeholder gösterir. (Ders kapsamında lisans/asset kısıtı nedeniyle “her pilot her yıl %100 foto” garanti edilemeyebilir.)

### 7) Kısa “demo anlatım akışı” (hocaya)

- `ERD.pdf`’i aç → weak entity `RACE` ve ternary `CONTRACTS` göster.
- `SAMPLE_QUERIES.sql`’den 2–3 sorgu seç:
  - Query 1 (races list): composite key mantığını anlat.
  - Query 2/7 (standings): aggregation + ranking; “veri nasıl istatistiğe dönüyor?”
  - Query 4/12 (roster): `team_drivers` neden var?
- Son olarak browser:
  - `http://localhost:8000/result.html` → sezon + round seç → `/api/races` + `/api/races/{year}/{round}/results`
  - `http://localhost:8000/drivers.html` → yıl değiştir → `/api/seasons/{year}/drivers`

