# Project Journal — CV-site

> **Append a new dated section at the top** of this file (newest first).
> Every entry MUST use the canonical structure below — same section order, same headings.
> `New Concepts Discovered` is part of every entry; if a fresh scan finds nothing new, write a single row `| None | — | — | — |` so it's clear the scan happened and produced nothing.
> See `.cursor/rules/knowledge-capture.mdc` for the rules on **when** to add a concept row.

## Canonical entry template

````markdown
## YYYY-MM-DD

### Project Status
active / paused / completed

### Current Phase
e.g. MVP build, UI polish, architecture refactor, bug fix, productization

### What I Did
- Completed feature / fix / decision

### Files Changed
- `src/file.py` — what changed and why

### Architecture & Key Decisions
- Why this choice over the alternatives

### Blockers
- What's stuck (write `None` if nothing)

### Next
- Concrete next step(s)

### Notes for Librarian
- Knowledge points or cross-project connections worth surfacing in Obsidian

### New Concepts Discovered

| Concept | Where in code | Why it matters | One-line description |
|---------|--------------|----------------|---------------------|
| concept-name | `path/to/file.ts` | Why this is worth knowing beyond this project | 1-sentence what-it-is and how it's used here |
````

---

## 2026-06-11

### Project Status
active

### Current Phase
Live at `yiwang.dev` — AI Lab expansion: added a third project card (`Scheduling Agent`) with a mobile-only live demo.

### What I Did
- Added a third AI Lab project card, `Scheduling Agent`, between `AI Builders Digest` and the `More explorations` placeholder, reusing the existing `bento-card` structure for visual consistency.
- Embedded the public demo `calendar-demo.yiwang.dev` as a centered, phone-sized iframe instead of a full-width desktop frame, since the demo is currently mobile-only.
- Wrote a dedicated scaling IIFE for the calendar frame (separate from the existing Job Match desktop-frame script), using `scale = min(1, parentWidth / BASE_W)` so it stays at real phone size on desktop, centers, and shrinks without overflow on narrow screens.
- Sized the device frame to `375x667` (iPhone SE / 8 proportions) after the initial `390x844` felt too tall in the card.
- Used honest status wording `Live demo · agent loop in design` rather than `Live & iterating`, so the card does not imply the product is directly usable yet.
- Rewrote the card copy to match the natural, jargon-light tone of the first two cards, emphasizing a proactive scheduling agent that helps you run your day; removed all em dashes per preference. Trimmed the three feature boxes (`Perceive` / `Decide` / `Learn`) for balanced length.
- Did not expose the real version (`calendar.yiwang.dev`); only the demo is linked via a single `Open Live Demo` CTA.
- Fixed the phone demo being shifted right on mobile: the scaling script was basing scale on the parent `clientWidth` (which includes the `px-4` padding), so the frame overflowed. Now it resets the wrap width, measures real available width, then scales and centers with `margin: 0 auto`.
- Reordered the three AI Lab cards from oldest-first to newest-first: `Scheduling Agent` (June) -> `AI Builders Digest` (May-June) -> `Job Match` (May).

### Files Changed
- `ai.html` — new `Scheduling Agent` section (meta header, phone-sized demo iframe, title/tags, three feature boxes, demo CTA) plus a second scaling IIFE for `calendarFrame`; centering fix in that IIFE; card order changed to newest-first.

### Architecture & Key Decisions
- **Mobile-only demo, consistent layout**: kept the top-to-bottom card rhythm of the other two cards but rendered the demo as a centered phone frame to respect the demo being mobile-only, avoiding a stretched desktop iframe.
- **Separate scaling script**: left the Job Match `demoFrame` IIFE (`BASE_W=1440`) untouched and added an independent IIFE for `calendarFrame` so the two frames never interfere.
- **Honest framing over hype**: status badge and copy signal demo-viewable-but-not-yet-usable, consistent with the conservative public framing used across the site.
- **Source of truth**: card content distilled from `D:\Projects\scheduling-agent\product-description.md` (Agent Loop, six detectors, propose-only, Tier-1 learning).

### Blockers
None.

### Next
- Verify the deployed AI Lab page after Vercel finishes, especially the phone-frame demo on desktop and narrow mobile.
- Revisit once the real version (`calendar.yiwang.dev`) is stable enough to expose, or once the demo gains a desktop layout.

### Notes for Librarian
- Sister-project link: `scheduling-agent` (at `D:\Projects\scheduling-agent`) now powers the third AI Lab card; public demo at `calendar-demo.yiwang.dev`, real version `calendar.yiwang.dev` deliberately not yet linked.
- AI Lab now hosts three cards: `Job Match`, `AI Builders Digest`, `Scheduling Agent` — the portfolio's agent/automation narrative is filling out.

### New Concepts Discovered

| Concept | Where in code | Why it matters | One-line description |
|---------|--------------|----------------|---------------------|
| Phone-frame iframe embed | `ai.html` | Lets a mobile-only demo sit cleanly inside a desktop card without stretching | A centered fixed-ratio device frame (`375x667`) scaled by `min(1, parentWidth/BASE_W)` so it shrinks but never upscales. |

---

## 2026-06-09

### Project Status
active

### Current Phase
Live at `yiwang.dev` — CV page content polish, credentials layout refinement, and AI Lab copy calibration.

### What I Did
- Refined the `credentials.html` page into a cleaner document hub: removed filler subtitle text, simplified the hero title, and removed the low-value `CEFR levels` label.
- Rebuilt `Skills & Toolkit` from pill tags into a two-column text matrix for `Technical & Analytical` and `AI & Product`, adding `Claude Code` and `Supabase`.
- Reworked `Languages` and `Tests & Certificates` into matching three-column rows for item, score, and certificate link; added `IELTS` and `GMAT` PDF links and set GMAT score to `680`.
- Simplified the `References` section into two clear lines plus matching dark CTA buttons for email and `Book a call`.
- Updated homepage Education/Featured/Contact copy: adjusted UZH Innovathon punctuation, UBS competition wording, AI Lab banner wording, and the contact focus line.
- Updated AI Lab page positioning copy and project date labels, removing `full-stack` phrasing and replacing ongoing date labels with concrete May / May-June 2026 ranges.

### Files Changed
- `credentials.html` — credentials page layout, copy, skills matrix, language/certificate rows, references copy and CTAs.
- `index.html` — Education highlights, UBS competition copy, Featured AI Lab banner, and Contact wording.
- `ai.html` — AI Lab hero wording and project date labels.
- `assets/docs/IELTS.pdf` — public IELTS certificate file linked from `credentials.html`.
- `assets/docs/GMAT-Report.pdf` — public GMAT report file linked from `credentials.html`.

### Architecture & Key Decisions
- **Plain HTML over new components**: kept the static-site structure intact and made targeted HTML/Tailwind edits instead of introducing a shared component layer.
- **Public framing stays conservative**: AI work is described as systems, workflows, agents, demos, and harness frameworks, avoiding over-claiming phrases like `full-stack`.
- **Credentials as scannable proof**: language levels and certificate links now use a compact table-like layout so recruiters can scan the evidence quickly.
- **Contact CTAs stay consistent**: reference/email and booking links use the same dark button treatment as the main contact CTAs for visual consistency.

### Blockers
None.

### Next
- Review the deployed pages after Vercel finishes deploying, especially `credentials.html` on desktop and mobile.
- If the AI Lab/Featured copy still feels too broad, replace `harness frameworks` with a more concrete phrase once the next AI project is public.

### Notes for Librarian
- The CV site is converging toward a cleaner public narrative: data science, AI, and finance, with proof points split across homepage projects, AI Lab, and credentials.
- Credentials now include public PDFs for IELTS and GMAT, so future privacy/public-document decisions should consider that these files are deployable assets.

### New Concepts Discovered

| Concept | Where in code | Why it matters | One-line description |
|---------|--------------|----------------|---------------------|
| None | — | — | — |

---

## 2026-06-08

### Project Status
active

### Current Phase
Live at `yiwang.dev` — contact/conversion polish, AI Lab project presentation, and lightweight visitor telemetry.

### What I Did
- Added a `Book a call` CTA to the Hero/Profile area on both desktop and mobile, linking to `https://meet.yiwang.dev` in a new tab.
- Kept `Contact Me` as the email fallback instead of replacing email entirely, so visitors can choose between scheduling a call and sending an async message.
- Changed the mobile Hero CTA row from `flex-nowrap` to `flex-wrap` so the added third button does not squeeze on small screens.
- Reordered the `Let's connect` Contact section so `Download CV` appears last. The new order is: `Book a call` → email → LinkedIn → GitHub → `Download CV`.
- Updated the first AI Lab project from the earlier `Swiss Job Search & Tracker` framing to the public `Job Match` brand, using the conservative CV-facing copy from `D:\Projects\swiss-job-agent-web\project-description.md`.
- Replaced the old Loom video embed with the public demo at `https://jobs-demo.yiwang.dev/`, rendered as an auto-scaled live iframe preview plus an `Open Live Demo` CTA.
- Added an anonymous footer counter across `index.html`, `ai.html`, and `credentials.html`, showing `Visitors` and `Unique IPs`.
- Connected the counter to Vercel Functions + Upstash Redis, using HyperLogLog for approximate unique counts and salted SHA-256 hashing so raw IPs are never stored.
- Created the separate `meet-up` planning project and pushed `plans.md` to GitHub for the future Cal.com-based booking setup.

### Files Changed
- `index.html` — Hero/Profile desktop and mobile CTA rows now include `Book a call`; Contact section button order adjusted.
- `ai.html` — first AI Lab card updated to `Job Match`, public demo iframe added, public-facing description/tags/CTA revised, footer counter display added.
- `credentials.html` — footer counter display added.
- `api/hit.js` — new Vercel Function for visitor/IP counting via Upstash Redis REST API.
- `assets/js/visitor-counter.js` — new front-end script that creates an anonymous visitor id, calls `/api/hit`, and renders counts in the footer.
- `D:\Projects\meet-up\plans.md` — standalone planning document for the Cal.com/`meet.yiwang.dev` booking surface (separate repository).

### Architecture & Key Decisions
- **Dual contact path**: `Book a call` becomes easier to discover, but `mailto:` remains available for recruiters or collaborators who need to send context, attachments, or quick asynchronous messages.
- **CV download is secondary in Contact**: in the dedicated `Let's connect` area, the primary intent is conversation and external profiles; CV download is still available but no longer interrupts the contact flow.
- **Cross-project integration**: `CV-site` now routes more prominently to the separate `meet-up` project via the production subdomain `meet.yiwang.dev`.
- **Public demo over video**: the `Job Match` card now embeds `jobs-demo.yiwang.dev` directly instead of relying on a Loom recording. The demo uses sample data and better matches the current product state.
- **Conservative public framing**: `Job Match` is presented as a ranking, tracking, and feedback tool. Owner-only cover-letter/outreach functionality remains out of the public copy.
- **Static site plus tiny API**: the site stays mostly static, but Vercel's `api/` function adds the minimum server-side layer needed for counters.
- **Privacy-preserving metrics**: unique IPs are counted via salted hashes and HyperLogLog, not by storing raw IP addresses or visitor logs.
- **Footer placement**: visitor stats live under the copyright line, centered and using the same footer typography so they read as quiet metadata rather than a primary content block.

### Blockers
None.

### Next
- Verify the deployed `yiwang.dev` Hero buttons on desktop and mobile after push.
- Optional: decide later whether Hero should make `Book a call` the visual primary CTA instead of `Download CV` (currently intentionally left unchanged per user choice).
- Verify the deployed visitor counter after Vercel finishes deploying and the Upstash environment variables are active.
- If desired later, add Vercel Web Analytics for anonymous aggregate trends (country/device/referrer), while keeping the public footer counter simple.

### Notes for Librarian
- Cross-project link: `CV-site` is the personal portfolio front door; `meet-up` is now the dedicated booking surface. The pair forms a small site matrix: `yiwang.dev` for profile/discovery, `meet.yiwang.dev` for scheduling.
- Sister-project link: `swiss-job-agent-web` now defines the public `Job Match` copy and separates internal/full functionality from CV-safe wording.
- Sister-project link: `ai-builders-digest` powers the second AI Lab card, with the public magazine at `https://ainews.yiwang.dev/`.
- New standalone repository: `https://github.com/1yiwang/meet-up` stores the Cal.com booking plan, not custom booking code.

### New Concepts Discovered

| Concept | Where in code | Why it matters | One-line description |
|---------|--------------|----------------|---------------------|
| Vercel Function on a static site | `api/hit.js` | Adds a tiny server-side capability without turning the portfolio into a full app | A file under `api/` becomes a deployable Vercel serverless endpoint used by the static pages. |
| HyperLogLog visitor counting | `api/hit.js` | Enables privacy-preserving approximate unique counts without storing per-visitor rows | Redis `PFADD`/`PFCOUNT` tracks unique visitors and hashed IPs with small memory usage and acceptable approximate accuracy. |
| Anonymous client visitor id | `assets/js/visitor-counter.js` | Separates browser-level visitor counting from raw IP counting | A UUID stored in `localStorage` lets repeat visits from the same browser count once while avoiding identity collection. |

---

## 2026-06-01

### Project Status
active

### Current Phase
Live at `yiwang.dev` — small content updates: CV PDF refresh, case study card enrichment, AI Lab CTA adjustment.

### What I Did
- Updated `CV.pdf` with personal domain `yiwang.dev` and QR code linking to online CV.
- Added "View Picture" CTA to UBS Inter-University Case Competition card in `index.html`, matching the "View certificate" styling on the MCM card. Image: `assets/img/UBS Case Study.jpeg`.
- Changed AI Lab's "View on GitHub" button to "View Demo" pointing to `https://jobs.yiwang.dev/` (the AI-Driven Job Search Automation Stack live deployment).

### Files Changed
- `CV.pdf` — updated with website link + QR code
- `index.html` — UBS case card: +4 lines ("View picture" link)
- `assets/img/UBS Case Study.jpeg` — new image asset (280 KB)
- `ai.html` — button text, link URL, and icon changed (GitHub → Demo)

### Architecture & Key Decisions
- **UBS card link** uses `material-symbols-outlined: image` icon, not `picture_as_pdf` (which the MCM certificate link uses). Distinction is intentional — one is a JPEG image, the other is a PDF document.
- **AI Lab CTA** now points to the live product (`jobs.yiwang.dev`) instead of the source repo. The live demo is the primary conversion surface; the GitHub repo link can live elsewhere (e.g. in the footer or a secondary link) if needed.
- Image path uses space in filename (`UBS Case Study.jpeg`) — works fine in modern browsers but worth noting for any future build tooling.

### Blockers
None

### Next
- Step 3 (from legacy `PROGRESS.md`): extract repeated `<style>` + `<script>` + Tailwind config from the 3 HTML files into `assets/css/styles.css` + `assets/js/main.js`.
- Lower priority: EN/DE i18n, accessibility pass, dark mode toggle, Plausible analytics.

### Notes for Librarian
- `PDF of Yi Wang.pdf` also exists in `F:\0.0 找工作\3. 瑞士\bridge finance, data\` — that's the working copy used for job applications. The one in `CV-site` repo is the same file synced manually. No automation between the two locations.
- `jobs.yiwang.dev` is a separate Vercel project (the Next.js/Convex job-search platform), not hosted from this repo.

### New Concepts Discovered

| Concept | Where in code | Why it matters | One-line description |
|---------|--------------|----------------|---------------------|
| None | — | — | — |

---

## 2026-05-30

### Project Status
active

### Current Phase
Live at `yiwang.dev` (legacy `PROGRESS.md`: Step 2.7 done; Step 3 — CSS/JS extraction — queued). Today: workflow infrastructure bootstrap.

### What I Did
- (Earlier today, from `swiss-job-agent-web` Cursor window) Moved repo from `D:\cvhtml` → `D:\Projects\CV-site` via `robocopy` + `Remove-Item` of the original (a directory lock prevented plain `Move-Item`; suspected Windows Search Indexer or Defender). Vercel project and the `yiwang.dev` domain config are cloud-side and were not touched.
- (Now) Installed `.cursor/rules/knowledge-capture.mdc` and `.cursor/rules/journal-workflow.mdc`, identical to the master copies in `swiss-job-agent-web`.
- Installed `scripts/journal-archive.ps1` (monthly journal archive script).
- Created this `Project-Journal-Obsidian.md` with the canonical 9-section template at the top.

### Files Changed
- `.cursor/rules/knowledge-capture.mdc` — new
- `.cursor/rules/journal-workflow.mdc` — new
- `scripts/journal-archive.ps1` — new
- `Project-Journal-Obsidian.md` — new (this file)

### Architecture & Key Decisions
- Same workflow scaffolding as sibling projects under `D:\Projects\` (`swiss-job-agent-web`, `permit-advisor`, `ai-builders-digest`). One trigger-phrase muscle memory across all four. Each project's journal is independent; cross-project work goes in the project where the primary work happened.
- Existing `PROGRESS.md` left **in place**, untouched. It's the legacy step-by-step progress doc (last updated 2026-05-25). New dated entries from today onward go in this file. If the dual-file shape becomes annoying we can migrate later — for now it's zero-risk to keep both.

### Blockers
None

### Next
- Step 3 (from legacy `PROGRESS.md`): extract repeated `<style>` + `<script>` + Tailwind config from the 3 HTML files into `assets/css/styles.css` + `assets/js/main.js`. Then check Tailwind `borderRadius` against `DESIGN.md`.
- Lower priority backlog (Step 4–8): EN/DE i18n, accessibility / 360-768-1280 mobile pass, dark mode toggle, Plausible analytics.

### Notes for Librarian
- Live URL: `yiwang.dev` (Cloudflare DNS → Vercel auto-deploy on `main`).
- Legacy progress doc: `PROGRESS.md` at repo root — kept as the freeform Step-based history reference. Don't archive it; treat it as a reference doc.
- Sister projects under `D:\Projects\`: `swiss-job-agent-web` (master copy of these workflow rules), `permit-advisor`, `ai-builders-digest`.

### New Concepts Discovered

| Concept | Where in code | Why it matters | One-line description |
|---------|--------------|----------------|---------------------|
| None | — | — | — |
