# RaporKolay

Connector uygulaması üzerinden müşterilere özel raporlar sağlayan tam entegre bir rapor sistemi. Kullanıcılar hem mobil (PWA) hem de web üzerinden raporlarına güvenli şekilde erişebilir.

## 🏗️ Proje Yapısı

Bu proje monorepo mimarisinde 4 ana bileşenden oluşur:

- **`kernel/`** - Backend API servisi (Node.js + Express + MongoDB) - Port 13401
- **`adminpanel/`** - Yönetim paneli (React + TypeScript + Tailwind) - Port 13402
- **`client/`** - Kullanıcı PWA uygulaması (React + TypeScript + PWA) - Port 13403
- **`web/`** - Web sitesi (React + TypeScript + Vite) - Port 13404

## 🚀 Teknolojiler

### Backend

- Node.js & Express.js
- MongoDB & Mongoose ODM
- JWT Authentication
- ConnectorAbi Proxy (MSSQL, MySQL, PostgreSQL)

### Frontend

- React 18 & TypeScript
- Tailwind CSS & shadcn/ui
- Vite (build tool)
- React Router
- Workbox (PWA - sadece client/)

## 📦 Kurulum

### Gereksinimler

- Node.js (v18 veya üzeri)
- MongoDB (çalışır durumda)
- Yarn (npm değil!)

### Hızlı Başlangıç

```bash
# 1. Tüm projelerin bağımlılıklarını yükle
yarn install:all

# 2. Kernel için .env dosyası oluştur
cd kernel
cp .env.example .env
# MongoDB bağlantı bilgilerini düzenle

# 3. Veritabanını seed et (opsiyonel)
yarn seed

# 4. Ana dizine dön ve tüm projeleri başlat
cd ..
yarn dev
```

### Manuel Kurulum

Her proje için ayrı ayrı:

```bash
# Kernel
cd kernel
yarn install
yarn dev

# Admin Panel
cd adminpanel
yarn install
yarn dev

# Client
cd client
yarn install
yarn dev

# Web
cd web
yarn install
yarn dev
```

## 🎯 Kullanım

### Tüm Projeleri Çalıştır

```bash
# Concurrently ile tek komutta
yarn dev

# Veya PowerShell script ile
.\run.ps1
```

### Uygulama URL'leri

- **API**: http://localhost:13401
- **Admin Panel**: http://localhost:13402
- **Client PWA**: http://localhost:13403
- **Web**: http://localhost:13404

### Build

```bash
# Kernel
cd kernel
yarn start

# Frontend projeler
cd adminpanel  # veya client/web
yarn build
yarn preview
```

## 🔧 Önemli Özellikler

### ConnectorAbi Entegrasyonu

- Client uygulamaları ConnectorAbi'ye doğrudan erişmez
- Tüm istekler `kernel/` üzerinden proxy edilir: `/api/connector-proxy/*`
- Desteklenen veritabanları: MSSQL, MySQL, PostgreSQL
- Connector kimlik doğrulama: `clientId` + `clientPassword` (plain text)

### Dark Mode Desteği

- Tüm frontend projelerde dark/light mode desteği
- Default tema: `dark`
- localStorage ile kalıcı tema tercihi

### PWA (Progressive Web App)

- Client uygulaması PWA desteği ile mobil cihazlara yüklenebilir
- Offline çalışma (Workbox runtime caching)
- Service worker otomatik güncelleme

## 🛠️ Geliştirme

### Kod Standartları

- **Yarn kullan** (npm değil!)
- TypeScript strict mode
- Tailwind utility-first yaklaşımı
- React hooks & functional components
- RESTful API tasarımı

### Proje Detayları

Her alt proje için detaylı README:

- [kernel/README.md](kernel/README.md)
- [adminpanel/README.md](adminpanel/README.md)
- [client/README.md](client/README.md)
- [web/README.md](web/README.md)

## 📝 Lisans

ISC
