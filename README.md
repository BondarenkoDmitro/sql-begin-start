<<<<<<< HEAD
# 📚 How to Create a Table in SQL (PostgreSQL)

Complete step-by-step guide for beginners with examples.

---

## 📋 Table of Contents

1. [Quick Start](#quick-start)
2. [What is a Table?](#what-is-a-table)
3. [Creating the "Students" Table](#creating-the-students-table)
4. [Step-by-Step Explanation](#step-by-step-explanation)
5. [Adding Data](#adding-data)
6. [Retrieving Data](#retrieving-data)
7. [Other Table Examples](#other-table-examples)
8. [Quick Reference Guide](#quick-reference-guide)

---

## 🚀 Quick Start

### Step 1: Open DataGrip
1. Launch DataGrip
2. Press **Ctrl + Shift + D** (opens Database Panel)

### Step 2: Connect to PostgreSQL
1. Click the green **+** in the left panel
2. Select **Data Source** → **PostgreSQL**
3. Fill in the parameters:
   - **Host:** localhost
   - **Port:** 5432
   - **User:** postgres
   - **Password:** [your password]
4. Click **Test Connection** ✅
5. Click **OK** (bottom right corner!)

### Step 3: Create Your First Table
1. Right Click on **"public"** → **New** → **SQL Script**
2. Copy the code below
3. Press **Ctrl + Enter** to execute

```sql
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100) UNIQUE
);
```

**Done!** Table created! ✅

---

## 📖 What is a Table?

**A table** is a structure for storing data in rows and columns.

Like an Excel file, but with superpowers!

### Example "Students" Table:

| id | name     | age | email |
|----|----------|-----|-------|
| 1  | John     | 20  | john@mail.com |
| 2  | Mary     | 19  | mary@mail.com |
| 3  | Peter    | 21  | peter@mail.com |

**Columns (fields):**
- `id` - student number (automatic)
- `name` - text (string) up to 100 characters
- `age` - whole number
- `email` - text, unique (cannot repeat)

**Rows (records):**
- First row: John, 20 years old, john@mail.com
- Second row: Mary, 19 years old, mary@mail.com
- And so on...

---

## 🔨 Creating the "Students" Table

### Complete Code:

```sql
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100) UNIQUE
);
```

### What Happens?

1. **CREATE TABLE students** - create a table named "students"
2. Then describe each column:

| Command | Description | Example |
|---------|----------|--------|
| `id` | Column name | |
| `SERIAL` | Type: automatic number | 1, 2, 3... |
| `PRIMARY KEY` | Main key (unique ID) | Each ID is unique! |
| `name` | Column name | |
| `VARCHAR(100)` | Type: text up to 100 characters | "John", "Mary" |
| `NOT NULL` | Required field (cannot be empty) | Name must be provided! |
| `age` | Column name | |
| `INT` | Type: whole number | 20, 25, 30 |
| `email` | Column name | |
| `VARCHAR(100)` | Type: text up to 100 characters | "john@mail.com" |
| `UNIQUE` | Value cannot repeat | Each email is unique! |

---

## 📝 Step-by-Step Explanation

### 1. CREATE TABLE Command

```sql
CREATE TABLE students (
    -- columns are described here
);
```

**CREATE TABLE** - SQL command to create a new table
**students** - name of our table
**(...)** - columns are described inside parentheses

### 2. ID Column - Automatic Number

```sql
id SERIAL PRIMARY KEY,
```

- **id** - name (you can name it anything)
- **SERIAL** - type, means "automatic number"
  - When adding first student → id = 1
  - When adding second → id = 2
  - And so on... (automatically!)
- **PRIMARY KEY** - this is the main key, uniquely identifies each record
  - Each row has a different id
  - Cannot add two rows with same id

### 3. NAME Column - Text, Required Field

```sql
name VARCHAR(100) NOT NULL,
```

- **name** - column name
- **VARCHAR(100)** - data type:
  - VARCHAR = variable text
  - (100) = maximum 100 characters
  - Example: "John" (4 characters), "Alexander Smith" (15 characters)
- **NOT NULL** - this field must be filled!
  - Cannot add student without name
  - If you try, you'll get an error

### 4. AGE Column - Number

```sql
age INT,
```

- **age** - column name
- **INT** - data type: whole number (integer)
  - Example: 20, 25, 30 (without decimals)
  - You can store: 1, 100, 1000, -5, 0
- **No restrictions** - this field is optional (can be empty)
  - If you don't specify age - that's fine

### 5. EMAIL Column - Text, Unique

```sql
email VARCHAR(100) UNIQUE
```

- **email** - column name
- **VARCHAR(100)** - text up to 100 characters
  - Example: "john@mail.com" (14 characters)
- **UNIQUE** - unique value!
  - Two students cannot have same email
  - If you try to add john@mail.com twice - error!
- **No restrictions** - optional field (can be empty)

---

## ➕ Adding Data

After creating a table, you need to add data!

### Add One Student:

```sql
INSERT INTO students (name, age, email)
VALUES ('John', 20, 'john@mail.com');
```

Result:
| id | name | age | email |
|----|------|-----|-------|
| 1  | John | 20  | john@mail.com |

**Note:** id = 1 was added automatically!

### Add Multiple Students at Once:

```sql
INSERT INTO students (name, age, email)
VALUES 
    ('John', 20, 'john@mail.com'),
    ('Mary', 19, 'mary@mail.com'),
    ('Peter', 21, 'peter@mail.com'),
    ('Anna', 18, 'anna@mail.com');
```

Result:
| id | name  | age | email |
|----|-------|-----|-------|
| 1  | John  | 20  | john@mail.com |
| 2  | Mary  | 19  | mary@mail.com |
| 3  | Peter | 21  | peter@mail.com |
| 4  | Anna  | 18  | anna@mail.com |

### Add Student Without Email:

```sql
INSERT INTO students (name, age)
VALUES ('Oleg', 22);
```

Result:
| id | name | age | email |
|----|------|-----|-------|
| 5  | Oleg | 22  | NULL  |

**Email is empty (NULL) - this is allowed!**

### ❌ ERROR - Add Student WITHOUT Name:

```sql
INSERT INTO students (age, email)
VALUES (25, 'test@mail.com');
-- ❌ ERROR! NOT NULL - name is required!
```

### ❌ ERROR - Duplicate Email:

```sql
INSERT INTO students (name, age, email)
VALUES ('David', 23, 'john@mail.com');
-- ❌ ERROR! john@mail.com already exists! (UNIQUE)
```

---

## 🔍 Retrieving Data

### Get All Students:

```sql
SELECT * FROM students;
```

Result:
```
id | name  | age | email
---+-------+-----+---------------
1  | John  | 20  | john@mail.com
2  | Mary  | 19  | mary@mail.com
3  | Peter | 21  | peter@mail.com
4  | Anna  | 18  | anna@mail.com
5  | Oleg  | 22  | (empty)
```

### Get Specific Columns:

```sql
SELECT name, age FROM students;
```

Result:
```
name  | age
------+-----
John  | 20
Mary  | 19
Peter | 21
Anna  | 18
Oleg  | 22
```

### Get Students Older Than 19:

```sql
SELECT * FROM students WHERE age > 19;
```

Result:
```
id | name  | age | email
---+-------+-----+---------------
1  | John  | 20  | john@mail.com
3  | Peter | 21  | peter@mail.com
5  | Oleg  | 22  | (empty)
```

### Get Number of Students:

```sql
SELECT COUNT(*) FROM students;
```

Result: **5**

### Get Average Age:

```sql
SELECT AVG(age) FROM students;
```

Result: **20** (average: (20+19+21+18+22)/5 = 20)

---

## 🎯 Other Table Examples

### "Products" Table for a Store:

```sql
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT DEFAULT 0,
    description TEXT
);
```

**New data types:**
- **DECIMAL(10, 2)** - number with 2 decimal places (9999999.99)
- **TEXT** - long text (unlimited)
- **DEFAULT 0** - default quantity = 0

### "Orders" Table:

```sql
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_number VARCHAR(50) NOT NULL UNIQUE,
    date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'new',
    comment TEXT
);
```

**New data types:**
- **DATE** - date (2024-03-19)

### "Users" Table:

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    login VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    birth_date DATE,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**New data types:**
- **BOOLEAN** - logical type (TRUE / FALSE)
- **TIMESTAMP** - date and time (2024-03-19 14:30:45)
- **CURRENT_TIMESTAMP** - current date and time (automatic)

---

## 📋 КРАТКИЙ ГАЙД

### Основная структура CREATE TABLE:

```sql
CREATE TABLE название_таблицы (
    столбец1 ТИП ОГРАНИЧЕНИЯ,
    столбец2 ТИП ОГРАНИЧЕНИЯ,
    столбец3 ТИП ОГРАНИЧЕНИЯ
);
```

### Типы данных:

| Тип | Описание | Пример |
|-----|----------|--------|
| INT | Целое число | 20, 100, -5 |
| DECIMAL(10,2) | Число с 2 знаками | 99.99, 1000.50 |
| VARCHAR(n) | Текст до n символов | "Иван" (макс 100) |
| TEXT | Длинный текст | Может быть очень длинный |
| DATE | Дата | 2024-03-19 |
| TIMESTAMP | Дата и время | 2024-03-19 14:30:45 |
| BOOLEAN | Да/Нет | TRUE, FALSE |
| SERIAL | Автоматический номер | 1, 2, 3... |

### Ограничения:

| Ограничение | Описание | Пример |
|---------|---------|--------|
| PRIMARY KEY | Главный ключ (уникальный) | id SERIAL PRIMARY KEY |
| NOT NULL | Обязательное поле | имя VARCHAR(100) NOT NULL |
| UNIQUE | Уникальное значение | email VARCHAR(100) UNIQUE |
| DEFAULT значение | Значение по умолчанию | количество INT DEFAULT 0 |

### Основные операции:

```sql
-- СОЗДАТЬ таблицу
CREATE TABLE студенты (
    id SERIAL PRIMARY KEY,
    имя VARCHAR(100) NOT NULL,
    возраст INT
);

-- ДОБАВИТЬ данные
INSERT INTO студенты (имя, возраст)
VALUES ('Иван', 20);

-- ПОЛУЧИТЬ данные
SELECT * FROM студенты;

-- ПОЛУЧИТЬ с условием
SELECT * FROM студенты WHERE возраст > 19;

-- ИЗМЕНИТЬ данные
UPDATE студенты 
SET возраст = 21 
WHERE имя = 'Иван';

-- УДАЛИТЬ данные
DELETE FROM студенты 
WHERE имя = 'Иван';

-- УДАЛИТЬ таблицу
DROP TABLE студенты;
```

### Горячие клавиши DataGrip:

| Клавиша | Действие |
|---------|----------|
| **Ctrl + Enter** | Выполнить текущую строку/блок |
| **Ctrl + Shift + Enter** | Выполнить весь файл |
| **Ctrl + /** | Закомментировать строку |
| **Ctrl + Shift + D** | Открыть Database Panel |
| **Ctrl + Space** | Автодополнение |

### Частые ошибки:

```sql
-- ❌ ОШИБКА: Пропущена запятая
CREATE TABLE студенты (
    id SERIAL PRIMARY KEY
    имя VARCHAR(100)  -- нет запятой выше!
);

-- ✅ ПРАВИЛЬНО:
CREATE TABLE студенты (
    id SERIAL PRIMARY KEY,  -- с запятой!
    имя VARCHAR(100)
);

-- ❌ ОШИБКА: Русское имя таблицы в кавычках
CREATE TABLE "Студенты" (...)

-- ✅ ПРАВИЛЬНО (без кавычек или с правильными):
CREATE TABLE студенты (...)
CREATE TABLE "студенты" (...)

-- ❌ ОШИБКА: Забыл NOT NULL, а потом добавляешь NULL
UPDATE студенты SET имя = NULL WHERE id = 1;
-- Если имя = NOT NULL, то ошибка!

-- ✅ ПРАВИЛЬНО:
INSERT INTO студенты (имя) VALUES ('Иван');  -- имя всегда!
```

### Проверка таблицы:

```sql
-- Посмотреть структуру таблицы
\d студенты;

-- Посмотреть все таблицы
\dt;

-- Посмотреть количество записей
SELECT COUNT(*) FROM студенты;

-- Посмотреть первые 5 записей
SELECT * FROM студенты LIMIT 5;
```

---

**Удачи в создании таблиц! 🚀**




=======
# sql-begin-start
>>>>>>> 91471b4fb7c1f5fbb439baff3cfa7298e2fb5f50
