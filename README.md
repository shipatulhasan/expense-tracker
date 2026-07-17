# Expense Tracker

A full-stack **Expense Tracker** built with the **MERN Stack**, containerized using **Docker**, and automatically deployed to an **AWS EC2** instance using **GitHub Actions CI/CD**.

This project was built to learn Docker, Docker Compose, AWS deployment, and CI/CD automation while developing a production-like full-stack application.

---

## 🛠️ Tech Stack

| Category | Technologies |
|----------|--------------|
| **Frontend** | React.js, Vite, NGINX |
| **Backend** | Node.js, Express.js |
| **Database** | MongoDB |
| **DevOps** | Docker, Docker Compose, GitHub Actions, AWS EC2, SSH, rsync |
---

# Features

- Add, edit and delete expenses
- Search by title
- Filter by category
- Filter by date
- Expense summary dashboard
- Category-wise analytics
- CSV export
- Responsive UI
- Dockerized development & production setup
- Automated deployment to AWS EC2

---

# Architecture

```text
                    GitHub Repository
                           │
                    Push to main
                           │
                  GitHub Actions CI/CD
                           │
                     SSH + rsync
                           │
                        AWS EC2
                           │
                   Docker Compose
                           │
        ┌────────────┬─────────────┬─────────────┐
        │            │             │
    Frontend      Backend      MongoDB
     (NGINX)      Express
```

---

# Project Structure

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
├── .github
│   └── workflows
│       └── deploy.yml
│
├── docker-compose.yml
└── docker-compose-dev.yml
```

---

# Local Development

Start the development environment with hot reload.

```bash
docker compose -f docker-compose-dev.yml up
```

Run the production setup locally.

```bash
docker compose up -d --build
```

Open the application:

```
http://localhost
```

---

# Docker Services

| Service | Description |
|----------|-------------|
| frontend | React application served by NGINX |
| backend | Express REST API |
| mongo | MongoDB database |

---

# CI/CD Workflow

Every push to the **main** branch automatically deploys the latest version to the AWS EC2 server.

```text
Developer
    │
git push
    │
GitHub Actions
    │
Checkout Repository
    │
Configure SSH
    │
Bootstrap EC2
    │
Sync Project (rsync)
    │
Create .env Files
    │
Docker Compose Build
    │
Restart Containers
    │
Deployment Complete
```

---

# What I Learned

### Docker & Docker Compose

- Building multi-container applications
- Managing development and production environments
- Networking, volumes, and container lifecycle
- Running React, Node.js, and MongoDB together

### AWS & GitHub Actions

- Deploying Docker applications to AWS EC2
- Automating deployments with GitHub Actions
- Managing environment variables using GitHub Secrets
- SSH-based deployment with `rsync` and Docker Compose

---

# Troubleshooting

During development, I encountered and resolved several real-world issues:

- Vite Hot Reload not working inside Docker
- Docker Compose networking and volume configuration
- AWS EC2 server setup and permissions
- Environment variable management
- Docker image cleanup and rebuilds

---

# Useful Commands

Start containers

```bash
docker compose up -d
```

Build containers

```bash
docker compose up -d --build
```

View logs

```bash
docker compose logs -f
```

List running containers

```bash
docker compose ps
```

Stop containers

```bash
docker compose down
```

Remove containers and volumes

```bash
docker compose down -v
```

---

# Future Improvements

- User Authentication
- Budget Management
- Monthly Reports
- Charts & Analytics
- HTTPS with SSL
- MongoDB Atlas
- Monitoring & Logging

---

# License

This project is intended for learning, portfolio demonstration, and showcasing modern full-stack development with Docker and CI/CD.
