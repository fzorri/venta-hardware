# Sync script - Automates git workflow after Obsidian HTML export
# Usage: .\sync.ps1

Set-Location $PSScriptRoot

$changes = git status --porcelain
if (-not $changes) {
    Write-Host "No changes detected. Nothing to commit." -ForegroundColor Yellow
    exit 0
}

Write-Host "Changes detected:" -ForegroundColor Cyan
git status

$date = Get-Date -Format "yyyyMMdd - HHmmss"
git add .
git commit -m $date
git push origin main

Write-Host "`nDone. Status:" -ForegroundColor Green
git status
Write-Host "`nRecent commits:" -ForegroundColor Cyan
git log --oneline -5
