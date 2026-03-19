/* Baza Projekty - для PostgreSQL */
/* Переделано с SQL Server синтаксиса на PostgreSQL */

---------- DELETE - УДАЛИТЬ ТАБЛИЦЫ ----------

DROP TABLE IF EXISTS Realizacje CASCADE;
DROP TABLE IF EXISTS Projekty CASCADE;
DROP TABLE IF EXISTS Pracownicy CASCADE;
DROP TABLE IF EXISTS Stanowiska CASCADE;

--------- CREATE - СОЗДАТЬ ТАБЛИЦЫ И СВЯЗИ --------

CREATE TABLE Stanowiska (
    nazwa      VARCHAR(20) PRIMARY KEY,
    placa_min  DECIMAL(10, 2),
    placa_max  DECIMAL(10, 2),
    CHECK (placa_min < placa_max)
);

CREATE TABLE Pracownicy (
    id           SERIAL PRIMARY KEY,
    nazwisko     VARCHAR(50) NOT NULL,
    szef         INT REFERENCES Pracownicy(id),
    placa        DECIMAL(10, 2),
    dod_funkc    DECIMAL(10, 2),
    stanowisko   VARCHAR(20) REFERENCES Stanowiska(nazwa),
    zatrudniony  DATE
);

CREATE TABLE Projekty (
    id               SERIAL PRIMARY KEY,
    nazwa            VARCHAR(50) NOT NULL UNIQUE,
    dataRozp         DATE NOT NULL,
    dataZakonczPlan  DATE NOT NULL,
    dataZakonczFakt  DATE NULL,
    kierownik        INT REFERENCES Pracownicy(id),
    stawka           DECIMAL(10, 2)
);

CREATE TABLE Realizacje (
    idProj  INT REFERENCES Projekty(id),
    idPrac  INT REFERENCES Pracownicy(id),
    godzin  REAL DEFAULT 8,
    PRIMARY KEY (idProj, idPrac)
);

---------- INSERT - ДОБАВИТЬ ДАННЫЕ --------

INSERT INTO Stanowiska VALUES
('profesor',   4000, 6000),
('adiunkt',    3000, 4000),
('doktorant',  1900, 2300),
('sekretarka', 2500, 3500),
('techniczny', 2500, 3500),
('dziekan',    3700, 5800);

INSERT INTO Pracownicy (id, nazwisko, szef, placa, dod_funkc, stanowisko, zatrudniony) VALUES
(1,  'Wachowiak', NULL, 5500,  900,   'profesor', '1990-09-01'),
(2,  'Jankowski',    1, 3500, NULL,    'adiunkt', '2000-09-01'),
(3,  'Fiołkowska',   1, 3550, NULL,    'adiunkt', '1995-01-01'),
(4,  'Mielcarz',     1, 5000,  500,   'profesor', '1990-12-01'),
(5,  'Różycka',      4, 3900,  300,   'profesor', '2011-09-01'),
(6,  'Mikołajski',   4, 2100, NULL,  'doktorant', '2017-10-01'),
(7,  'Wójcicki',     5, 2350, NULL,  'doktorant', '2015-10-01'),
(8,  'Listkiewicz',  1, 3200, NULL, 'sekretarka', '1990-09-01'),
(9,  'Wróbel',       1, 2900,  400, 'techniczny', '2009-01-01'),
(10, 'Andrzejewicz', 5, 3900, NULL,    'adiunkt', '2012-01-01'),
(11, 'Jankowski',    5, 3200, NULL, 'techniczny', '2000-01-01');

INSERT INTO Projekty (id, nazwa, dataRozp, dataZakonczPlan, dataZakonczFakt, kierownik, stawka) VALUES
(10, 'e-learning',     '2017-01-01', '2018-05-31',         NULL, 5, 100),
(20, 'web service',    '2009-11-10', '2010-12-31', '2011-04-20', 4,  90),
(30, 'semantic web',   '2018-09-01', '2023-09-01',         NULL, 4,  85),
(40, 'neural network', '2011-01-01', '2012-06-30', '2012-06-30', 1, 120),
(50, 'analiza danych', '2019-04-01', '2021-06-30',         NULL, 10, 85);

INSERT INTO Realizacje VALUES
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

------------ SELECT - ПРОВЕРКА ДАННЫХ --------

SELECT * FROM Stanowiska;
SELECT * FROM Pracownicy;
SELECT * FROM Projekty;
SELECT * FROM Realizacje;

