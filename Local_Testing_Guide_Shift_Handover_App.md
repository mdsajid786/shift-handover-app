# Local Testing Guide – Shift Handover Web Application

Follow the steps below to test the Shift Handover Web Application in your local development environment.

---

## 1. Clone the Repository

```bash
git clone https://github.com/your-org/shift-handover-app.git
cd shift-handover-app
```

---

## 2. Set Up Environment Variables

Copy the example `.env` file and update it with your local configurations:

```bash
cp .env.example .env
```

Edit the `.env` file and provide the following details:

- MySQL configuration (host, database name, user, password)
- SMTP server credentials (for email notifications)
- JWT secret and expiration settings

---

## 3. Start the Application with Docker

Run the following command to build and start all services:

```bash
docker-compose up --build
```

This will:

- Build and start the MySQL database (with schema and seed data)
- Launch the backend API server
- Launch the frontend React application

---

## 4. Access the Application

- **Frontend UI:** [http://localhost:3000](http://localhost:3000)  
- **Backend API:** [http://localhost:5000/api](http://localhost:5000/api)

---

## 5. Test the API

Use **Postman**, **Insomnia**, or a similar REST client to test the API.

### Example Endpoints

- `POST /api/auth/register` – Register a new user  
- `POST /api/auth/login` – Login and receive JWT token  
- `GET /api/shifts` – Fetch available shifts  
- `POST /api/handover` – Submit handover entry

Make sure to include the JWT token in the Authorization header when accessing protected routes.

---

## 6. Test Handover & Email Flow

- Log in as an engineer using the frontend.
- Fill out and submit the handover form.
- Check the email inbox of the next shift engineer(s) to verify notification delivery.
- Ensure SMTP settings in `.env` are valid and functional.

---

## 7. Check the Database

Connect to the running MySQL instance using any of the following:

- **DBeaver**
- **MySQL Workbench**
- Docker CLI:

```bash
docker exec -it <mysql-container-name> mysql -u root -p
```

Inspect tables like:

- `handover_records`
- `incident_entries`
- `keypoint_entries`

---

## 8. Stop the Application

To shut down all containers:

```bash
docker-compose down
```

---

## 🔁 Tip: Rebuild on Code Changes

If you make changes to either the backend or frontend code:

```bash
docker-compose up --build
```

This ensures the containers are rebuilt with your latest changes.