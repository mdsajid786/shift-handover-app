# Shift Handover Web Application - Backend

## Overview
This backend application is part of the Shift Handover Web Application, designed to facilitate the management of shift handovers in a workplace. It includes features such as user authentication, email notifications, audit logging, and REST APIs for seamless interaction with the frontend.

## Features
- **User Authentication**: Secure login and role-based access control.
- **Email Notifications**: Automatic email alerts for shift handover submissions.
- **Audit Logging**: Track user actions for compliance and monitoring.
- **REST APIs**: Endpoints for managing handover submissions and retrieving incident data.

## Technologies Used
- **Node.js**: JavaScript runtime for building the backend.
- **Express**: Web framework for building RESTful APIs.
- **MySQL**: Relational database for storing user and handover data.
- **TypeScript**: Superset of JavaScript for type safety and better tooling.
- **Docker**: Containerization for easy deployment and scalability.

## Setup Instructions
1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd shift-handover-app/backend
   ```

2. **Install Dependencies**
   ```bash
   npm install
   ```

3. **Configure Environment Variables**
   Copy the `.env.example` file to `.env` and update the values as needed, especially for database credentials and JWT secrets.

4. **Run the Application**
   You can run the application locally using:
   ```bash
   npm start
   ```

5. **Docker Deployment**
   To build and run the application using Docker, navigate to the root of the project and run:
   ```bash
   docker-compose up --build
   ```

## API Endpoints
- **POST /api/handover**: Submit a new shift handover.
- **GET /api/handover**: Retrieve all handover records.
- **GET /api/incidents**: Fetch incident data.

## Contribution
Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.