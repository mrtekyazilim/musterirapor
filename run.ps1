# RaporKolay - Tüm projeleri başlat
Write-Host "RaporKolay projelerini başlatılıyor..." -ForegroundColor Green
Write-Host "`nPortlar:" -ForegroundColor Cyan
Write-Host "  - Kernel API:   http://localhost:13401" -ForegroundColor White
Write-Host "  - Admin Panel:  http://localhost:13402" -ForegroundColor White
Write-Host "  - Client PWA:   http://localhost:13403" -ForegroundColor White
Write-Host "  - Web:          http://localhost:13404" -ForegroundColor White
Write-Host "`n"

# Concurrently ile tüm projeleri çalıştır
yarn dev
