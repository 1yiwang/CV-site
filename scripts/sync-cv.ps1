# Sync latest CV PDF into the site and optionally deploy.
#
# All Download CV links already point at root `CV.pdf` — no HTML edits needed.
# Usage:
#   pwsh ./scripts/sync-cv.ps1 -Source "D:\path\to\your-latest.pdf"
#   pwsh ./scripts/sync-cv.ps1 -Url "https://signed-canva-export/..."
#   pwsh ./scripts/sync-cv.ps1 -Url "..." -Push
#   pwsh ./scripts/sync-cv.ps1 -Url "..." -Push -CacheBust
#
# Prefer Cursor phrase `发布CV` (agent exports Canva → this script → commit/push).
# -Url      : download a signed Canva export URL straight into CV.pdf
# -Push     : git add CV.pdf, commit, push origin (triggers Vercel deploy)
# -CacheBust: append/update ?v=YYYYMMDDHHMMSS on every CV.pdf href so browsers/CDN don't serve a stale file

param(
    [string]$Source,
    [string]$Url,

    [switch]$Push,
    [switch]$CacheBust
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$dest = Join-Path $repoRoot "CV.pdf"

if ($Url -and $Source) {
    Write-Error "Pass only one of -Url or -Source."
}
if (-not $Url -and -not $Source) {
    Write-Error "Pass -Url (Canva export) or -Source (local PDF)."
}

if ($Url) {
    $tmp = Join-Path $env:TEMP ("cv-canva-{0}.pdf" -f [guid]::NewGuid().ToString("N"))
    Write-Host "Downloading Canva export..."
    Invoke-WebRequest -Uri $Url -OutFile $tmp -UseBasicParsing
    $Source = $tmp
}

if (-not (Test-Path -LiteralPath $Source)) {
    Write-Error "Source PDF not found: $Source"
}

Copy-Item -LiteralPath $Source -Destination $dest -Force
if ($Url) {
    Remove-Item -LiteralPath $Source -Force -ErrorAction SilentlyContinue
}

# Working copy may have a draft second page; the site CV is page 1 only.
python -c @"
from pathlib import Path
import pypdf
p = Path(r'$dest')
r = pypdf.PdfReader(str(p))
n = len(r.pages)
print(f'PDF pages: {n}')
if n > 1:
    w = pypdf.PdfWriter()
    w.add_page(r.pages[0])
    w.write(str(p))
    print('Kept first page only')
"@

Write-Host "Updated: $dest"
Write-Host ("Size: {0:N0} bytes" -f (Get-Item -LiteralPath $dest).Length)

if ($CacheBust) {
    $stamp = Get-Date -Format "yyyyMMddHHmmss"
    $htmlFiles = @(
        (Join-Path $repoRoot "index.html"),
        (Join-Path $repoRoot "ai.html"),
        (Join-Path $repoRoot "credentials.html")
    ) | Where-Object { Test-Path -LiteralPath $_ }

    foreach ($html in $htmlFiles) {
        $text = Get-Content -LiteralPath $html -Raw -Encoding UTF8
        $updated = [regex]::Replace(
            $text,
            'href="CV\.pdf(?:\?v=\d+)?"',
            "href=`"CV.pdf?v=$stamp`""
        )
        if ($updated -ne $text) {
            Set-Content -LiteralPath $html -Value $updated -Encoding UTF8 -NoNewline
            Write-Host "Cache-bust hrefs in $(Split-Path -Leaf $html) -> ?v=$stamp"
        }
    }
}

if (-not $Push) {
    Write-Host ""
    Write-Host "Local file only. Deploy with:"
    Write-Host '  pwsh ./scripts/sync-cv.ps1 -Source "..." -Push'
    Write-Host "Or: git add CV.pdf; git commit -m `"chore: update CV.pdf`"; git push"
    exit 0
}

Set-Location $repoRoot
git add -- "CV.pdf"
if ($CacheBust) {
    git add -- "index.html" "ai.html" "credentials.html" 2>$null
}

$status = git status --porcelain -- "CV.pdf" "index.html" "ai.html" "credentials.html"
if (-not $status) {
    Write-Host "Nothing to commit (PDF identical to HEAD)."
    exit 0
}

git commit -m "chore: update CV.pdf"
git push
Write-Host "Pushed. Vercel will redeploy yiwang.dev shortly."
