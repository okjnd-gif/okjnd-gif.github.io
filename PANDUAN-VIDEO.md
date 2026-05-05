# 📹 Panduan Upload Video

## 📁 Struktur Folder

Video Anda harus diletakkan di folder:
```
d:/jule/portopolio/videos/
```

## 🎬 File Video yang Dibutuhkan

Website membutuhkan **4 video** dengan nama file berikut:

1. **featured-video.mp4** - Video utama (Featured Video)
2. **vlog-editing.mp4** - Video card 1 (Cinematic Vlog)
3. **color-grading.mp4** - Video card 2 (Color Grading)
4. **motion-graphics.mp4** - Video card 3 (Motion Graphics)

## 📝 Format Video yang Didukung

- **MP4** (Recommended) - Format paling umum dan kompatibel
- **WebM** (Optional) - Format alternatif untuk browser tertentu

## 📏 Rekomendasi Spesifikasi Video

### Resolusi:
- **Minimum**: 1280x720 (720p)
- **Recommended**: 1920x1080 (1080p)
- **Aspect Ratio**: 16:9

### Ukuran File:
- **Featured Video**: Maksimal 50MB
- **Video Cards**: Maksimal 30MB per video

### Durasi:
- **Featured Video**: 2-5 menit
- **Video Cards**: 1-3 menit

### Codec:
- **Video Codec**: H.264
- **Audio Codec**: AAC (optional, karena video akan di-mute)

## 🚀 Cara Upload Video

### Metode 1: Copy Paste Manual

1. Buka folder `d:/jule/portopolio/videos/`
2. Copy file video Anda ke folder tersebut
3. Rename file sesuai nama yang dibutuhkan:
   - `featured-video.mp4`
   - `vlog-editing.mp4`
   - `color-grading.mp4`
   - `motion-graphics.mp4`

### Metode 2: Drag and Drop

1. Buka Windows Explorer
2. Navigate ke `d:/jule/portopolio/videos/`
3. Drag and drop file video Anda
4. Rename sesuai nama yang dibutuhkan

## ⚙️ Fitur Video

Video akan otomatis:
- ✅ **Autoplay** - Otomatis play saat halaman dibuka
- ✅ **Muted** - Tanpa suara (muted)
- ✅ **Loop** - Video akan loop terus menerus
- ✅ **Controls** - Menampilkan kontrol play/pause
- ✅ **Responsive** - Menyesuaikan ukuran layar

## 🎨 Poster/Thumbnail Video

Setiap video memiliki poster (thumbnail) yang ditampilkan sebelum video dimuat:

- **Featured Video**: `images/projects/vlog.png`
- **Vlog Editing**: `images/projects/vlog.png`
- **Color Grading**: `images/projects/musikk.jfif`
- **Motion Graphics**: `images/projects/motion.jfif`

Anda bisa mengganti poster dengan mengganti file gambar tersebut.

## 🔧 Cara Mengganti Nama File Video

Jika Anda ingin menggunakan nama file yang berbeda, edit di `index.html`:

### Contoh untuk Featured Video:
```html
<video autoplay muted loop playsinline controls poster="images/projects/vlog.png">
    <source src="videos/NAMA-FILE-ANDA.mp4" type="video/mp4">
    <source src="videos/NAMA-FILE-ANDA.webm" type="video/webm">
</video>
```

Ganti `NAMA-FILE-ANDA.mp4` dengan nama file video Anda.

## 🎯 Tips Optimasi Video

### 1. Kompres Video
Gunakan tools seperti:
- **HandBrake** (Free, Windows/Mac/Linux)
- **Adobe Media Encoder** (Professional)
- **Online Video Compressor** (cloudconvert.com)

### 2. Target Bitrate
- **1080p**: 5-8 Mbps
- **720p**: 3-5 Mbps

### 3. Potong Durasi
Video yang lebih pendek = loading lebih cepat

### 4. Hapus Audio Track
Karena video di-mute, Anda bisa hapus audio track untuk menghemat ukuran file.

## ❓ Troubleshooting

### Video tidak muncul?
1. Cek nama file sudah benar
2. Cek file ada di folder `videos/`
3. Cek format video (harus .mp4 atau .webm)
4. Refresh browser (Ctrl + F5)

### Video tidak autoplay?
- Ini normal di beberapa browser untuk menghemat bandwidth
- User bisa klik play manual
- Pastikan atribut `muted` ada (browser block autoplay dengan suara)

### Video terlalu besar/lambat loading?
1. Kompres video dengan HandBrake
2. Kurangi resolusi ke 720p
3. Kurangi bitrate
4. Potong durasi video

## 📱 Browser Support

Video HTML5 didukung oleh:
- ✅ Chrome/Edge (Recommended)
- ✅ Firefox
- ✅ Safari
- ✅ Opera
- ✅ Mobile browsers

## 🔄 Update Video

Untuk mengganti video:
1. Hapus video lama di folder `videos/`
2. Copy video baru dengan nama yang sama
3. Refresh browser (Ctrl + F5) untuk clear cache

## 📞 Bantuan

Jika ada masalah, pastikan:
- File video ada di folder yang benar
- Nama file sesuai dengan yang ada di HTML
- Format video didukung (MP4/WebM)
- Ukuran file tidak terlalu besar

---

**Selamat mencoba! 🎬**
