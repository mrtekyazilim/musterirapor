# RaporKolay - Build all projects and copy to dist/
Write-Host "Building RaporKolay projects..." -ForegroundColor Green

# Clean and create main dist folder
if (Test-Path "dist") {
  Write-Host "Cleaning old dist/ folder..." -ForegroundColor Yellow
  Remove-Item -Path "dist" -Recurse -Force
}
New-Item -ItemType Directory -Path "dist" -Force | Out-Null

# Kernel build
Write-Host "`n[1/4] Building Kernel..." -ForegroundColor Cyan
cd kernel
Write-Host "  OK - Kernel ready (Node.js project - using src/)" -ForegroundColor Green
# Copy kernel src/ folder
New-Item -ItemType Directory -Path "..\dist\kernel" -Force | Out-Null
Copy-Item -Path "src\*" -Destination "..\dist\kernel\" -Recurse -Force
Copy-Item -Path "package.json" -Destination "..\dist\kernel\" -Force

# Update package.json paths for production
$packageJson = Get-Content "..\dist\kernel\package.json" -Raw | ConvertFrom-Json
$packageJson.main = "server.js"
$packageJson.scripts.start = "node server.js"
$packageJson.scripts.dev = "nodemon server.js"
$packageJson.scripts.seed = "node seed.js"
$packageJson | ConvertTo-Json -Depth 10 | Set-Content "..\dist\kernel\package.json"

if (Test-Path ".env") {
  # Copy .env and set NODE_ENV=production
  $envContent = Get-Content ".env" -Raw
  $envContent = $envContent -replace "NODE_ENV=.*", "NODE_ENV=production"
  if ($envContent -notmatch "NODE_ENV=") {
    $envContent += "`nNODE_ENV=production"
  }
  Set-Content -Path "..\dist\kernel\.env" -Value $envContent -NoNewline
}
Write-Host "  OK - Kernel copied to dist/kernel/" -ForegroundColor Green
cd ..

# Admin Panel build
Write-Host "`n[2/4] Building Admin Panel..." -ForegroundColor Cyan
cd adminpanel
yarn build
if ($LASTEXITCODE -ne 0) {
  Write-Host "`nERROR: Admin Panel build failed!" -ForegroundColor Red
  cd ..
  exit 1
}
Write-Host "  OK - Admin Panel build successful" -ForegroundColor Green
New-Item -ItemType Directory -Path "..\dist\adminpanel\" -Force | Out-Null
Copy-Item -Path "dist\*" -Destination "..\dist\adminpanel\" -Recurse -Force
Write-Host "  OK - Admin Panel copied to dist/adminpanel/" -ForegroundColor Green
cd ..

# Client build
Write-Host "`n[3/4] Building Client..." -ForegroundColor Cyan
cd client
yarn build
if ($LASTEXITCODE -ne 0) {
  Write-Host "`nERROR: Client build failed!" -ForegroundColor Red
  cd ..
  exit 1
}
Write-Host "  OK - Client build successful" -ForegroundColor Green
if (Test-Path "..\dist\client\") {
  Remove-Item -Path "..\dist\client\" -Recurse -Force
}
New-Item -ItemType Directory -Path "..\dist\client\" -Force | Out-Null
Copy-Item -Path "dist\*" -Destination "..\dist\client\" -Recurse -Force
Write-Host "  OK - Client copied to dist/client/" -ForegroundColor Green
cd ..

# Web build
Write-Host "`n[4/4] Building Web..." -ForegroundColor Cyan
cd web
yarn build
if ($LASTEXITCODE -ne 0) {
  Write-Host "`nERROR: Web build failed!" -ForegroundColor Red
  cd ..
  exit 1
}
Write-Host "  OK - Web build successful" -ForegroundColor Green
if (Test-Path "..\dist\web\") {
  Remove-Item -Path "..\dist\web\" -Recurse -Force
}
New-Item -ItemType Directory -Path "..\dist\web\" -Force | Out-Null
Copy-Item -Path "dist\*" -Destination "..\dist\web\" -Recurse -Force
Write-Host "  OK - Web copied to dist/web/" -ForegroundColor Green
cd ..

Write-Host "`nSUCCESS: All projects built and copied to dist/" -ForegroundColor Green
Write-Host "`nDist structure:" -ForegroundColor Cyan
Write-Host "  dist/" -ForegroundColor White
Write-Host "    kernel/       (Node.js backend)" -ForegroundColor White
Write-Host "    adminpanel/   (React build)" -ForegroundColor White
Write-Host "    client/       (React PWA build)" -ForegroundColor White
Write-Host "    web/          (React build)" -ForegroundColor White
