# Docker Setup Guide

## Prerequisites

- **Docker** ([Download](https://www.docker.com/products/docker-desktop))
- **Docker Compose** (included with Docker Desktop)
- **Make** (optional, for convenience commands on Mac/Linux)

### Verify Installation

```bash
docker --version
docker-compose --version
make --version  # Optional
```

---

## 🚀 Quick Start (One Command!)

### Option 1: Using Make (Recommended for Mac/Linux)

```bash
# Build and start all services
make up
```

### Option 2: Using Docker Compose Directly

```bash
# Build images
docker-compose build

# Start all services
docker-compose up -d
```

### Option 3: Windows (without Make)

```bash
docker-compose build
docker-compose up -d
```

---

## 📱 Access Your Application

Once services are running:

| Service | URL | Purpose |
|---------|-----|----------|
| **Frontend** | http://localhost:5173 | React App |
| **Backend API** | http://localhost:5000/api | REST API |
| **Database** | localhost:5432 | PostgreSQL |
| **pgAdmin** | http://localhost:5050 | Database GUI |

### pgAdmin Login Credentials
- **Email:** admin@example.com
- **Password:** admin

---

## 📋 Useful Commands

### View All Running Services

```bash
make ps
# or
docker-compose ps
```

### View Logs

```bash
# All services
make logs

# Specific service
make logs-backend
make logs-frontend
make logs-db
```

### Open Shell in Container

```bash
# Backend container
make shell-backend

# Frontend container
make shell-frontend

# PostgreSQL container
make shell-db
```

### Stop All Services

```bash
make down
# or
docker-compose down
```

### Reset Database

```bash
make db-reset
# or
docker-compose exec postgres psql -U postgres -d exam_download_db -f /docker-entrypoint-initdb.d/schema.sql
```

### Clean Everything (Remove volumes)

```bash
make clean
# or
docker-compose down -v
```

### Restart Services

```bash
make restart
# or
docker-compose restart
```

---

## 🔧 Configuration

### Backend Environment Variables

Edit `backend/.env.example` and set:

```bash
PORT=5000
NODE_ENV=development
DB_HOST=postgres        # Service name in docker-compose
DB_PORT=5432
DB_NAME=exam_download_db
DB_USER=postgres
DB_PASSWORD=postgres_password
JWT_SECRET=your_secret_key
FRONTEND_URL=http://localhost:5173
```

### Frontend Environment Variables

Create `frontend/.env`:

```bash
VITE_API_URL=http://localhost:5000/api
```

---

## 📊 What's Running

### Services in Docker Compose

1. **PostgreSQL** (postgres:15-alpine)
   - Port: 5432
   - User: postgres
   - Password: postgres_password
   - Database: exam_download_db

2. **Backend** (Node.js + Express)
   - Port: 5000
   - Hot reload enabled
   - Waits for PostgreSQL to be healthy

3. **Frontend** (React + Vite)
   - Port: 5173
   - Hot reload enabled
   - Proxies API calls to backend

4. **pgAdmin** (Database GUI)
   - Port: 5050
   - Optional, for database management

---

## 🐛 Troubleshooting

### Port Already in Use

```bash
# Find process using port
lsof -i :5000    # Backend
lsof -i :5173    # Frontend
lsof -i :5432    # Database

# Kill process (macOS/Linux)
kill -9 <PID>

# Or change port in docker-compose.yml
```

### Container Won't Start

```bash
# Check logs
make logs

# Rebuild containers
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

### Database Connection Error

```bash
# Check if PostgreSQL is healthy
docker-compose ps

# Restart database
docker-compose restart postgres

# Reset database schema
make db-reset
```

### Docker Desktop Not Running (Windows/Mac)

- Open Docker Desktop application
- Wait for it to fully load
- Try again

### Permission Denied Error (Linux)

```bash
sudo usermod -aG docker $USER
groups $USER
# Logout and login, or use: newgrp docker
```

---

## 🧹 Cleanup

### Remove All Containers and Volumes

```bash
make clean
```

### Remove Specific Service

```bash
docker-compose down postgres
```

### Remove All Docker Images (Careful!)

```bash
docker rmi exam-download-app-backend exam-download-app-frontend
```

---

## 📝 Testing

### Test Backend API

```bash
# Health check
curl http://localhost:5000/api/health

# Get random joke
curl http://localhost:5000/api/jokes/random

# Inside container
make shell-backend
npm test
```

### Test Frontend

Visit http://localhost:5173 in your browser

---

## 🚀 Production Deployment

### Build Production Images

```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml build
```

### Deploy to Cloud

- **AWS ECS** - Push images to ECR, deploy with ECS
- **Digital Ocean App Platform** - Connect GitHub, auto-deploy
- **Heroku** - `heroku container:push` and `heroku container:release`
- **Google Cloud Run** - Push to Container Registry, deploy

---

## 📚 Additional Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Reference](https://docs.docker.com/compose/compose-file/)
- [Node.js Best Practices in Docker](https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md)
- [PostgreSQL Docker Image](https://hub.docker.com/_/postgres)

---

## ✅ Common Workflow

```bash
# 1. Start the project
make up

# 2. Check services are running
make ps

# 3. View logs
make logs

# 4. Open browser to http://localhost:5173

# 5. Make code changes (hot reload enabled)

# 6. When done, stop services
make down

# 7. Clean up (optional)
make clean
```

---

Happy coding! 🎉