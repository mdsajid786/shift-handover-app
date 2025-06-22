# Shift Handover Web Application – MySQL Database Schema

## Master Tables

These hold reference data used throughout the app.

### `shift_details`

| Column     | Description                       |
|------------|-----------------------------------|
| id (PK)    | Primary Key                       |
| name       | e.g., "Morning", "Evening", "Night" |
| start_time | Shift start time                  |
| end_time   | Shift end time                    |

### `engineer_details`

| Column         | Description                       |
|----------------|-----------------------------------|
| id (PK)        | Primary Key                       |
| name           | Engineer's full name              |
| email          | Contact email                     |
| contact_number | Phone number                      |
| team           | Team name (e.g., Support, DevOps) |
| role           | Engineer/Lead/Admin               |
| status         | Active/Inactive                   |

### `application_details`

| Column             | Description                             |
|--------------------|-----------------------------------------|
| id (PK)            | Primary Key                             |
| name               | Application name                        |
| description        | Short description                       |
| owner_engineer_id  | FK to `engineer_details`                |
| status             | Active/Inactive                         |

### `escalation_matrix`

| Column             | Description                             |
|--------------------|-----------------------------------------|
| id (PK)            | Primary Key                             |
| application_id     | FK to `application_details`             |
| tier               | Escalation tier (1, 2, 3...)            |
| contact_engineer_id| FK to `engineer_details`                |
| notes              | Optional notes                          |

---

## Transactional Tables

These store dynamic, user-generated data.

### `handover_records`

| Column         | Description                             |
|----------------|-----------------------------------------|
| id (PK)        | Primary Key                             |
| date           | Date of handover                        |
| current_shift_id | FK to `shift_details`                 |
| next_shift_id  | FK to `shift_details`                   |
| submitted_by   | FK to `users`                           |
| submitted_at   | Timestamp of submission                 |

### `incident_entries`

| Column         | Description                             |
|----------------|-----------------------------------------|
| id (PK)        | Primary Key                             |
| handover_id    | FK to `handover_records`                |
| title          | Incident title                          |
| description    | Details of the incident                 |
| status         | Active/Closed                           |
| priority       | Priority level                          |
| is_handover    | Boolean (true if part of handover)      |
| created_at     | Incident creation time                  |
| closed_at      | Incident closure time                   |

### `keypoint_entries`

| Column                  | Description                      |
|-------------------------|----------------------------------|
| id (PK)                 | Primary Key                      |
| handover_id             | FK to `handover_records`         |
| description             | Key point description            |
| status                  | Open/Closed                      |
| responsible_engineer_id | FK to `engineer_details`         |
| created_at              | Creation timestamp               |
| closed_at               | Closure timestamp                |

### `change_tasks`

| Column             | Description                     |
|--------------------|---------------------------------|
| id (PK)            | Primary Key                     |
| title              | Task title                      |
| description        | Task description                |
| owner_engineer_id  | FK to `engineer_details`        |
| status             | Task status                     |
| created_at         | Created timestamp               |
| completed_at       | Completion timestamp            |

### `problem_tickets`

| Column             | Description                     |
|--------------------|---------------------------------|
| id (PK)            | Primary Key                     |
| title              | Problem title                   |
| description        | Problem details                 |
| status             | Open/Resolved                   |
| owner_engineer_id  | FK to `engineer_details`        |
| created_at         | Created timestamp               |
| resolved_at        | Resolution timestamp            |

### `shift_roster`

| Column      | Description                    |
|-------------|--------------------------------|
| id (PK)     | Primary Key                    |
| shift_id    | FK to `shift_details`          |
| engineer_id | FK to `engineer_details`       |
| date        | Date of the shift assignment   |

### `users`

| Column         | Description                       |
|----------------|-----------------------------------|
| id (PK)        | Primary Key                       |
| username       | Login username                    |
| email          | Email address                     |
| password_hash  | Hashed password                   |
| role           | Engineer/Lead/Admin               |
| created_at     | Created timestamp                 |
| status         | Active/Inactive                   |

### `audit_logs`

| Column      | Description                        |
|-------------|------------------------------------|
| id (PK)     | Primary Key                        |
| timestamp   | Action timestamp                   |
| user_id     | FK to `users`                      |
| action_type | Type of action performed           |
| entity      | Affected table/entity              |
| entity_id   | ID of affected record              |
| old_value   | Previous state (JSON/text)         |
| new_value   | New state (JSON/text)              |

---

## Sample Master Data

### `shift_details`

| id | name    | start_time | end_time |
|----|---------|------------|----------|
| 1  | Morning | 06:00:00   | 14:00:00 |
| 2  | Evening | 14:00:00   | 22:00:00 |
| 3  | Night   | 22:00:00   | 06:00:00 |

### `engineer_details`

| id | name         | email              | team    | role     | status  |
|----|--------------|--------------------|---------|----------|---------|
| 1  | Alice Smith  | alice@company.com  | Support | Engineer | Active  |
| 2  | Bob Jones    | bob@company.com    | Support | Lead     | Active  |
| 3  | Carol White  | carol@company.com  | DevOps  | Engineer | Active  |

### `application_details`

| id | name         | description         | owner_engineer_id | status  |
|----|--------------|---------------------|-------------------|---------|
| 1  | CRM System   | Customer Mgmt App   | 2                 | Active  |
| 2  | Billing App  | Billing Platform    | 3                 | Active  |

### `escalation_matrix`

| id | application_id | tier | contact_engineer_id | notes           |
|----|----------------|------|---------------------|------------------|
| 1  | 1              | 1    | 2                   | Primary Contact |
| 2  | 1              | 2    | 1                   | Backup Contact  |
