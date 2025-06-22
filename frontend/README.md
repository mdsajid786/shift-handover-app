# Shift Handover Application

## Overview
The Shift Handover Application is a full-stack web application designed to facilitate the handover process between shifts in various industries. It includes features such as user authentication, email notifications, audit logging, and REST APIs, all deployable locally using Docker.

## Features
- User Authentication: Secure login and role-based access control.
- Shift Handover Management: Submit and retrieve shift handover records.
- Email Notifications: Automatic email alerts for handover submissions.
- Audit Logging: Track user actions for compliance and monitoring.
- REST APIs: Interact with the backend services for data management.

## Technologies Used
- **Frontend**: React, TypeScript
- **Backend**: Node.js, Express, TypeScript
- **Database**: MySQL
- **Containerization**: Docker

## Getting Started

### Prerequisites
- Docker and Docker Compose installed on your machine.
- Node.js and npm (for development purposes).

### Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd shift-handover-app
   ```

2. **Configure Environment Variables**
   Copy the `.env.example` file to `.env` and update the values as needed.

3. **Build and Run the Application**
   Use Docker Compose to build and run the application:
   ```bash
   docker-compose up --build
   ```

4. **Access the Application**
   - Frontend: Open your browser and navigate to `http://localhost:3000`
   - Backend: API endpoints are available at `http://localhost:5000/api`

## Directory Structure
```
shift-handover-app
├── backend          # Backend application
├── frontend         # Frontend application
├── docker           # Docker configuration files
├── docker-compose.yml
├── .env.example     # Example environment variables
└── README.md        # Project documentation
```

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.