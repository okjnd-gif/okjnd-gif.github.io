# Portfolio CMS - Arsitektur Sistem

## 📋 Overview

Mengubah website portfolio statis menjadi Content Management System (CMS) lengkap dengan backend Node.js/Express, database MongoDB, dan admin dashboard untuk mengelola semua konten secara dinamis.

---

## 🎯 Tujuan

1. **Manajemen Konten Dinamis**: Admin dapat mengelola projects, skills, videos, dan profile tanpa edit kode
2. **File Upload System**: Upload dan manage gambar/video melalui dashboard
3. **Authentication**: Sistem login aman untuk admin
4. **REST API**: Backend API untuk serve konten ke frontend
5. **Responsive Admin Dashboard**: Interface yang mudah digunakan untuk manage konten

---

## 🏗️ Arsitektur Sistem

```
┌─────────────────────────────────────────────────────────────┐
│                        CLIENT LAYER                          │
├──────────────────────────┬──────────────────────────────────┤
│   Portfolio Website      │      Admin Dashboard             │
│   (Frontend - Public)    │      (Frontend - Private)        │
│   - View portfolio       │      - Login                     │
│   - Contact form         │      - Manage projects           │
│   - Responsive design    │      - Manage skills             │
│                          │      - Manage videos             │
│                          │      - Upload files              │
└──────────────────────────┴──────────────────────────────────┘
                              ↕ HTTP/HTTPS
┌─────────────────────────────────────────────────────────────┐
│                      API LAYER (Express)                     │
├─────────────────────────────────────────────────────────────┤
│  REST API Endpoints:                                         │
│  - /api/auth/*          - Authentication                     │
│  - /api/projects/*      - Projects CRUD                      │
│  - /api/skills/*        - Skills CRUD                        │
│  - /api/videos/*        - Videos CRUD                        │
│  - /api/profile/*       - Profile management                 │
│  - /api/contact/*       - Contact form                       │
│  - /api/upload/*        - File uploads                       │
│                                                              │
│  Middleware:                                                 │
│  - Authentication (JWT)                                      │
│  - File upload (Multer)                                      │
│  - Error handling                                            │
│  - CORS                                                      │
└─────────────────────────────────────────────────────────────┘
                              ↕
┌─────────────────────────────────────────────────────────────┐
│                    DATABASE LAYER (MongoDB)                  │
├─────────────────────────────────────────────────────────────┤
│  Collections:                                                │
│  - users          - Admin users                              │
│  - projects       - Portfolio projects                       │
│  - skills         - Skills & expertise                       │
│  - videos         - Demo reel videos                         │
│  - profile        - Profile information                      │
│  - settings       - Site settings                            │
│  - contacts       - Contact form submissions                 │
└─────────────────────────────────────────────────────────────┘
                              ↕
┌─────────────────────────────────────────────────────────────┐
│                    FILE STORAGE                              │
├─────────────────────────────────────────────────────────────┤
│  - Local: /uploads folder                                    │
│  - Cloud: AWS S3 / Cloudinary (optional)                     │
│  - Images: Profile, skills, projects                         │
│  - Videos: Project videos, demo reel                         │
└─────────────────────────────────────────────────────────────┘
```

---

## 📊 Database Schema (MongoDB)

### 1. Users Collection
```javascript
{
  _id: ObjectId,
  username: String (unique, required),
  email: String (unique, required),
  password: String (hashed, required),
  role: String (enum: ['admin', 'editor'], default: 'admin'),
  createdAt: Date,
  updatedAt: Date
}
```

### 2. Projects Collection
```javascript
{
  _id: ObjectId,
  title: String (required),
  category: String (required), // 'vlog', 'editing', 'motion'
  description: String (required),
  technologies: [String],
  features: [String],
  client: String,
  images: [{
    url: String,
    filename: String,
    type: String // 'image' or 'video'
  }],
  links: {
    youtube: String,
    instagram: String,
    tiktok: String,
    behance: String
  },
  order: Number, // untuk sorting
  isActive: Boolean (default: true),
  createdAt: Date,
  updatedAt: Date
}
```

### 3. Skills Collection
```javascript
{
  _id: ObjectId,
  title: String (required),
  slug: String (unique, required), // 'premiere-pro', 'photoshop'
  icon: String, // Font Awesome class
  image: {
    url: String,
    filename: String
  },
  level: String, // 'Beginner', 'Intermediate', 'Advanced', 'Expert'
  levelColor: String, // hex color
  experience: {
    years: String,
    description: String
  },
  progress: [{
    name: String,
    percentage: Number
  }],
  features: [String],
  projects: [String],
  order: Number,
  isActive: Boolean (default: true),
  createdAt: Date,
  updatedAt: Date
}
```

### 4. Videos Collection
```javascript
{
  _id: ObjectId,
  title: String (required),
  description: String,
  videoUrl: String (required),
  thumbnail: String,
  views: String, // '15JT+', '6JT'
  year: Number,
  category: String,
  isFeatured: Boolean (default: false),
  order: Number,
  isActive: Boolean (default: true),
  createdAt: Date,
  updatedAt: Date
}
```

### 5. Profile Collection
```javascript
{
  _id: ObjectId,
  name: String (required),
  title: String, // 'Video Editor & Content Creator'
  bio: String,
  profileImage: {
    url: String,
    filename: String
  },
  logoImage: {
    url: String,
    filename: String
  },
  contact: {
    email: String,
    phone: String,
    location: String,
    whatsapp: String
  },
  socialLinks: {
    github: String,
    linkedin: String,
    twitter: String,
    instagram: String
  },
  stats: [{
    label: String,
    value: String
  }],
  updatedAt: Date
}
```

### 6. Settings Collection
```javascript
{
  _id: ObjectId,
  siteName: String,
  siteDescription: String,
  splashScreen: {
    enabled: Boolean,
    logoUrl: String,
    text: String
  },
  theme: {
    primaryColor: String,
    secondaryColor: String
  },
  seo: {
    metaTitle: String,
    metaDescription: String,
    keywords: [String]
  },
  updatedAt: Date
}
```

### 7. Contacts Collection
```javascript
{
  _id: ObjectId,
  name: String (required),
  email: String (required),
  subject: String,
  message: String (required),
  isRead: Boolean (default: false),
  createdAt: Date
}
```

---

## 🔌 API Endpoints

### Authentication
- `POST /api/auth/register` - Register admin (first time only)
- `POST /api/auth/login` - Login admin
- `POST /api/auth/logout` - Logout admin
- `GET /api/auth/me` - Get current user (protected)

### Projects
- `GET /api/projects` - Get all projects (public)
- `GET /api/projects/:id` - Get single project (public)
- `POST /api/projects` - Create project (protected)
- `PUT /api/projects/:id` - Update project (protected)
- `DELETE /api/projects/:id` - Delete project (protected)
- `PATCH /api/projects/:id/toggle` - Toggle active status (protected)

### Skills
- `GET /api/skills` - Get all skills (public)
- `GET /api/skills/:slug` - Get single skill (public)
- `POST /api/skills` - Create skill (protected)
- `PUT /api/skills/:id` - Update skill (protected)
- `DELETE /api/skills/:id` - Delete skill (protected)

### Videos
- `GET /api/videos` - Get all videos (public)
- `GET /api/videos/featured` - Get featured video (public)
- `POST /api/videos` - Create video (protected)
- `PUT /api/videos/:id` - Update video (protected)
- `DELETE /api/videos/:id` - Delete video (protected)
- `PATCH /api/videos/:id/feature` - Set as featured (protected)

### Profile
- `GET /api/profile` - Get profile (public)
- `PUT /api/profile` - Update profile (protected)

### Settings
- `GET /api/settings` - Get settings (public)
- `PUT /api/settings` - Update settings (protected)

### Contact
- `POST /api/contact` - Submit contact form (public)
- `GET /api/contact` - Get all messages (protected)
- `PATCH /api/contact/:id/read` - Mark as read (protected)
- `DELETE /api/contact/:id` - Delete message (protected)

### File Upload
- `POST /api/upload/image` - Upload image (protected)
- `POST /api/upload/video` - Upload video (protected)
- `DELETE /api/upload/:filename` - Delete file (protected)

---

## 📁 Struktur Folder Project

```
portfolio-cms/
├── backend/
│   ├── config/
│   │   ├── db.js                 # MongoDB connection
│   │   ├── cloudinary.js         # Cloudinary config (optional)
│   │   └── multer.js             # File upload config
│   ├── controllers/
│   │   ├── authController.js
│   │   ├── projectController.js
│   │   ├── skillController.js
│   │   ├── videoController.js
│   │   ├── profileController.js
│   │   ├── settingsController.js
│   │   ├── contactController.js
│   │   └── uploadController.js
│   ├── models/
│   │   ├── User.js
│   │   ├── Project.js
│   │   ├── Skill.js
│   │   ├── Video.js
│   │   ├── Profile.js
│   │   ├── Settings.js
│   │   └── Contact.js
│   ├── routes/
│   │   ├── auth.js
│   │   ├── projects.js
│   │   ├── skills.js
│   │   ├── videos.js
│   │   ├── profile.js
│   │   ├── settings.js
│   │   ├── contact.js
│   │   └── upload.js
│   ├── middleware/
│   │   ├── auth.js              # JWT authentication
│   │   ├── errorHandler.js      # Error handling
│   │   └── upload.js            # Multer middleware
│   ├── utils/
│   │   ├── generateToken.js     # JWT token generator
│   │   └── validators.js        # Input validation
│   ├── uploads/                 # Local file storage
│   │   ├── images/
│   │   └── videos/
│   ├── .env                     # Environment variables
│   ├── .gitignore
│   ├── package.json
│   └── server.js                # Entry point
│
├── frontend/                    # Existing portfolio website
│   ├── index.html
│   ├── style.css
│   ├── script.js                # Modified to fetch from API
│   └── images/
│
├── admin/                       # Admin dashboard
│   ├── index.html               # Login page
│   ├── dashboard.html           # Main dashboard
│   ├── projects.html            # Manage projects
│   ├── skills.html              # Manage skills
│   ├── videos.html              # Manage videos
│   ├── profile.html             # Manage profile
│   ├── settings.html            # Site settings
│   ├── contacts.html            # View messages
│   ├── css/
│   │   └── admin.css
│   └── js/
│       ├── auth.js
│       ├── api.js               # API calls
│       ├── projects.js
│       ├── skills.js
│       ├── videos.js
│       └── utils.js
│
└── README.md
```

---

## 🛠️ Technology Stack

### Backend
- **Runtime**: Node.js (v18+)
- **Framework**: Express.js
- **Database**: MongoDB (with Mongoose ODM)
- **Authentication**: JWT (jsonwebtoken)
- **File Upload**: Multer
- **Image Processing**: Sharp (optional, for optimization)
- **Validation**: Express-validator
- **Security**: 
  - Helmet (security headers)
  - CORS
  - bcryptjs (password hashing)
  - express-rate-limit (rate limiting)

### Frontend (Portfolio)
- **HTML5/CSS3/JavaScript** (existing)
- **Fetch API** untuk komunikasi dengan backend
- **Minimal changes** - hanya modifikasi untuk fetch data dari API

### Admin Dashboard
- **Option 1**: Vanilla JavaScript (simple, no build process)
- **Option 2**: React.js (modern, component-based)
- **Option 3**: Vue.js (progressive, easy to learn)
- **UI Framework**: Bootstrap 5 atau Tailwind CSS
- **Rich Text Editor**: TinyMCE atau Quill.js
- **File Upload**: Dropzone.js

### DevOps & Deployment
- **Version Control**: Git
- **Hosting Backend**: 
  - Heroku
  - Railway
  - DigitalOcean
  - AWS EC2
- **Hosting Frontend**: 
  - Netlify
  - Vercel
  - GitHub Pages
- **Database**: MongoDB Atlas (cloud)
- **File Storage**: 
  - Local (development)
  - AWS S3 (production)
  - Cloudinary (images/videos)

---

## 🔒 Security Considerations

### 1. Authentication & Authorization
- JWT tokens dengan expiration time
- Refresh token mechanism
- Password hashing dengan bcrypt (salt rounds: 10)
- Role-based access control (RBAC)

### 2. Input Validation
- Sanitize semua input dari user
- Validate data types dan format
- Prevent SQL/NoSQL injection
- XSS protection

### 3. File Upload Security
- Validate file types (whitelist)
- Limit file size (images: 5MB, videos: 100MB)
- Rename files dengan unique identifier
- Scan for malware (optional)
- Store files outside web root

### 4. API Security
- Rate limiting (prevent DDoS)
- CORS configuration
- HTTPS only (production)
- Security headers (Helmet)
- API key untuk public endpoints (optional)

### 5. Database Security
- MongoDB connection string di environment variables
- Use MongoDB Atlas with IP whitelist
- Regular backups
- Encrypt sensitive data

---

## 📝 Implementation Steps

### Phase 1: Backend Setup (Week 1)
1. ✅ Initialize Node.js project
2. ✅ Setup Express server
3. ✅ Connect to MongoDB
4. ✅ Create database models
5. ✅ Implement authentication system
6. ✅ Create REST API endpoints
7. ✅ Setup file upload system
8. ✅ Test API dengan Postman

### Phase 2: Admin Dashboard (Week 2)
1. ✅ Create admin UI layout
2. ✅ Implement login page
3. ✅ Build dashboard homepage
4. ✅ Create CRUD forms untuk:
   - Projects management
   - Skills management
   - Videos management
   - Profile management
5. ✅ Implement file upload UI
6. ✅ Add validation dan error handling

### Phase 3: Frontend Integration (Week 3)
1. ✅ Modify existing frontend untuk fetch dari API
2. ✅ Update JavaScript untuk dynamic content
3. ✅ Implement loading states
4. ✅ Error handling
5. ✅ Test semua fitur
6. ✅ Optimize performance

### Phase 4: Testing & Deployment (Week 4)
1. ✅ Unit testing
2. ✅ Integration testing
3. ✅ Security testing
4. ✅ Performance optimization
5. ✅ Deploy backend ke cloud
6. ✅ Deploy frontend
7. ✅ Setup domain dan SSL
8. ✅ Documentation

---

## 🚀 Deployment Strategy

### Development Environment
```
Backend: http://localhost:5000
Frontend: http://localhost:3000 (atau Live Server)
Admin: http://localhost:3000/admin
Database: MongoDB local atau Atlas
```

### Production Environment
```
Backend: https://api.yourportfolio.com
Frontend: https://yourportfolio.com
Admin: https://yourportfolio.com/admin
Database: MongoDB Atlas
File Storage: AWS S3 atau Cloudinary
```

### Environment Variables (.env)
```
NODE_ENV=production
PORT=5000
MONGODB_URI=mongodb+srv://...
JWT_SECRET=your_secret_key
JWT_EXPIRE=30d
CLOUDINARY_CLOUD_NAME=...
CLOUDINARY_API_KEY=...
CLOUDINARY_API_SECRET=...
AWS_ACCESS_KEY_ID=...
AWS_SECRET_ACCESS_KEY=...
AWS_BUCKET_NAME=...
```

---

## 📊 Performance Optimization

### Backend
- Implement caching (Redis)
- Database indexing
- Pagination untuk list endpoints
- Compress responses (gzip)
- CDN untuk static files

### Frontend
- Lazy loading images/videos
- Code splitting
- Minify CSS/JS
- Image optimization
- Browser caching

### Database
- Create indexes untuk frequently queried fields
- Use aggregation pipeline untuk complex queries
- Implement connection pooling

---

## 🔄 Migration Plan

### Step 1: Data Migration
1. Extract existing data dari HTML
2. Create seed scripts untuk populate database
3. Upload existing images/videos ke storage

### Step 2: Parallel Running
1. Keep existing static site running
2. Deploy CMS di subdomain (cms.yourportfolio.com)
3. Test thoroughly

### Step 3: Cutover
1. Backup everything
2. Switch DNS ke new CMS
3. Monitor for issues
4. Keep old site as backup

---

## 📚 Documentation Needed

1. **API Documentation**: Swagger/OpenAPI
2. **Admin User Guide**: How to use admin dashboard
3. **Developer Guide**: Setup dan development
4. **Deployment Guide**: How to deploy
5. **Troubleshooting Guide**: Common issues

---

## 💰 Cost Estimation

### Free Tier (Development/Small Traffic)
- MongoDB Atlas: Free (512MB)
- Heroku/Railway: Free tier
- Cloudinary: Free (25GB)
- Total: **$0/month**

### Production (Medium Traffic)
- MongoDB Atlas: $9/month (2GB)
- DigitalOcean Droplet: $12/month
- Cloudinary: $89/month (100GB) atau AWS S3: ~$5/month
- Domain: $12/year
- SSL: Free (Let's Encrypt)
- Total: **~$30-110/month**

---

## 🎯 Success Metrics

1. **Performance**: Page load < 3 seconds
2. **Uptime**: 99.9% availability
3. **Security**: No vulnerabilities
4. **Usability**: Admin can manage content without technical knowledge
5. **Scalability**: Handle 10,000+ visitors/month

---

## 📞 Next Steps

1. **Review arsitektur ini** dan berikan feedback
2. **Pilih technology stack** untuk admin dashboard (Vanilla JS / React / Vue)
3. **Tentukan hosting provider** (Heroku / Railway / DigitalOcean)
4. **Mulai implementasi** Phase 1: Backend Setup

---

## 📝 Notes

- Arsitektur ini bersifat modular dan scalable
- Dapat di-extend dengan fitur tambahan (blog, analytics, dll)
- Security adalah prioritas utama
- Performance optimization dari awal
- Documentation lengkap untuk maintenance

---

**Created**: 2026-05-07
**Version**: 1.0
**Status**: Planning Phase
