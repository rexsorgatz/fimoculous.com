from __future__ import annotations

import csv
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


def build():
    env = Environment(
        loader=FileSystemLoader(TEMPLATE_DIR),
        autoescape=select_autoescape(["html", "xml", "cfm"]),
    )
    template = env.get_template(POST_TEMPLATE)
    home_template = env.get_template(HOME_TEMPLATE)

    cats, entry_cats = load_categories()
    comments = load_comments()

    archive_dir = OUT_DIR / "archive"
    archive_dir.mkdir(parents=True, exist_ok=True)

    count = 0
    home_posts: List[dict] = []

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


if __name__ == "__main__":
    build()

