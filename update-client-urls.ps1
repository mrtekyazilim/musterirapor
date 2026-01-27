# Replace all hardcoded localhost URLs with config in client project

$files = @(
  "client\src\pages\Connectors.tsx",
  "client\src\pages\ChatReports.tsx",
  "client\src\pages\ReportDesigns.tsx",
  "client\src\pages\ReportExecute.tsx",
  "client\src\pages\ReportForm.tsx",
  "client\src\pages\Reports.tsx",
  "client\src\pages\Sessions.tsx",
  "client\src\pages\Login.tsx",
  "client\src\pages\Profile.tsx",
  "client\src\pages\Settings.tsx",
  "client\src\components\Layout.tsx"
)

foreach ($file in $files) {
  $fullPath = Join-Path $PSScriptRoot $file
  
  if (Test-Path $fullPath) {
    Write-Host "Processing: $file" -ForegroundColor Cyan
    
    $content = Get-Content $fullPath -Raw
    $originalContent = $content
    
    # Replace 'http://localhost:13401/api with `${config.apiUrl}
    $content = $content -replace "'http://localhost:13401/api", '`${config.apiUrl}'
    # Replace "http://localhost:13401/api with `${config.apiUrl}
    $content = $content -replace '"http://localhost:13401/api', '`${config.apiUrl}'
    # Replace `http://localhost:13401/api with `${config.apiUrl}
    $content = $content -replace '`http://localhost:13401/api', '`${config.apiUrl}'
    
    # Add import if not exists
    if ($content -notmatch "import.*config.*from.*'\.\./config'") {
      # Find last import statement
      if ($content -match "(?ms)(import.*?(?:from '[^']+'))(\s+)") {
        $lastImport = $matches[1]
        $content = $content -replace [regex]::Escape($lastImport), "$lastImport`nimport { config } from '../config'"
      }
    }
    
    if ($content -ne $originalContent) {
      Set-Content -Path $fullPath -Value $content -NoNewline
      Write-Host "  Updated!" -ForegroundColor Green
    }
    else {
      Write-Host "  No changes needed" -ForegroundColor Gray
    }
  }
  else {
    Write-Host "File not found: $file" -ForegroundColor Yellow
  }
}

Write-Host "`nDone! All files updated." -ForegroundColor Green
