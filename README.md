# Exam Download App - Past Year Exam Platform

A modern web application for high school students to download past year exam papers organized by subject and year. Includes a bonus joke generator! 😂

## ✨ Features

- 📚 Browse past year exams by subject and year
- 📥 Download exam papers in PDF format
- 👤 User authentication and profiles
- 🔍 Search and filtering functionality
- ⭐ Bookmark favorite exams
- 📱 Responsive design for desktop and mobile
- 😂 Random Joke Generator with JokeAPI
- 📊 Admin panel for exam management
- 🐳 Docker support for easy setup

## 🛠️ Tech Stack

### Frontend
- React 18+
- Vite (build tool)
- Tailwind CSS (styling)
- Axios (API client)
- React Router (navigation)
- Zustand (state management)

### Backend
- Node.js & Express
- PostgreSQL (database)
- JWT (authentication)
- Multer (file uploads)
- bcryptjs (password hashing)
- External APIs (JokeAPI)

### DevOps
- Docker & Docker Compose
- PostgreSQL (containerized)
- pgAdmin (database GUI)

### Deployment Options
- Frontend: Vercel / Netlify
- Backend: Heroku / AWS EC2 / Railway
- Database: AWS RDS / PostgreSQL Cloud
- File Storage: AWS S3 / Firebase Storage

## 📁 Project Structure

```
exam-download-app/
├── frontend/                 # React application
│   ├── src/
│   │   ├── components/       # Navbar, Footer
│   │   ├── pages/            # Home, ExamList, JokeGenerator, etc
│   │   ├── services/         # API client
│   │   ├── stores/           # Auth state
│   │   ├── App.jsx
│   │   └── index.css
│   ├── Dockerfile
│   ├── vite.config.js
│   ├── tailwind.config.js
│   └── package.json
├── backend/                  # Express API
│   ├── routes/               # auth, exams, users, downloads, jokes
│   ├── models/               # User, Exam models
│   ├── Dockerfile
│   ├── server.js
│   ├── .env.example
│   └── package.json
├── database/                 # Database setup
│   └── schema.sql            # PostgreSQL schema
├── docs/                     # Documentation
│   ├── API.md                # API endpoints
│   ├── SETUP.md              # Manual setup guide
│   ├── DATABASE.md           # Database schema
│   └── DOCKER.md             # Docker setup
├── docker-compose.yml        # Docker orchestration
├── Makefile                  # Convenient commands
└── README.md                 # This file
```

## 🚀 Quick Start with Docker

### Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- Git

### One Command to Start Everything!

#### Mac/Linux (with Make)
```bash
git clone https://github.com/akmalkosnan97/exam-download-app.git
cd exam-download-app
make up
```

#### Windows or without Make
```bash
git clone https://github.com/akmalkosnan97/exam-download-app.git
cd exam-download-app
docker-compose build
docker-compose up -d
```

### Access Your Application

| Service | URL |
|---------|-----|
| Frontend | http://localhost:5173 |
| Backend API | http://localhost:5000/api |
| pgAdmin | http://localhost:5050 |

### Common Docker Commands

```bash
make ps              # Show running containers
make logs            # View logs from all services
make logs-backend    # View backend logs
make logs-frontend   # View frontend logs
make down            # Stop all services
make clean           # Remove all containers and volumes
make shell-backend   # Open terminal in backend
make shell-db        # Open PostgreSQL shell
```

📖 See [docs/DOCKER.md](docs/DOCKER.md) for complete Docker documentation.

---

## 🔧 Manual Setup (Without Docker)

### Prerequisites
- Node.js v14+
- PostgreSQL v12+
- npm or yarn

### Backend Setup

```bash
cd backend
npm install
cp .env.example .env
# Edit .env with your database credentials
npm run dev
```

### Frontend Setup

```bash
cd frontend
npm install
npm run dev
```

Visit http://localhost:5173

📖 See [docs/SETUP.md](docs/SETUP.md) for detailed setup guide.

---

## 📚 API Endpoints

### Base URL
```
http://localhost:5000/api
```

### Key Endpoints

**Authentication**
- `POST /auth/register` - Register new user
- `POST /auth/login` - User login
- `POST /auth/logout` - User logout

**Exams**
- `GET /exams` - Get all exams
- `GET /exams/:id` - Get exam details
- `GET /exams/search/query?q=math` - Search exams

**Users**
- `GET /users/profile` - Get user profile
- `PUT /users/profile` - Update profile
- `GET /users/bookmarks` - Get bookmarked exams

**Downloads**
- `POST /downloads/:examId` - Download exam
- `GET /downloads` - Download history

**Jokes** 😂
- `GET /jokes/random` - Random joke
- `GET /jokes/type/:type` - Joke by type (general, programming, knock-knock)
- `GET /jokes/multiple/:count` - Multiple jokes

📖 See [docs/API.md](docs/API.md) for complete API documentation.

---

## 📊 Features Explained

### 🏠 Homepage
- Hero section with call-to-action buttons
- Feature highlights
- Quick navigation to exams and jokes

### 📖 Browse Exams
- Filter by subject and year
- View exam details and metadata
- Download exam papers
- Bookmark favorite exams
- Track download history

### 😂 Joke Generator
- Get random jokes from JokeAPI
- Filter by joke type
- Add jokes to favorites
- Copy jokes to clipboard
- Beautiful gradient UI

### 🔐 Authentication
- User registration with validation
- Secure login with JWT tokens
- Password hashing with bcryptjs
- Profile management

### 👤 User Dashboard
- View and edit profile
- Download history
- Bookmarked exams
- User preferences

---

## 🔄 Development Workflow

```bash
# 1. Start with Docker
make up

# 2. Code changes auto-reload
# Frontend: http://localhost:5173
# Backend: http://localhost:5000/api

# 3. View logs
make logs

# 4. Test API
curl http://localhost:5000/api/health

# 5. Stop services
make down
```

---

## 📦 Deployment

### Deploy Frontend (Vercel)

```bash
npm install -g vercel
vercel --prod
```

### Deploy Backend (Heroku)

```bash
heroku login
heroku create your-app-name
git push heroku main
```

### Deploy with Docker (AWS, DigitalOcean)

```bash
docker build -t exam-app .
docker push your-registry/exam-app
```

---

## 🐛 Troubleshooting

### Docker won't start
```bash
# Ensure Docker Desktop is running
make clean
make up
```

### Database connection error
```bash
# Check database is healthy
make ps

# Reset database
make db-reset
```

### Port already in use
```bash
# Change port in docker-compose.yml
# or kill the process using the port
```

📖 See [docs/DOCKER.md](docs/DOCKER.md) for more troubleshooting.

---

## 📝 Contributing

1. Fork the repository
2. Create your feature branch
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. Commit your changes
   ```bash
   git commit -m 'Add some AmazingFeature'
   ```
4. Push to the branch
   ```bash
   git push origin feature/AmazingFeature
   ```
5. Open a Pull Request

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details

---

## 💬 Support

For issues and questions:
1. Check [docs/](docs/) for documentation
2. Check [docs/DOCKER.md](docs/DOCKER.md) for Docker issues
3. Open an issue on GitHub

---

## 🎯 Roadmap

- [x] Docker setup
- [x] Joke Generator API
- [ ] Complete authentication
- [ ] File upload to AWS S3
- [ ] Admin dashboard
- [ ] Email notifications
- [ ] Mobile app (React Native)
- [ ] Real-time notifications (WebSockets)
- [ ] Payment integration

---

**Built with ❤️ by Akmal Kosnan**

**Happy coding! 🎉**