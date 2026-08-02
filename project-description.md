# Project Description — CV-site (`yiwang.dev`)

> Owner: Yi Wang  
> Live: https://yiwang.dev  
> Repo: `1yiwang/CV-site` (Vercel auto-deploy on `main`)  
> Last positioning update: 2026-07-30

---

## What this is

Personal portfolio / CV website for internship and early-career applications. Static multi-page site:

| Page | Role |
|------|------|
| `index.html` | Profile, Education, Experience, Featured, Contact |
| `ai.html` | AI Lab — product explorations with live demos |
| `credentials.html` | Languages, skills, certificates, references |
| `CV.pdf` | Downloadable resume linked from Hero / Contact |

Supporting docs: `PLAN.md` (architecture & decisions), `PROGRESS.md` (build status), `DESIGN.md` (visual system).

---

## Positioning (canonical)

**Brand line (site Hero):** Bridging Finance, Data, and AI — from theory to product.

The site is intentionally **general-purpose**: Finance × Data × AI, with AI Agents / automation as a differentiator. Do **not** narrow the live site to a single employer or industry unless explicitly requested.

**Role split when applying:**

| Artifact | Job |
|----------|-----|
| **Website** | Long-term brand — credible, modern, shows AI literacy and global background |
| **Application PDF** | Role-specific narrative — may differ from the PDF linked on the site |

Application PDF and site `CV.pdf` are **not required to stay identical**. A tailored PDF can be submitted via an application portal while `yiwang.dev` keeps the general `CV.pdf`.

---

## Application note — BYD Zurich Finance Intern (2026-07-30)

Target: **BYD finance internship, Zurich**. Materials shared with recruiter: personal site + PDF.

### Decisions (confirmed)

1. **Website — no structural / copy overhaul** for this application. Current general version stays. Emphasizing AI remains a deliberate plus.
2. **Internship bullets (UCEA / SDIC / Abu Dhabi) — leave as-is** on both site and PDF; already finance-readable enough; optional micro-tweaks not worth the sync cost.
3. **PDF Profile — optional.** If tailored later (outside this repo), prefer finance-first + AI anchored to analysis/reporting, not “0 to 1 products”. Site Profile / Hero need not mirror that version.
4. **If a new PDF is adopted on the site**, only replace the file `CV.pdf` (and keep download filename consistent). No need to rewrite HTML for a one-off application.

### Suggested PDF Profile drafts (for use outside this repo; not applied to site)

**Balanced (recommended):**

> UZH 2026 Graduate (Management & Economics, Data Science track). Experienced in financial analysis, Excel modeling, and industry research across Switzerland, China, and the UAE. Skilled in applying AI agents, workflows, and LLMs to automate repetitive analysis and drafting—delivering faster, more reliable support for finance and business teams. Motivated to contribute to corporate finance at BYD’s Zurich office, bringing a China–Europe perspective and a strong interest in the new-energy vehicle industry.

**Short:**

> UZH 2026 Graduate (Management & Economics, Data Science track) with experience in financial analysis, modeling, and industry research across Switzerland, China, and the UAE. I use AI agents and LLM workflows to reduce repetitive analysis and drafting, and aim to support corporate finance at BYD Zurich with a practical, data-driven approach.

**AI one-liner for project bullets (if used on PDF only):**

> Built automation workflows with LLMs to reduce repetitive analysis/drafting.

### Assets that already help for automotive / mobility (no change needed)

- SDIC Securities — Machinery Group industry research + Excel financial models  
- UZH Innovathon — digital mobility for IPZ  
- UCEA — valuations / investment documentation  
- Languages: EN C1, ZH Native, DE A2–B1; based in Zurich; B permit

### Explicit non-goals for this application wave

- Do not rewrite site Hero / motto / AI Lab for BYD  
- Do not add an automotive-only page or “Open to roles” strip unless requested  
- Do not force site `CV.pdf` to match every tailored application PDF

---

## Updating `CV.pdf` without Cursor

All site download buttons already point at the single file `CV.pdf` (Hero ×2 + Contact). Replacing that file updates every link; HTML does not need hand-edits.

```powershell
# Copy your latest PDF into the repo
pwsh ./scripts/sync-cv.ps1 -Source "D:\path\to\your-latest.pdf"

# Copy + commit + push (Vercel auto-deploys)
pwsh ./scripts/sync-cv.ps1 -Source "D:\path\to\your-latest.pdf" -Push

# Also bump ?v= cache-buster on hrefs if CDN/browser serves a stale PDF
pwsh ./scripts/sync-cv.ps1 -Source "D:\path\to\your-latest.pdf" -Push -CacheBust
```

Working / application PDFs may live outside this repo; only run the script when you want the **public** site download to match.

---

## How to update this file

When positioning or application strategy changes, append a dated subsection under a new `## Application note — …` (or revise **Positioning** if the canonical brand itself changes). Keep `PROGRESS.md` for build/step status; keep this file for **what the product is and how it should be used in applications**.
