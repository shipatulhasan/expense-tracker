````markdown
# Expense Tracker

A modern **Expense Tracker** built with the **MERN Stack**, fully containerized with **Docker**, and automatically deployed to **AWS EC2** using a **GitHub Actions CI/CD pipeline**.

This project demonstrates modern full-stack development, containerization, and production deployment practices.

---

## 🚀 Tech Stack

### Frontend
- React.js
- Vite
- NGINX
- CSS

### Backend
- Node.js
- Express.js

### Database
- MongoDB

### DevOps
- Docker
- Docker Compose
- GitHub Actions
- AWS EC2
- SSH
- rsync

---

## ✨ Features

- Create, edit and delete expenses
- Search expenses by title
- Filter by category
- Filter by date range
- Expense summary dashboard
- Category-wise analytics
- Export expenses as CSV
- Responsive UI
- Dockerized development and production environments
- Automated deployment to AWS EC2

---

## 🏗️ Architecture

```text
                        GitHub Repository
                               │
                        Push to main
                               │
                     GitHub Actions CI/CD
                               │
                        SSH + rsync Deploy
                               │
                           AWS EC2
                               │
                    Docker Compose Stack
                               │
      ┌────────────────┬─────────────────┬────────────────┐
      │                │                 │
  Frontend          Backend          MongoDB
   (NGINX)           Express          Database
      │
      └──────────── REST API ─────────────►
````

---

## 📁 Project Structure

```text
.
├── README.md
├── backend
│   ├── Dockerfile
│   ├── Dockerfile.dev
│   ├── package.json
│   └── src
│       ├── models
│       ├── routes
│       └── server.js
│
├── frontend
│   ├── Dockerfile
│   ├── Dockerfile.dev
│   ├── nginx
│   │   └── default.conf
│   ├── package.json
│   ├── src
│   └── vite.config.js
│
├── scripts
│   └── ec2.bootstrap.sh
│
├── docker-compose.yml
├── docker-compose-dev.yml
└── .github
    └── workflows
        └── deploy.yml
```

---

## ⚙️ Getting Started

### Clone the Repository

```bash
git clone https://github.com/<your-username>/expense-tracker.git
cd expense-tracker
```

### Run with Docker

```bash
docker compose up -d --build
```

Open the application:

```
http://localhost
```

### Development Mode

```bash
docker compose -f docker-compose-dev.yml up --build
```

---

## 🐳 Docker Services

| Service  | Description                       |
| -------- | --------------------------------- |
| frontend | React application served by NGINX |
| backend  | Express.js REST API               |
| mongo    | MongoDB database                  |

---

## 📡 API Endpoints

| Method | Endpoint             | Description      |
| ------ | -------------------- | ---------------- |
| GET    | `/api/health`        | Health Check     |
| GET    | `/api/expenses`      | Get all expenses |
| POST   | `/api/expenses`      | Create expense   |
| PUT    | `/api/expenses/:id`  | Update expense   |
| DELETE | `/api/expenses/:id`  | Delete expense   |
| POST   | `/api/expenses/seed` | Seed sample data |

---

# 🚀 CI/CD Pipeline

Every push to the **main** branch automatically deploys the latest version to an **AWS EC2** instance using **GitHub Actions**.

### Workflow

```text
Developer
    │
git push origin main
    │
GitHub Actions
    │
Checkout Repository
    │
Configure SSH
    │
Bootstrap EC2
    │
Sync Files (rsync)
    │
Generate .env Files
    │
Docker Compose Build
    │
Restart Containers
    │
Production Updated
```

### Deployment Steps

The GitHub Actions workflow performs the following tasks:

* Checks out the latest source code
* Configures SSH authentication
* Bootstraps the EC2 instance
* Synchronizes the project using `rsync`
* Generates backend and frontend `.env` files from GitHub Secrets
* Builds Docker images on the EC2 instance
* Starts or updates containers with Docker Compose
* Removes unused Docker images and builder cache

---

## 🔐 GitHub Secrets

| Secret     | Description                    |
| ---------- | ------------------------------ |
| `EC2_HOST` | EC2 public IP or hostname      |
| `EC2_USER` | EC2 SSH username               |
| `EC2_SSH`  | Private SSH key                |
| `APP_DIR`  | Application directory on EC2   |
| `APP_ENV`  | Backend environment variables  |
| `WEB_ENV`  | Frontend environment variables |

---

## 🛠 Useful Docker Commands

Start services

```bash
docker compose up -d
```

Build & restart

```bash
docker compose up -d --build
```

View running containers

```bash
docker compose ps
```

View logs

```bash
docker compose logs -f
```

Restart services

```bash
docker compose restart
```

Stop services

```bash
docker compose down
```

Remove containers and volumes

```bash
docker compose down -v
```

---

## 🌟 Production Highlights

* MERN Stack application
* Multi-container Docker architecture
* Separate development and production Docker configurations
* NGINX reverse proxy
* GitHub Actions CI/CD
* Automated AWS EC2 deployment
* Environment management with GitHub Secrets
* SSH-based deployment using `rsync`
* Docker image cleanup after deployment
* EC2 bootstrap automation script

---

## 🔮 Future Improvements

* User authentication
* JWT authorization
* Budget planning
* Charts and reports
* Email notifications
* HTTPS with SSL
* MongoDB Atlas
* Monitoring & logging

---

## 📄 License

This project was built for learning, portfolio demonstration, and showcasing production-ready full-stack and DevOps practices.

```
```
