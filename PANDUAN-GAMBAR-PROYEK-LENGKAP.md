# 📸 Panduan Lengkap Gambar & Video Proyek

## 📁 Struktur Folder Baru

```
images/projects/
├── screenshots/      → Screenshot utama proyek (gambar besar di modal)
├── thumbnails/       → Thumbnail kecil (4 gambar preview di modal)
├── live-videos/      → Video untuk proyek live streaming
└── videos/           → Video untuk proyek video editing
```

---

## 🎯 Cara Mengisi Setiap Folder

### 1️⃣ **screenshots/** - Screenshot Utama Proyek

**Fungsi:** Gambar besar yang muncul di gallery modal ketika proyek diklik

**Format File:**
- Format: JPG, PNG, atau WEBP
- Ukuran: Minimal 1920x1080px (Full HD)
- Nama file: `[nama-proyek]-screenshot.jpg`

**Contoh:**
```
screenshots/
├── vlog-adventure-screenshot.jpg
├── music-video-screenshot.jpg
├── wedding-edit-screenshot.jpg
└── product-review-screenshot.jpg
```

**Cara Pakai di Code:**
```javascript
projectsData: {
    '1': {
        images: [
            'images/projects/screenshots/vlog-adventure-screenshot.jpg'
        ]
    }
}
```

---

### 2️⃣ **thumbnails/** - Thumbnail Preview

**Fungsi:** 4 gambar kecil di bawah screenshot utama untuk preview tambahan

**Format File:**
- Format: JPG, PNG
- Ukuran: 400x300px atau 16:9 ratio
- Nama file: `[nama-proyek]-thumb-1.jpg`, `-thumb-2.jpg`, dst

**Contoh:**
```
thumbnails/
├── vlog-adventure-thumb-1.jpg
├── vlog-adventure-thumb-2.jpg
├── vlog-adventure-thumb-3.jpg
├── vlog-adventure-thumb-4.jpg
├── music-video-thumb-1.jpg
└── music-video-thumb-2.jpg
```

**Cara Pakai di Code:**
```javascript
projectsData: {
    '1': {
        thumbnails: [
            'images/projects/thumbnails/vlog-adventure-thumb-1.jpg',
            'images/projects/thumbnails/vlog-adventure-thumb-2.jpg',
            'images/projects/thumbnails/vlog-adventure-thumb-3.jpg',
            'images/projects/thumbnails/vlog-adventure-thumb-4.jpg'
        ]
    }
}
```

---

### 3️⃣ **live-videos/** - Video Live Streaming

**Fungsi:** Video untuk proyek kategori "Live Streaming"

**Format File:**
- Format: MP4 (H.264 codec)
- Ukuran: Maksimal 50MB untuk web
- Resolusi: 1920x1080 atau 1280x720
- Nama file: `[nama-stream]-live.mp4`

**Contoh:**
```
live-videos/
├── gaming-stream-live.mp4
├── podcast-episode-live.mp4
└── webinar-recording-live.mp4
```

**Cara Pakai di Code:**
```javascript
projectsData: {
    '1': {
        category: 'live',
        video: 'images/projects/live-videos/gaming-stream-live.mp4'
    }
}
```

---

### 4️⃣ **videos/** - Video Editing Projects

**Fungsi:** Video untuk proyek kategori "Video Editing" atau "Motion Graphics"

**Format File:**
- Format: MP4 (H.264 codec)
- Ukuran: Maksimal 50MB untuk web
- Resolusi: 1920x1080 atau 1280x720
- Nama file: `[nama-proyek]-edit.mp4`

**Contoh:**
```
videos/
├── wedding-cinematic-edit.mp4
├── product-commercial-edit.mp4
├── music-video-edit.mp4
└── corporate-video-edit.mp4
```

**Cara Pakai di Code:**
```javascript
projectsData: {
    '2': {
        category: 'editing',
        video: 'images/projects/videos/wedding-cinematic-edit.mp4'
    }
}
```

---

## 🔧 Cara Update di index.html

### Lokasi Code: Cari `projectsData` di JavaScript

```javascript
const projectsData = {
    '1': {
        title: 'Judul Proyek',
        category: 'vlog', // atau 'editing', 'motion', 'live'
        description: 'Deskripsi lengkap proyek...',
        client: 'Nama Client',
        date: 'Januari 2024',
        duration: '10:30',
        tools: ['Premiere Pro', 'After Effects'],
        
        // GAMBAR UTAMA (Screenshot)
        images: [
            'images/projects/screenshots/nama-proyek-screenshot.jpg'
        ],
        
        // THUMBNAIL (4 gambar kecil)
        thumbnails: [
            'images/projects/thumbnails/nama-proyek-thumb-1.jpg',
            'images/projects/thumbnails/nama-proyek-thumb-2.jpg',
            'images/projects/thumbnails/nama-proyek-thumb-3.jpg',
            'images/projects/thumbnails/nama-proyek-thumb-4.jpg'
        ],
        
        // VIDEO (jika ada)
        video: 'images/projects/videos/nama-proyek-edit.mp4',
        
        // LINK (opsional)
        links: {
            youtube: 'https://youtube.com/watch?v=xxx',
            instagram: 'https://instagram.com/p/xxx'
        }
    },
    
    '2': {
        // Proyek kedua...
    }
};
```

---

## 📝 Contoh Lengkap: Proyek Vlog

### 1. Upload File ke Folder:
```
images/projects/
├── screenshots/
│   └── vlog-bali-adventure-screenshot.jpg
├── thumbnails/
│   ├── vlog-bali-adventure-thumb-1.jpg
│   ├── vlog-bali-adventure-thumb-2.jpg
│   ├── vlog-bali-adventure-thumb-3.jpg
│   └── vlog-bali-adventure-thumb-4.jpg
└── videos/
    └── vlog-bali-adventure-edit.mp4
```

### 2. Update Code di index.html:
```javascript
const projectsData = {
    '1': {
        title: 'Bali Adventure Vlog',
        category: 'vlog',
        description: 'Dokumentasi perjalanan ke Bali dengan cinematic shots dan color grading profesional.',
        client: 'Personal Project',
        date: 'Januari 2024',
        duration: '12:45',
        tools: ['Premiere Pro', 'Lightroom', 'After Effects'],
        images: [
            'images/projects/screenshots/vlog-bali-adventure-screenshot.jpg'
        ],
        thumbnails: [
            'images/projects/thumbnails/vlog-bali-adventure-thumb-1.jpg',
            'images/projects/thumbnails/vlog-bali-adventure-thumb-2.jpg',
            'images/projects/thumbnails/vlog-bali-adventure-thumb-3.jpg',
            'images/projects/thumbnails/vlog-bali-adventure-thumb-4.jpg'
        ],
        video: 'images/projects/videos/vlog-bali-adventure-edit.mp4',
        links: {
            youtube: 'https://youtube.com/watch?v=xxx'
        }
    }
};
```

---

## ⚠️ Tips Penting

### ✅ DO (Lakukan):
- Gunakan nama file yang jelas dan konsisten
- Kompres gambar sebelum upload (gunakan TinyPNG.com)
- Kompres video untuk web (maksimal 50MB)
- Gunakan format JPG untuk foto, PNG untuk grafis
- Gunakan huruf kecil dan dash (-) untuk nama file

### ❌ DON'T (Jangan):
- Jangan gunakan spasi dalam nama file
- Jangan upload file terlalu besar (>10MB untuk gambar)
- Jangan gunakan karakter khusus (!@#$%^&*)
- Jangan lupa update path di code setelah upload

---

## 🎨 Rekomendasi Ukuran File

| Tipe | Ukuran Ideal | Maksimal |
|------|--------------|----------|
| Screenshot | 1920x1080px, ~500KB | 2MB |
| Thumbnail | 400x300px, ~100KB | 500KB |
| Video | 1920x1080p, ~20MB | 50MB |

---

## 🔄 Cara Clear Cache Setelah Update

1. Tekan `Ctrl + Shift + N` (Incognito Mode)
2. Atau tekan `Ctrl + F5` (Hard Refresh)
3. Atau buka Developer Tools (`F12`) → Network tab → Centang "Disable cache"

---

## 📞 Butuh Bantuan?

Jika ada masalah atau pertanyaan, cek file:
- `CARA-CLEAR-CACHE.md` - Cara refresh browser
- `PANDUAN-FOTO.md` - Panduan upload foto umum
- `PANDUAN-VIDEO.md` - Panduan upload video

---

**Dibuat:** 7 Mei 2026  
**Update Terakhir:** 7 Mei 2026
