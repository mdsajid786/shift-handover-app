-- MASTER TABLES

CREATE TABLE shift_details (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(32) NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL
);

CREATE TABLE engineer_details (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(64) NOT NULL,
  email VARCHAR(128) NOT NULL,
  contact_number VARCHAR(32),
  team VARCHAR(64),
  role ENUM('Engineer','Lead','Admin') NOT NULL,
  status ENUM('Active','Inactive') DEFAULT 'Active'
);

CREATE TABLE application_details (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(64) NOT NULL,
  description VARCHAR(255),
  owner_engineer_id INT,
  status ENUM('Active','Inactive') DEFAULT 'Active',
  FOREIGN KEY (owner_engineer_id) REFERENCES engineer_details(id)
);

CREATE TABLE escalation_matrix (
  id INT PRIMARY KEY AUTO_INCREMENT,
  application_id INT,
  tier INT,
  contact_engineer_id INT,
  notes VARCHAR(255),
  FOREIGN KEY (application_id) REFERENCES application_details(id),
  FOREIGN KEY (contact_engineer_id) REFERENCES engineer_details(id)
);

-- TRANSACTIONAL TABLES

CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(64) NOT NULL UNIQUE,
  email VARCHAR(128) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('Engineer','Lead','Admin') NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  status ENUM('Active','Inactive') DEFAULT 'Active'
);

CREATE TABLE handover_records (
  id INT PRIMARY KEY AUTO_INCREMENT,
  date DATE NOT NULL,
  current_shift_id INT,
  next_shift_id INT,
  submitted_by INT,
  submitted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (current_shift_id) REFERENCES shift_details(id),
  FOREIGN KEY (next_shift_id) REFERENCES shift_details(id),
  FOREIGN KEY (submitted_by) REFERENCES users(id)
);

CREATE TABLE incident_entries (
  id INT PRIMARY KEY AUTO_INCREMENT,
  handover_id INT,
  title VARCHAR(128) NOT NULL,
  description TEXT,
  status ENUM('Active','Closed') DEFAULT 'Active',
  priority VARCHAR(32),
  is_handover BOOLEAN DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  closed_at DATETIME,
  FOREIGN KEY (handover_id) REFERENCES handover_records(id)
);

CREATE TABLE keypoint_entries (
  id INT PRIMARY KEY AUTO_INCREMENT,
  handover_id INT,
  description TEXT,
  status ENUM('Open','Closed') DEFAULT 'Open',
  responsible_engineer_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  closed_at DATETIME,
  FOREIGN KEY (handover_id) REFERENCES handover_records(id),
  FOREIGN KEY (responsible_engineer_id) REFERENCES engineer_details(id)
);

CREATE TABLE change_tasks (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128) NOT NULL,
  description TEXT,
  owner_engineer_id INT,
  status VARCHAR(32),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  completed_at DATETIME,
  FOREIGN KEY (owner_engineer_id) REFERENCES engineer_details(id)
);

CREATE TABLE problem_tickets (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128) NOT NULL,
  description TEXT,
  status VARCHAR(32),
  owner_engineer_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  resolved_at DATETIME,
  FOREIGN KEY (owner_engineer_id) REFERENCES engineer_details(id)
);

CREATE TABLE shift_roster (
  id INT PRIMARY KEY AUTO_INCREMENT,
  shift_id INT,
  engineer_id INT,
  date DATE,
  FOREIGN KEY (shift_id) REFERENCES shift_details(id),
  FOREIGN KEY (engineer_id) REFERENCES engineer_details(id)
);

CREATE TABLE audit_logs (
  id INT PRIMARY KEY AUTO_INCREMENT,
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
  user_id INT,
  action_type VARCHAR(64),
  entity VARCHAR(64),
  entity_id INT,
  old_value TEXT,
  new_value TEXT,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- SAMPLE MASTER DATA

INSERT INTO shift_details (name, start_time, end_time) VALUES
  ('Morning', '06:00:00', '14:00:00'),
  ('Evening', '14:00:00', '22:00:00'),
  ('Night', '22:00:00', '06:00:00');

INSERT INTO engineer_details (name, email, team, role, status) VALUES
  ('Alice Smith', 'alice@company.com', 'Support', 'Engineer', 'Active'),
  ('Bob Jones', 'bob@company.com', 'Support', 'Lead', 'Active'),
  ('Carol White', 'carol@company.com', 'DevOps', 'Engineer', 'Active');

INSERT INTO application_details (name, description, owner_engineer_id, status) VALUES
  ('CRM System', 'Customer Mgmt App', 2, 'Active'),
  ('Billing App', 'Billing Platform', 3, 'Active');

INSERT INTO escalation_matrix (application_id, tier, contact_engineer_id, notes) VALUES
  (1, 1, 2, 'Primary Contact'),
  (1, 2, 1,