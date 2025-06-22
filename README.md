# Shift Handover Web Application

## Overview
The Shift Handover Web Application is a full-stack application designed to facilitate the handover process between shifts in various industries. It includes features such as user authentication, email notifications, audit logging, and REST APIs, all deployable locally using Docker.

## Features
- **User Authentication**: Secure login and role-based access control.
- **Email Notifications**: Automatic email alerts for handover submissions and updates.
- **Audit Logging**: Track user actions and changes within the application.
- **REST APIs**: Comprehensive API endpoints for managing handovers and incidents.


## Technical Stack

The Shift Handover Web Application uses the following technologies:

- **Frontend:** React.js with Tailwind CSS (or Material UI)
- **Backend:** Node.js with Express.js (alternatively, Python Flask/FastAPI can be used)
- **Database:** MySQL
- **Authentication:** JWT (JSON Web Tokens), bcrypt for password hashing
- **Email Notifications:** SMTP or SendGrid
- **API Documentation:** OpenAPI/Swagger
- **Containerization:** Docker & Docker Compose
- **Environment Configuration:** `.env` files for secrets and credentials

This stack ensures a modern, scalable, and easily deployable full-stack web

## Project Structure
```
shift-handover-app
├── backend
│   ├── src
│   ├── package.json
│   ├── tsconfig.json
│   └── README.md
├── frontend
│   ├── src
│   ├── public
│   ├── package.json
│   ├── tsconfig.json
│   └── README.md
├── docker
│   ├── backend.Dockerfile
│   ├── frontend.Dockerfile
│   └── mysql
│       └── my.cnf
├── docker-compose.yml
├── .env.example
└── README.md
```

## Getting Started

### Prerequisites
- Docker
- Docker Compose
- Node.js (for local development)

### Setup
1. Clone the repository:
   ```
   git clone <repository-url>
   cd shift-handover-app
   ```

2. Create a `.env` file from the example:
   ```
   cp .env.example .env
   ```

3. Update the `.env` file with your database credentials and other necessary configurations.

### Running the Application
To run the application using Docker, execute the following command:
```
docker-compose up --build
```

This command will build the Docker images and start the backend, frontend, and MySQL services.

### Accessing the Application
- Frontend: Open your browser and navigate to `http://localhost:3000`
- Backend API: Access the API at `http://localhost:5000/api`

### Testing
Instructions for running tests will be provided in the respective backend and frontend README files.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

