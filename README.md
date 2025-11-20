ExploreMap - Aplikasi Peta Interaktif
IDENTITAS DEVELOPER
Nama : Rifki Febrian
NPM : 23552011430
Kelas : 23 CID A
Mata Kuliah : Pemrograman Mobile 2
Dosen : Nova Agustina, S.T., M.Kom.
Universitas : Universitas Teknologi Bandung
Tahun : 2025

📱 Tentang Aplikasi
ExploreMap adalah aplikasi peta interaktif yang memungkinkan pengguna untuk menjelajahi tempat-tempat menarik di sekitar mereka. Aplikasi ini dikembangkan sebagai proyek mata kuliah Pemrograman Mobile 2.

<div align="center">
https://github.com/user-attachments/assets/99ed67f5-b30f-4ad1-b8be-c490d476197b

Aplikasi Peta Interaktif Modern

</div>
✨ Fitur-Fitur Aplikasi
1. 🎬 Splash Screen
https://github.com/user-attachments/assets/99ed67f5-b30f-4ad1-b8be-c490d476197b

Tampilan pembuka aplikasi dengan logo ExploreMap

Loading screen sebelum masuk ke halaman utama

2. 🔐 Autentikasi Pengguna
Login Screen
https://github.com/user-attachments/assets/0792c0ab-15ac-4d71-b9d3-e943a6385169

Input email dan password

Validasi form login

Opsi "Remember Me"

3. 🏠 Dashboard
https://github.com/user-attachments/assets/f2cbe7e8-a3dc-4f08-acd6-b8c577806aee

Statistik Pengguna:

Jumlah tempat dikunjungi (128)

Jumlah favorit (24)

Jumlah ulasan (12)

Status keanggotaan (Premium Member)

Menu navigasi lengkap

4. 🗺️ Interactive Maps
https://github.com/user-attachments/assets/1ce4827b-4d4a-4105-afe0-89afa11bbfeb

Peta interaktif dengan marker lokasi

Pencarian lokasi berdasarkan nama

Filter kategori tempat

Navigasi ke lokasi tujuan

5. 🔍 Explore Maps
https://github.com/user-attachments/assets/611216ad-560a-478e-ab49-13791cb7eea1

Fitur Pencarian: "Cari tempat menarik..."

Filter Kategori: Semua, Landmark, Rekreasi

Daftar Lokasi Populer:

Monas (Monumen Nasional Indonesia) - Rating 4.8 ⭐

Taman Mini Indonesia Indah - Rating 4.5 ⭐

Kota Tua Jakarta - Rating 4.3 ⭐

6. 👤 Profile Page
https://github.com/user-attachments/assets/5fb6ef61-5d3e-4b8b-b1f8-0959a76207f1

Informasi profil pengguna lengkap

Edit Profil

Pengaturan aplikasi

Bantuan & Support

Tentang Aplikasi

7. ℹ️ About Apps
https://github.com/user-attachments/assets/769278a0-e80f-4b9b-9caa-b7ec160c893e

Informasi versi aplikasi (1.0.0)

Update terakhir (20 November 2025)

Detail developer dan kredensial

Kategori aplikasi (Peta & Navigasi)

🎯 Kategori Tempat
Kategori	Ikon	Contoh Tempat
🏛️ Landmark	🏛️	Monas, Gedung Sate
🎢 Rekreasi	🎢	TMII, Dunia Fantasi
📜 Sejarah	📜	Kota Tua, Museum
📊 Navigasi Bottom Bar
<div align="center">
Home	Map	Explore	Profile
🏠	🗺️	🔍	👤
</div>
🛠️ Teknologi yang Digunakan
Framework: Flutter/Dart

State Management: Provider/Bloc

Maps Integration: Google Maps API

Database: Firebase/SQLite

Authentication: Firebase Auth

Development Tools: Android Studio

📋 Persyaratan Sistem
Android 8.0 (Oreo) atau lebih tinggi

Koneksi internet untuk fitur maps

GPS untuk lokasi real-time

Minimal 50MB storage space

Layar dengan resolusi minimal 720p

🚀 Cara Menjalankan
bash
# 1. Clone repository
git clone https://github.com/rifkifebrian/exploremap.git

# 2. Masuk ke directory project
cd exploremap

# 3. Install dependencies
flutter pub get

# 4. Setup Firebase project (jika menggunakan Firebase)

# 5. Tambahkan Google Maps API key di android/app/src/main/AndroidManifest.xml

# 6. Run aplikasi
flutter run
📁 Struktur Project
text
exploremap/
├── lib/
│   ├── screens/
│   │   ├── splash_screen.dart
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   │   ├── home_screen.dart
│   │   ├── dashboard_screen.dart
│   │   ├── map_screen.dart
│   │   ├── explore_screen.dart
│   │   ├── profile_screen.dart
│   │   └── about_screen.dart
│   ├── models/
│   │   ├── user_model.dart
│   │   ├── place_model.dart
│   │   └── category_model.dart
│   ├── services/
│   │   ├── auth_service.dart
│   │   ├── map_service.dart
│   │   └── database_service.dart
│   ├── utils/
│   │   ├── constants.dart
│   │   ├── helpers.dart
│   │   └── validators.dart
│   └── main.dart
├── assets/
│   ├── images/
│   │   ├── logo.png
│   │   ├── splash.png
│   │   └── icons/
│   └── fonts/
├── android/
├── ios/
└── pubspec.yaml
🔧 Konfigurasi yang Diperlukan
Google Maps API
Dapatkan API Key dari Google Cloud Console

Tambahkan di android/app/src/main/AndroidManifest.xml:

xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY_HERE"/>
Firebase Setup (Opsional)
Buat project di Firebase Console

Download google-services.json untuk Android

Tempatkan di android/app/ directory

📸 Galeri Screenshot Aplikasi
<div align="center">
Flow Penggunaan Aplikasi
Splash Screen	Login Screen	Dashboard
https://github.com/user-attachments/assets/99ed67f5-b30f-4ad1-b8be-c490d476197b	https://github.com/user-attachments/assets/0792c0ab-15ac-4d71-b9d3-e943a6385169	https://github.com/user-attachments/assets/f2cbe7e8-a3dc-4f08-acd6-b8c577806aee
Maps Screen	Explore Screen	Profile Screen
https://github.com/user-attachments/assets/1ce4827b-4d4a-4105-afe0-89afa11bbfeb	https://github.com/user-attachments/assets/611216ad-560a-478e-ab49-13791cb7eea1	https://github.com/user-attachments/assets/5fb6ef61-5d3e-4b8b-b1f8-0959a76207f1
About Screen
https://github.com/user-attachments/assets/769278a0-e80f-4b9b-9caa-b7ec160c893e
</div>
📄 Lisensi
Aplikasi ini dikembangkan untuk tujuan edukasi dalam rangka memenuhi tugas mata kuliah Pemrograman Mobile 2 Universitas Teknologi Bandung.

<div align="center">
© 2025 Rifki Febrian - Universitas Teknologi Bandung

Mata Kuliah: Pemrograman Mobile 2 | Dosen: Nova Agustina, S.T., M.Kom.

</div>
📞 Kontak Developer
Email: rifki.febrian@student.utb.ac.id

NPM: 23552011430

Kelas: 23 CID A

Catatan: Aplikasi ini masih dalam tahap pengembangan dan mungkin terdapat fitur yang akan ditambahkan atau disempurnakan di masa depan.
