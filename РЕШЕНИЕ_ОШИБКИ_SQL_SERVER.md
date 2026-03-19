# 🔴 Ошибка подключения к SQL Server - РЕШЕНИЕ

## ❌ Ошибка:
```
The TCP/IP connection to the host localhost, port 1433 has failed.
Connection refused: getsockopt
```

---

## 🔍 Что означает эта ошибка?

**Microsoft SQL Server НЕ установлен или НЕ запущен на вашем компьютере!**

- Порт **1433** - это порт SQL Server
- Ошибка **Connection refused** = никто не слушает на этом порту

---

## ✅ РЕШЕНИЕ #1: Используй PostgreSQL (уже установлен!)

**Вы уже используете PostgreSQL в DataGrip - он работает!**

### Я переделал ваш скрипт для PostgreSQL:

**Файл:** `projekty_postgresql.sql` (в папке start)

### Какие изменения:

| SQL Server | PostgreSQL | Причина |
|-----------|-----------|---------|
| `MONEY` | `DECIMAL(10, 2)` | PostgreSQL не имеет MONEY типа |
| `DATETIME` | `DATE` | В PostgreSQL разные типы |
| `IDENTITY(10,10)` | `SERIAL` | PostgreSQL использует SERIAL для автонумера |
| `GO` | `;` (точка с запятой) | GO это SQL Server команда |
| `USE master;` | Не нужно | PostgreSQL автоматически переключает БД |
| Даты: '01-09-1990' | '1990-09-01' | PostgreSQL требует YYYY-MM-DD |

---

## 🚀 Как использовать исправленный скрипт:

### Шаг 1: Откройте DataGrip

### Шаг 2: Откройте файл `projekty_postgresql.sql`

### Шаг 3: Выполните весь скрипт
- Нажмите **Ctrl + Shift + Enter** (выполнить весь файл)
- Или **Ctrl + Enter** для каждой команды

### Шаг 4: Проверьте результаты
Внизу в консоли должны появиться все данные из таблиц!

---

## 📊 Что создаст этот скрипт:

**Таблица Stanowiska (Должности):**
```
nazwa      | placa_min | placa_max
-----------|-----------|----------
profesor   |      4000 |      6000
adiunkt    |      3000 |      4000
doktorant  |      1900 |      2300
sekretarka |      2500 |      3500
techniczny |      2500 |      3500
dziekan    |      3700 |      5800
```

**Таблица Pracownicy (Сотрудники):**
```
id | nazwisko    | placa | stanowisko | zatrudniony
---|-------------|-------|-----------|------------
1  | Wachowiak   | 5500  | profesor  | 1990-09-01
2  | Jankowski   | 3500  | adiunkt   | 2000-09-01
...
```

**Таблица Projekty (Проекты):**
```
id | nazwa          | dataRozp   | kierownik | stawka
---|----------------|------------|-----------|-------
10 | e-learning     | 2017-01-01 | 5         | 100
20 | web service    | 2009-11-10 | 4         | 90
...
```

**Таблица Realizacje (Реализации):**
```
idProj | idPrac | godzin
-------|--------|-------
10     | 5      | 8
10     | 10     | 6
...
```

---

## ❓ Решение #2: Если вы ДОЛЖНЫ использовать SQL Server

Если нужен именно SQL Server:

1. **Установите SQL Server Express** (бесплатная версия):
   - Скачайте: https://www.microsoft.com/en-us/sql-server/sql-server-downloads
   - Выберите SQL Server Express Edition
   - Установите

2. **Запустите SQL Server** после установки

3. **В DataGrip создайте новое подключение к SQL Server:**
   - **Database** → **+** → **Data Source** → **SQL Server**
   - **Host:** localhost
   - **Port:** 1433
   - **User:** sa (системный администратор)
   - **Password:** [пароль что вы установили]

4. **Тогда сможете использовать исходный скрипт**

---

## 💡 Мой совет:

**Используйте PostgreSQL!** 🐘

- Уже установлен ✅
- Работает в DataGrip ✅
- Достаточно мощный ✅
- Я уже переделал скрипт ✅

Файл готов: **projekty_postgresql.sql**

---

## 🎯 ПРЯМО СЕЙЧАС:

1. Откройте **projekty_postgresql.sql**
2. Нажмите **Ctrl + Shift + Enter**
3. Готово! ✅

Если будут ошибки - покажите мне, я помогу исправить!

---

**Удачи! 🚀**

