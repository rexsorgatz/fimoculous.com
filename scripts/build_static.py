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
YEAR_REVIEW_WINDOWS = {
    2010: ("9/1/2010", "4/1/2011"),
    2009: ("9/1/2009", "4/1/2010"),
    2008: ("9/1/2008", "4/1/2009"),
    2007: ("5/1/2007", "5/1/2008"),
    2006: ("6/1/2006", "6/1/2007"),
    2005: ("6/1/2005", "6/1/2006"),
    2004: ("1/1/2004", "1/1/2005"),
}
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
HEADER_HTML = """<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Fimoculous.com</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="content-language" content="en-us" />
<meta name="keywords" lang="en-us" content="rex sorgatz, fimoculous, blog, blogger, rex, sorgatz, media, community, urban, parasite" />
<meta name="description" content="Rex Sorgatz' website, feeding on internet culture." />
<meta name="author" content="Rex Sorgatz" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="canonical" href="https://www.fimoculous.com/" />
<link rel="icon" type="image/png" href="http://www.fimoculous.com/favicon.png">
<link rel="alternate" type="application/rss+xml" title="Fimoculous" href="http://www.fimoculous.com/rss/rss.xml" />
<link rel="stylesheet" type="text/css" href="/styles/styles4.css?ver=4">
<script language="JavaScript" src="/styles/scripts.js" type="text/javascript"></script>
<script type="text/javascript">var _sf_startpt=(new Date()).getTime()</script>
<!--[if IE]>
<style>
.post .datebox { margin-top: -12px; }
#footer #footer-content #dot-icon img { margin-top: 10px; }
#transparent { width: 0; height: 0; }
</style>
<![endif]-->
</head>
"""

FOOTER_HTML = """
<div id="footer">
        <div id="footer-content">
        <h1><span class="firstletter">R</span>ex <span class="firstletter">S</span>orgatz</h1>
        <p><a href="http://kindasortamedia.com/">Company</a> <img src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="2" border="0"> <a href="http://fimoculous.tumblr.com/">Tumblr</a> <img src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="2" border="0"> <a href="http://vyou.com/rexsorgatz">VYou</a> <img src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="2" border="0"> <a href="http://twitter.com/fimoculous">Twitter</a> <img src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="2" border="0"> <a href="https://plus.google.com/113068441549452664746/posts">Google+</a> <br/> <a href="http://www.facebook.com/rexsorgatz">Facebook</a> <img src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="2" border="0"> <a href="http://statigr.am/rexsorgatz">Instagram</a> <img src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="2" border="0"> <a href="http://www.flickr.com/photos/fimoculous/">Flickr</a> <img src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="2" border="0"> <a href="http://amazon.com/o/registry/3KKN9EH42V9T4/">Amazon</a> <img src="/images/dot.png" alt="" width="5" height="5" hspace="0" vspace="2" border="0"> <a href="http://foursquare.com/fimoculous">Foursquare</a></p>
        <p><a href="mailto:rex@fimoculous.com?subject=Fimoculous&body=Your%20blog%20is%20dumb.">rex@fimoculous.com</a></p>
        <p>A fimoculous is a micro-organism that consumes its own waste for sustenance.<br/><br/></p>
        <div id="footer-image"><img src="/images/logo-footer.png" width="338" height="121" alt=""></div>
    </div>
</div>
"""


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


def load_end_of_year_entries(start: datetime, end: datetime) -> List[dict]:
    """Load end-of-year list entries within a window."""
    entries: List[dict] = []
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


def render_year_review_page(entries: List[dict], year: int, nav_years: List[int]) -> str:
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
    nav_links: List[str] = []
    for y in nav_years:
        if y == 2001:
            nav_links.append('<a href="/year-review.cfm">2001</a>')
        elif y == year:
            nav_links.append(str(y))
        else:
            nav_links.append(f'<a href="/year-review-{y}.cfm">{y}</a>')

    html_parts = [
        HEADER_HTML.replace("<title>Fimoculous.com</title>", f"<title>{year} Year Lists - Fimoculous.com</title>"),
        "<body>",
        '<div id="cell">',
        '<a name="top" href="/#top"><div id="transparent"></div></a>',
        '<div id="whitespace">&nbsp;</div>',
        '<div id="content">',
        '<div id="logo"><a href="/"><img src="/images/logo-fimoc.png" width="340" height="78" alt="Fimoculous.com"></a></div>',
        '<div class="bodybox" style="height:99.99%">',
        '<div class="header"><div class="title" style="margin-bottom: 10px;">LISTS: {}</div></div>'.format(year),
        '<div class="bodytext">',
        f'<div class="intro"><em>This page aggregates all of the lists related to {year}.</em></div>',
        '<div class="sortnav" style="margin:10px 0;padding:8px 0;border-top:1px dotted #ccc;border-bottom:1px dotted #ccc;">Sort: <a href="?">category</a> | <a href="?source">source</a> | <a href="?chron">date</a></div>',
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
        f"<p><strong>PREVIOUS YEARS</strong>: {' | '.join(nav_links)}</p>",
        "</div>",  # bodytext
        "<br /><br />",
        "</div>",  # bodybox
        "</div>",  # content
        FOOTER_HTML,
        "</div>",  # cell
        "<script>",
        "const params=new URLSearchParams(location.search);",
        "const mode=params.has('chron')?'chron':(params.has('source')?'source':'cat');",
        "document.getElementById('mode-'+mode).style.display='block';",
        "const cat=params.get('cat');",
        "if(cat){const el=document.getElementsByName(cat.toLowerCase())[0]; if(el){el.scrollIntoView();}}",
        "</script>",
        "<script type=\"text/javascript\">",
        "var _sf_async_config={uid:2823,domain:\"fimoculous.com\"};",
        "(function(){function loadChartbeat(){window._sf_endpt=(new Date()).getTime();var e=document.createElement('script');e.setAttribute('language','javascript');e.setAttribute('type','text/javascript');e.setAttribute('src',(('https:'==document.location.protocol)?'https://s3.amazonaws.com/':'http://')+'static.chartbeat.com/js/chartbeat.js');document.body.appendChild(e);}var oldonload=window.onload;window.onload=(typeof window.onload!='function')?loadChartbeat:function(){oldonload();loadChartbeat();};})();",
        "</script>",
        "<script type=\"text/javascript\">",
        "var gaJsHost=((\"https:\"==document.location.protocol)?\"https://ssl.\":\"http://\");",
        "document.write(unescape(\"%3Cscript src='\"+gaJsHost+\"google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E\"));",
        "</script>",
        "<script type=\"text/javascript\">",
        "try {var pageTracker=_gat._getTracker(\"UA-12347764-1\");pageTracker._trackPageview();} catch(err) {}",
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
        if any(filename.endswith(f"{year}.cfm") for year in YEAR_REVIEW_WINDOWS):
            continue  # generated below
        src = ROOT / filename
        if not src.exists():
            print(f"Skipping missing legacy file: {filename}")
            continue
        dest = OUT_DIR / filename
        dest.parent.mkdir(parents=True, exist_ok=True)
        dest.write_bytes(src.read_bytes())
        sitemap_urls.append((f"{BASE_URL}/{filename}", ""))

    # Static rebuilds of year-in-review pages that previously required CF
    nav_years = sorted(set(YEAR_REVIEW_WINDOWS.keys()) | {2003, 2001}, reverse=True)
    for year, (start_str, end_str) in YEAR_REVIEW_WINDOWS.items():
        start = datetime.strptime(start_str, "%m/%d/%Y")
        end = datetime.strptime(end_str, "%m/%d/%Y")
        entries = load_end_of_year_entries(start, end)
        if not entries:
            print(f"Warning: no end-of-year data found for {year}; page not generated.")
            continue
        rendered_page = render_year_review_page(entries, year, nav_years)
        out_path = OUT_DIR / f"year-review-{year}.cfm"
        out_path.write_text(rendered_page, encoding="utf-8")
        sitemap_urls.append((f"{BASE_URL}/year-review-{year}.cfm", ""))

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

