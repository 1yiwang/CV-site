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
