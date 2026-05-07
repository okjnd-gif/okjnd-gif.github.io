# 🧹 Cara Clear Cache Browser untuk Portfolio Website

## Masalah
Setelah update kode, website masih menampilkan versi lama karena browser menyimpan cache.

## Solusi

### ✅ Cara 1: Incognito/Private Mode (PALING MUDAH)
1. **Tutup semua tab** yang membuka website Anda
2. Tekan **Ctrl+Shift+N** (Chrome) atau **Ctrl+Shift+P** (Firefox)
3. **Drag & drop** file `index.html` ke window Incognito
4. Test apakah skill cards bisa diklik

### ✅ Cara 2: Clear Cache Manual
1. **Tutup SEMUA tab** browser yang membuka website
2. **Tutup browser** sepenuhnya
3. Buka browser lagi
4. Tekan **Ctrl+Shift+Delete**
5. Pilih:
   - ☑️ Cached images and files
   - ☑️ Cookies and other site data (optional)
6. Time range: **All time**
7. Klik **Clear data**
8. Buka file `index.html` lagi

### ✅ Cara 3: Hard Refresh (Cepat tapi tidak selalu berhasil)
1. Buka website Anda
2. Tekan **Ctrl+Shift+R** (atau **Ctrl+F5**)
3. Tunggu halaman reload sepenuhnya

### ✅ Cara 4: Disable Cache di Developer Tools
1. Buka website Anda
2. Tekan **F12** untuk membuka Developer Tools
3. Klik tab **Network**
4. ☑️ Centang **Disable cache**
5. **Jangan tutup** Developer Tools
6. Tekan **Ctrl+R** untuk refresh

## Cara Test Apakah Sudah Berhasil

1. Buka Developer Tools (F12)
2. Klik tab **Console**
3. Refresh halaman
4. Anda harus melihat pesan:
   - `👋 Halo Developer!`
   - `🎯 Skill Modal: Initializing... {skillModal: div#skillModal.modal, skillCardsFound: 7}`
5. Jika muncul, berarti cache sudah clear
6. Coba klik salah satu skill card (Adobe Premiere Pro, Photoshop, dll)
7. Modal harus muncul dengan informasi detail

## Jika Masih Belum Berhasil

Kirim screenshot dari:
1. Console tab (F12 → Console)
2. Bagian skill cards yang tidak bisa diklik

## Tips Mencegah Masalah Cache di Masa Depan

1. **Gunakan Live Server** (VSCode extension) untuk development
2. **Selalu buka** Developer Tools saat testing
3. **Enable "Disable cache"** di Network tab
4. **Gunakan Incognito mode** untuk testing perubahan baru
