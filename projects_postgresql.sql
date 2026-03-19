/* Projects Database - for PostgreSQL */
/* Converted from SQL Server syntax to PostgreSQL */

---------- DELETE - DROP TABLES ----------

DROP TABLE IF EXISTS Realizations CASCADE;
DROP TABLE IF EXISTS Projects CASCADE;
DROP TABLE IF EXISTS Employees CASCADE;
DROP TABLE IF EXISTS Positions CASCADE;

--------- CREATE - CREATE TABLES AND RELATIONSHIPS --------

CREATE TABLE Positions (
    name       VARCHAR(20) PRIMARY KEY,
    salary_min DECIMAL(10, 2),
    salary_max DECIMAL(10, 2),
    CHECK (salary_min < salary_max)
);

CREATE TABLE Employees (
    id              SERIAL PRIMARY KEY,
    last_name       VARCHAR(50) NOT NULL,
    boss            INT REFERENCES Employees(id),
    salary          DECIMAL(10, 2),
    bonus           DECIMAL(10, 2),
    position        VARCHAR(20) REFERENCES Positions(name),
    hire_date       DATE
);

CREATE TABLE Projects (
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(50) NOT NULL UNIQUE,
    start_date      DATE NOT NULL,
    planned_end     DATE NOT NULL,
    actual_end      DATE NULL,
    manager         INT REFERENCES Employees(id),
    hourly_rate     DECIMAL(10, 2)
);

CREATE TABLE Realizations (
    project_id  INT REFERENCES Projects(id),
    employee_id INT REFERENCES Employees(id),
    hours       REAL DEFAULT 8,
    PRIMARY KEY (project_id, employee_id)
);

---------- INSERT - ADD DATA --------

INSERT INTO Positions VALUES
('professor',   4000, 6000),
('associate',   3000, 4000),
('phd_student', 1900, 2300),
('secretary',   2500, 3500),
('technician',  2500, 3500),
('dean',        3700, 5800);

INSERT INTO Employees VALUES
(1,  'Wachowiak',    NULL, 5500,  900,   'professor',   '1990-09-01'),
(2,  'Jankowski',       1, 3500, NULL,    'associate',   '2000-09-01'),
(3,  'Fiołkowska',      1, 3550, NULL,    'associate',   '1995-01-01'),
(4,  'Mielcarz',        1, 5000,  500,   'professor',   '1990-12-01'),
(5,  'Różycka',         4, 3900,  300,   'professor',   '2011-09-01'),
(6,  'Mikołajski',      4, 2100, NULL,  'phd_student', '2017-10-01'),
(7,  'Wójcicki',        5, 2350, NULL,  'phd_student', '2015-10-01'),
(8,  'Listkiewicz',     1, 3200, NULL, 'secretary',    '1990-09-01'),
(9,  'Wróbel',          1, 2900,  400, 'technician',   '2009-01-01'),
(10, 'Andrzejewicz',    5, 3900, NULL,    'associate',   '2012-01-01'),
(11, 'Jankowski',       5, 3200, NULL, 'technician',   '2000-01-01');

INSERT INTO Projects (id, name, start_date, planned_end, actual_end, manager, hourly_rate) VALUES
(10, 'e-learning',     '2017-01-01', '2018-05-31',         NULL, 5, 100),
(20, 'web service',    '2009-11-10', '2010-12-31', '2011-04-20', 4,  90),
(30, 'semantic web',   '2018-09-01', '2023-09-01',         NULL, 4,  85),
(40, 'neural network', '2011-01-01', '2012-06-30', '2012-06-30', 1, 120),
(50, 'data analysis',  '2019-04-01', '2021-06-30',         NULL, 10, 85);

INSERT INTO Realizations VALUES
(10,  5, 8),
(10, 10, 6),
(10,  9, 2),
(20,  4, 8),
(20,  6, 8),
(20,  9, 2),
(30,  4, 8),
(30,  6, 6),
(30, 10, 6),
(30,  9, 2),
(40,  1, 8),
(40,  2, 4),
(40,  3, 4),
(40,  9, 2),
(50,  9, 2);

------------ SELECT - DATA VERIFICATION --------

SELECT * FROM Positions;
SELECT * FROM Employees;
SELECT * FROM Projects;
SELECT * FROM Realizations;

