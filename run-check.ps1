Write-Host "🔍 Checking tasks.json format..." -ForegroundColor Cyan
try {
    Get-Content -Raw -Path .\tasks.json | ConvertFrom-Json | Out-Null
    Write-Host "✅ JSON is valid. Ready to commit!" -ForegroundColor Green
} catch {
    Write-Host "❌ Error: Invalid JSON syntax or file missing." -ForegroundColor Red
    Exit 1
}
