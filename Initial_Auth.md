To create initial authentication and log in to the UI after the application is running, follow these steps:

---

### 1. **Register the First User (Admin or Engineer)**

- Open the frontend UI at [http://localhost:3000](http://localhost:3000).
- Click on the **Register** or **Sign Up** link (if available).
- Fill in the registration form with your details (username, email, password, role).
    - For the first user, choose the **Admin** or **Lead** role if you want full access.

**OR**

If the frontend does not have a registration page, use Postman or curl to register:

```http
POST http://localhost:5000/api/auth/register
Content-Type: application/json

{
  "username": "adminuser",
  "email": "admin@example.com",
  "password": "YourStrongPassword",
  "role": "Admin"
}
```

---

### 2. **Login via UI**

- Go to the login page at [http://localhost:3000/login](http://localhost:3000/login).
- Enter your registered email and password.
- Upon successful login, you’ll be redirected to the dashboard.

---

### 3. **(Optional) Seed an Initial User via SQL**

You can also insert an initial user directly into the database (password must be hashed with bcrypt):

```sql
INSERT INTO users (username, email, password_hash, role, status)
VALUES ('adminuser', 'admin@example.com', '<bcrypt_hash>', 'Admin', 'Active');
```
> Replace `<bcrypt_hash>` with a bcrypt-hashed password.

---

**Summary:**  
Register your first user via the UI or API, then log in using those credentials. This creates your initial authentication for the application.