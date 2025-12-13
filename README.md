# fimoculous.com (static rebuild)

This repo contains the legacy Fimoculous site and a Python generator that renders static `.cfm` pages from the Access/CSV export.

## Build (local)
```
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
.venv/bin/python scripts/build_static.py
cp -R images styles rss mp3 favicon.ico favicon.png robots.txt _headers out/
```
Output lives in `out/` (ignored by git). Pages keep legacy URLs like `/archive/post-5738.cfm`.

## Cloudflare Pages
- Build command:  
  `pip install -r requirements.txt && python3 scripts/build_static.py && cp -R images styles rss mp3 favicon.ico favicon.png robots.txt _headers out/ && find out/mp3 -type f -size +25M -delete`
- Output directory: `out`
- Optional: add `_headers` (copied into `out/`) to force `Content-Type: text/html` for `.cfm`.

## Data
- Access DB: `db/fimo1.mdb` (source)
- CSV exports: `db/*.csv` (used by the generator)

## Generator
- `scripts/build_static.py` loads CSVs, renders `templates/post.html` via Jinja2, and writes `out/archive/post-{id}.cfm`.

