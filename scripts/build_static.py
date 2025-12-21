from __future__ import annotations

import csv
import html
import pathlib
from datetime import datetime
from typing import Dict, List, Tuple

from jinja2 import Environment, FileSystemLoader, select_autoescape
from markupsafe import Markup, escape

# Paths
ROOT = pathlib.Path(__file__).resolve().parent.parent
DB_DIR = ROOT / "db"
OUT_DIR = ROOT / "out"
TEMPLATE_DIR = ROOT / "templates"
POST_TEMPLATE = "post.html"
HOME_TEMPLATE = "home.html"
CATEGORY_TEMPLATE = "category.html"
BASE_URL = "https://www.fimoculous.com"
YEAR_REVIEW_PAGES = [
    "year-review-2003.cfm",
    "year-review-2004.cfm",
    "year-review-2005.cfm",
    "year-review-2006.cfm",
    "year-review-2007.cfm",
    "year-review-2008.cfm",
    "year-review-2009.cfm",
    "year-review-2010.cfm",
]
END_OF_YEAR_CATEGORY_ORDER = [
    "advertising",
    "architecture",
    "art",
    "automobiles",
    "books",
    "business",
    "comedy",
    "comics",
    "dance",
    "design",
    "dvd",
    "fashion",
    "education",
    "film",
    "food",
    "gadgets",
    "games",
    "ideas",
    "media",
    "miscellaneous",
    "music",
    "online",
    "paranormal",
    "people",
    "photos",
    "politics",
    "religion",
    "sports",
    "science",
    "sex",
    "tech",
    "theater",
    "toys",
    "travel",
    "tv",
    "musicvideos",
    "words",
]


def normalize_date(raw: str) -> Tuple[str, object]:
    """Return (display_string, datetime or raw) for a CSV datetime value."""
    raw = (raw or "").strip()
    if not raw:
        return "", ""
    for fmt in ("%m/%d/%y %H:%M:%S", "%m/%d/%Y %H:%M:%S"):
        try:
            dt = datetime.strptime(raw, fmt)
        except ValueError:
            continue
        return dt.strftime("%Y-%m-%d %H:%M:%S"), dt
    return raw, raw


def load_categories() -> Tuple[Dict[str, str], Dict[str, List[str]]]:
    """Load category labels and entry->categories mapping."""
    cats: Dict[str, str] = {}
    with (DB_DIR / "tblCategories.csv").open(newline="", encoding="utf-8") as f:
        for row in csv.DictReader(f):
            key = (row.get("cat_short") or "").strip()
            if not key:
                continue
            cats[key.lower()] = (row.get("cat_long") or key).strip()

    entry_cats: Dict[str, List[str]] = {}
    with (DB_DIR / "tblCategoriesContent.csv").open(
        newline="", encoding="utf-8"
    ) as f:
        for row in csv.DictReader(f):
            coid = (row.get("coid") or "").strip()
            cat = (row.get("category") or "").strip()
            if not coid or not cat:
                continue
            entry_cats.setdefault(coid, []).append(cat.lower())

    return cats, entry_cats


def load_comments() -> Dict[str, List[dict]]:
    """Load comments keyed by entry id."""
    comments: Dict[str, List[dict]] = {}
    with (DB_DIR / "tblComments.csv").open(newline="", encoding="utf-8") as f:
        for row in csv.DictReader(f):
            entry_id = (row.get("comEntryID") or "").strip()
            if not entry_id:
                continue
            display_date, sort_key = normalize_date(row.get("comDate") or "")
            body = row.get("comComment") or ""
            comments.setdefault(entry_id, []).append(
                {
                    "name": (row.get("comName") or "Anonymous").strip() or "Anonymous",
                    "url": (row.get("comURL") or "").strip() or None,
                    "body_html": Markup(escape(body).replace("\n", "<br />\n")),
                    "date": display_date,
                    "sort": sort_key,
                }
            )

    for rows in comments.values():
        rows.sort(key=lambda c: c["sort"])
    return comments


def parse_end_of_year_date(raw: str) -> datetime | None:
    raw = (raw or "").strip()
    if not raw:
        return None
    for fmt in ("%m/%d/%y %H:%M:%S", "%m/%d/%Y %H:%M:%S", "%m/%d/%y", "%m/%d/%Y"):
        try:
            return datetime.strptime(raw, fmt)
        except ValueError:
            continue
    return None


def load_end_of_year_entries(year: int) -> List[dict]:
    """Load end-of-year list entries for a given year."""
    entries: List[dict] = []
    start = datetime(year, 9, 1)
    end = datetime(year + 1, 4, 1)
    with (DB_DIR / "tblEndOfYear.csv").open(newline="", encoding="utf-8") as f:
        for row in csv.DictReader(f):
            dt = parse_end_of_year_date(row.get("mydate") or "")
            if not dt or not (start <= dt < end):
                continue
            category = (row.get("category") or "").strip()
            if not category:
                continue
            entries.append(
                {
                    "category": category,
                    "source": (row.get("source") or "").strip(),
                    "listname": (row.get("listname") or "").strip(),
                    "link": (row.get("link") or "").strip(),
                    "date": dt,
                }
            )
    return entries


def render_year_review_page(entries: List[dict], year: int) -> str:
    """Render a static year-in-review page (categories + sorts)."""
    # Group by category
    grouped: Dict[str, List[dict]] = {c: [] for c in END_OF_YEAR_CATEGORY_ORDER}
    for entry in entries:
        key = entry["category"].lower()
        grouped.setdefault(key, []).append(entry)
    for rows in grouped.values():
        rows.sort(key=lambda e: e["date"], reverse=True)

    chron_sorted = sorted(entries, key=lambda e: e["date"], reverse=True)
    source_sorted = sorted(entries, key=lambda e: (e["source"].lower(), e["listname"].lower()))

    def render_rows(rows: List[dict]) -> str:
        parts: List[str] = []
        for e in rows:
            date_str = e["date"].strftime("%m/%d/%y")
            parts.append(
                f'<div class="catrowsshrt"><div class="list"><a href="{html.escape(e["link"])}"><strong>{html.escape(e["listname"])}</strong></a></div>'
                f'<div class="source">{html.escape(e["source"])}</div>'
                f'<div class="datelist">{date_str}</div></div>'
            )
        return "\n".join(parts)

    category_blocks: List[str] = []
    for cat in END_OF_YEAR_CATEGORY_ORDER:
        rows = grouped.get(cat, [])
        if not rows:
            continue
        anchor = html.escape(cat)
        display_cat = "musicvideos" if cat == "musicvideos" else cat
        category_blocks.append(
            "\n".join(
                [
                    f'<a name="{anchor}"></a>',
                    '<hr style="border: 1px dotted #CCCCCC;width:100%;" />',
                    f'<div class="categorylong">{html.escape(display_cat)}</div>',
                    f'<div class="totallists">{len(rows)} lists</div>',
                    render_rows(rows),
                    "<br clear=\"all\" />",
                ]
            )
        )

    chron_block = render_rows(chron_sorted)
    source_block = render_rows(source_sorted)

    # Simple JS toggles sections to mimic ?chron and ?source behavior
    html_parts = [
        '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">',
        "<html>",
        "<head>",
        f"<title>{year} Year Lists - Fimoculous.com</title>",
        '<link rel="stylesheet" type="text/css" href="/styles/fimostyles_ideal.css">',
        "<style>",
        ".mode{display:none;} .catrowsshrt{margin:4px 0;}",
        ".list{float:left;width:60%;}",
        ".source{float:left;width:25%;}",
        ".datelist{float:left;width:15%;text-align:right;}",
        ".sortnav{margin:10px 0;padding:8px 0;border-top:1px dotted #ccc;border-bottom:1px dotted #ccc;}",
        "</style>",
        "</head>",
        "<body>",
        '<div style="max-width:900px;margin:0 auto;padding:10px;">',
        '<h1 style="margin-bottom:6px;">LISTS: {}</h1>'.format(year),
        '<p><em>This page aggregates all of the lists related to {}.</em></p>'.format(year),
        '<div class="sortnav">Sort: <a href="?">category</a> | <a href="?source">source</a> | <a href="?chron">date</a></div>',
        '<div id="mode-cat" class="mode">',
        "\n".join(category_blocks),
        "</div>",
        '<div id="mode-source" class="mode">',
        f"<div class=\"totallists\">{len(source_sorted)} lists</div>",
        source_block,
        "</div>",
        '<div id="mode-chron" class="mode">',
        f"<div class=\"totallists\">{len(chron_sorted)} lists</div>",
        chron_block,
        "</div>",
        '<hr style="border: 1px dotted #CCCCCC;width:100%;" />',
        '<p><strong>PREVIOUS YEARS</strong>: '
        '<a href="/year-review-2009.cfm">2009</a> | '
        '<a href="/year-review-2008.cfm">2008</a> | '
        '<a href="/year-review-2007.cfm">2007</a> | '
        '<a href="/year-review-2006.cfm">2006</a> | '
        '<a href="/year-review-2005.cfm">2005</a> | '
        '<a href="/year-review-2004.cfm">2004</a> | '
        '<a href="/year-review-2003.cfm">2003</a> | '
        '<a href="/year-review.cfm">2001</a></p>',
        "</div>",
        "<script>",
        "const params=new URLSearchParams(location.search);",
        "const mode=params.has('chron')?'chron':(params.has('source')?'source':'cat');",
        "document.getElementById('mode-'+mode).style.display='block';",
        "const cat=params.get('cat');",
        "if(cat){const el=document.getElementsByName(cat.toLowerCase())[0]; if(el){el.scrollIntoView();}}",
        "</script>",
        "</body>",
        "</html>",
    ]
    return "\n".join(html_parts)


def build():
    env = Environment(
        loader=FileSystemLoader(TEMPLATE_DIR),
        autoescape=select_autoescape(["html", "xml", "cfm"]),
    )
    template = env.get_template(POST_TEMPLATE)
    home_template = env.get_template(HOME_TEMPLATE)
    category_template = env.get_template(CATEGORY_TEMPLATE)

    cats, entry_cats = load_categories()
    comments = load_comments()

    archive_dir = OUT_DIR / "archive"
    archive_dir.mkdir(parents=True, exist_ok=True)

    count = 0
    home_posts: List[dict] = []
    sitemap_urls: List[Tuple[str, str]] = []  # (loc, lastmod)
    cat_posts: Dict[str, List[dict]] = {}

    with (DB_DIR / "tblContent.csv").open(newline="", encoding="utf-8") as f:
        for row in csv.DictReader(f):
            entry_id = (row.get("entrynumber") or "").strip()
            if not entry_id:
                continue

            body_html = Markup(row.get("entry") or "")
            title = (row.get("title") or f"Post {entry_id}").strip()
            display_date, date_obj = normalize_date(row.get("thisdate") or "")

            datebox = ""
            date_year = ""
            if isinstance(date_obj, datetime):
                # Mimic ColdFusion DateFormat(thisdate,"MMM d") + lowercase
                month_day = date_obj.strftime("%b %d").replace(" 0", " ")
                datebox = month_day.lower()
                date_year = date_obj.strftime("%Y")

            cat_codes = [c for c in entry_cats.get(entry_id, []) if c]
            cat_labels = [cats.get(code.lower()) or code for code in cat_codes]

            post_comments = comments.get(entry_id, [])

            rendered = template.render(
                entry_id=entry_id,
                title=title,
                date=display_date,
                datebox=datebox,
                date_year=date_year,
                category_tags=cat_codes,
                categories=[c for c in cat_labels if c],
                body=body_html,
                comments=post_comments,
                comment_count=len(post_comments),
            )

            out_path = archive_dir / f"post-{entry_id}.cfm"
            out_path.write_text(rendered, encoding="utf-8")
            count += 1

            # Sitemap entry for post
            lastmod = ""
            if isinstance(date_obj, datetime):
                lastmod = date_obj.strftime("%Y-%m-%d")
            sitemap_urls.append(
                (f"{BASE_URL}/archive/post-{entry_id}.cfm", lastmod)
            )

            # Track posts by category for category pages
            cat_codes_lower = [c.lower() for c in cat_codes]
            for code in cat_codes_lower:
                cat_posts.setdefault(code, []).append(
                    {
                        "entry_id": entry_id,
                        "title": title,
                        "body": body_html,
                        "datebox": datebox,
                        "date_year": date_year,
                        "commentnum": (row.get("commentnum") or "").strip(),
                        "categories": cat_codes_lower,
                    }
                )

            # Collect for homepage (filter out specific categories)
            banned = {"convo", "mp3"}
            cat_codes_lower = [c.lower() for c in cat_codes]
            if any(c in banned for c in cat_codes_lower):
                continue
            try:
                entry_num_int = int(entry_id)
            except ValueError:
                entry_num_int = 0
            # Prepare homepage metadata
            if isinstance(date_obj, datetime):
                home_datebox = date_obj.strftime("%A").lower()
                home_year = date_obj.strftime("%Y")
            else:
                home_datebox = ""
                home_year = ""

            home_posts.append(
                {
                    "entry_id": entry_id,
                    "entry_num_int": entry_num_int,
                    "title": title,
                    "body": body_html,
                    "categories": cat_codes_lower,
                    "commentnum": (row.get("commentnum") or "").strip(),
                    "datebox": home_datebox,
                    "date_year": home_year,
                }
            )

    print(f"Rendered {count} posts to {archive_dir}")

    # Build homepage with latest 20 posts (excluding banned categories)
    home_posts.sort(key=lambda p: p["entry_num_int"], reverse=True)
    latest = home_posts[:20]

    home_rendered = home_template.render(posts=latest)

    (OUT_DIR / "index.html").write_text(home_rendered, encoding="utf-8")

    # Category pages
    for code, posts in cat_posts.items():
        posts.sort(key=lambda p: int(p["entry_id"]))
        posts.reverse()
        cat_path = OUT_DIR / "archive" / "cat" / code
        cat_path.mkdir(parents=True, exist_ok=True)
        rendered_cat = category_template.render(
            category=code,
            posts=posts,
        )
        (cat_path / "index.html").write_text(rendered_cat, encoding="utf-8")
        sitemap_urls.append((f"{BASE_URL}/archive/cat/{code}/", ""))

    # Legacy archivetemplate.cfm handler: JS redirect based on ?cat=
    archivetemplate_html = """<!DOCTYPE html>
<html><head><meta charset="utf-8"><title>Archive</title>
<meta http-equiv="refresh" content="0;url=/archive/">
<script>
(function() {
  var p = new URLSearchParams(window.location.search);
  var cat = (p.get("cat") || "").toLowerCase();
  if (cat) {
    window.location.replace("/archive/cat/" + encodeURIComponent(cat) + "/");
  } else {
    window.location.replace("/archive/");
  }
})();
</script>
</head><body>
<p>If you are not redirected, <a href="/archive/">go to the archive</a>.</p>
</body></html>
"""
    (OUT_DIR / "archive" / "archivetemplate.cfm").write_text(
        archivetemplate_html, encoding="utf-8"
    )

    # Legacy year-in-review pages (ship as-is)
    for filename in YEAR_REVIEW_PAGES:
        if filename == "year-review-2010.cfm":
            continue  # we generate a static replacement below
        src = ROOT / filename
        if not src.exists():
            print(f"Skipping missing legacy file: {filename}")
            continue
        dest = OUT_DIR / filename
        dest.parent.mkdir(parents=True, exist_ok=True)
        dest.write_bytes(src.read_bytes())
        sitemap_urls.append((f"{BASE_URL}/{filename}", ""))

    # Static rebuild of 2010 year-in-review (removes ColdFusion dependency)
    entries_2010 = load_end_of_year_entries(2010)
    if entries_2010:
        rendered_2010 = render_year_review_page(entries_2010, 2010)
        out_2010 = OUT_DIR / "year-review-2010.cfm"
        out_2010.write_text(rendered_2010, encoding="utf-8")
        sitemap_urls.append((f"{BASE_URL}/year-review-2010.cfm", ""))
    else:
        print("Warning: no end-of-year data found for 2010; page not generated.")

    # Sitemap (homepage + posts + categories)
    sitemap_lines = [
        '<?xml version="1.0" encoding="UTF-8"?>',
        '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">',
    ]
    sitemap_lines.append("<url>")
    sitemap_lines.append(f"<loc>{BASE_URL}/</loc>")
    sitemap_lines.append("</url>")
    for loc, lastmod in sitemap_urls:
        sitemap_lines.append("<url>")
        sitemap_lines.append(f"<loc>{loc}</loc>")
        if lastmod:
            sitemap_lines.append(f"<lastmod>{lastmod}</lastmod>")
        sitemap_lines.append("</url>")
    sitemap_lines.append("</urlset>")
    (OUT_DIR / "sitemap.xml").write_text("\n".join(sitemap_lines), encoding="utf-8")


if __name__ == "__main__":
    build()

