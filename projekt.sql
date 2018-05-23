CREATE DATABASE Projekt_11210
GO

USE Projekt_11210
GO

CREATE TABLE Marki (
	id_marki INT IDENTITY(1,1) PRIMARY KEY ,
	nazwa VARCHAR(20),
	kraj_pochodzenia VARCHAR(20),
	data_zalozenia DATE
)
GO

CREATE TABLE Modele (
	id_modelu INT IDENTITY(1,1) PRIMARY KEY,
	id_marki INT,
	nazwa VARCHAR(20),
	pojemnosc_silnika DECIMAL(2,1),
	FOREIGN KEY(id_marki) REFERENCES Marki (id_marki) ON UPDATE SET NULL ON DELETE SET NULL
)
GO

CREATE TABLE Ceny (
	id_ceny INT IDENTITY(1,1) PRIMARY KEY,
	id_modelu INT,
	data_od DATE,
	data_do DATE,
	cena DECIMAL(9,2),
	FOREIGN KEY(id_modelu) REFERENCES Modele (id_modelu) ON UPDATE SET NULL ON DELETE SET NULL
)
GO

CREATE TABLE Pracownicy (
	id_pracownika INT IDENTITY(1,1) PRIMARY KEY,
	imie VARCHAR(20),
	nazwisko VARCHAR(20),
	data_przyjecia VARCHAR(20),
	pesel CHAR(11) UNIQUE
)
GO

CREATE TABLE Klienci (
	id_klienta INT IDENTITY(1,1) PRIMARY KEY,
	imie VARCHAR(20),
	nazwisko VARCHAR(20),
	data_urodzenia DATE,
	nr_dowodu CHAR(9) UNIQUE
)
GO

CREATE TABLE Zamowienia (
	id_zamowienia INT IDENTITY(1,1) PRIMARY KEY,
	id_klienta INT,
	id_pracownika INT,
	id_modelu INT,
	cena_sprzedazy DECIMAL(9,2) CHECK (cena_sprzedazy > 0),
	data_zamowienia DATE,
	data_odbioru DATE,
	zrealizowane BIT,
	oplacone BIT,
	FOREIGN KEY(id_klienta) REFERENCES Klienci (id_klienta) ON UPDATE SET NULL ON DELETE SET NULL,
	FOREIGN KEY(id_pracownika) REFERENCES Pracownicy (id_pracownika) ON UPDATE SET NULL ON DELETE SET NULL,
	FOREIGN KEY(id_modelu) REFERENCES Modele (id_modelu) ON UPDATE SET NULL ON DELETE SET NULL
)
GO

INSERT INTO Marki(nazwa,kraj_pochodzenia,data_zalozenia)
VALUES 
('Audi','Niemcy','1909-07-16'),
('BMW','Niemcy','1916-03-07'),
('Dodge','USA','1900-01-01'),
('Chevrolet','USA','1911-11-03')
GO

INSERT INTO Modele(id_marki,nazwa,pojemnosc_silnika)
VALUES 
(1,'a4',2.0),
(1,'a6',3.0),
(2,'f30',3.0),
(2,'f10',3.0),
(3,'Charger',6.4),
(3,'Challenger',5.7),
(4,'Camaro',3.6),
(4,'Corvette',6.2)
GO

INSERT INTO Ceny(id_modelu,data_od,data_do,cena)
VALUES 
(1,'2017-01-01','2018-01-01',142800),
(2,'2017-01-01','2018-01-01',290000),
(3,'2017-01-01','2018-01-01',228300),
(4,'2017-01-01','2018-01-01',292800),
(5,'2017-01-01','2018-01-01',200000),
(6,'2017-01-01','2018-01-01',129990),
(7,'2017-01-01','2018-01-01',144000),
(8,'2017-01-01','2018-01-01',259900),
(1,'2018-01-01','2019-01-01',132800),
(2,'2018-01-01','2019-01-01',270000),
(3,'2018-01-01','2019-01-01',218300),
(4,'2018-01-01','2019-01-01',222800),
(5,'2018-01-01','2019-01-01',220000),
(6,'2018-01-01','2019-01-01',139990),
(7,'2018-01-01','2019-01-01',124000),
(8,'2018-01-01','2019-01-01',239900)
GO

INSERT INTO Pracownicy(imie,nazwisko,pesel,data_przyjecia)
VALUES 
('Jan','Nowak','94234423','2017-11-20'),
('Tadeusz','Kowalski','94434423','2017-07-11'),
('Joanna','Sobota','94235423','2017-05-16'),
('Arkadiusz','Ogórek','94237423','2018-01-01')
GO

INSERT INTO Klienci(imie,nazwisko,nr_dowodu,data_urodzenia)
VALUES 
('Zuzanna','Nowak','EHT653243','1970-07-16'),
('Julia','Bąk','EHS653243','1990-03-07'),
('Lena','Marciniak','EHT654243','1985-08-28'),
('Bartek','Pietrzak','EHT653743','1982-01-01'),
('Antoni','Mazur','EHT623243','1950-11-03'),
('Zuzanna','Maciejewska','EHT653733','1970-07-16'),
('Bartek','Kuczyński','EHS343243','1990-03-07'),
('Bartek ','Wiśniewski','EHT664243','1985-08-28'),
('Aleksandra','Wójcik','EHT676743','1982-01-01'),
('Wiktor','Walczak','EHT623083','1950-11-03')
GO

INSERT INTO Zamowienia(id_klienta,id_pracownika,id_modelu,data_zamowienia,data_odbioru,cena_sprzedazy,oplacone,zrealizowane)
VALUES 
(1,2,1,'2018-01-01','2018-01-01',130000,0,1),
(2,3,1,'2018-01-01','2018-01-01',135000,0,1),
(3,1,1,'2018-01-01','2018-01-01',140000,0,0),
(4,4,3,'2018-01-01','2018-01-01',220000,1,1),
(5,2,2,'2018-01-01','2018-01-01',280000,1,1),
(6,2,6,'2018-01-01','2018-01-01',126000,0,1),
(7,1,8,'2018-01-01','2018-01-01',230000,0,1),
(8,1,8,'2018-01-01','2018-01-01',240000,1,1),
(9,4,3,'2018-01-01','2018-01-01',220000,1,1),
(10,3,3,'2018-01-01','2018-01-01',210000,1,1)
GO

CREATE SCHEMA raporty
GO

CREATE VIEW raporty.widok1 AS 
SELECT Marki.nazwa, COUNT(*) AS ilosc_zamowien, SUM(Zamowienia.cena_sprzedazy) AS suma
FROM Marki
INNER JOIN Modele ON Marki.id_marki = Modele.id_marki
INNER JOIN Zamowienia ON Modele.id_modelu = Zamowienia.id_modelu
GROUP BY Marki.nazwa
GO

CREATE VIEW raporty.widok2 AS 
SELECT Zamowienia.id_zamowienia, cast((cena-cena_sprzedazy)/cena AS DECIMAL(9,2)) AS rabat
FROM Zamowienia
INNER JOIN Ceny ON Zamowienia.id_modelu = Ceny.id_modelu AND Zamowienia.data_zamowienia >= Ceny.data_od AND Zamowienia.data_zamowienia < Ceny.data_do
GO

CREATE VIEW raporty.widok3 AS 
SELECT Marki.nazwa AS Marka, Modele.nazwa AS Model
FROM Zamowienia
RIGHT JOIN Modele ON Zamowienia.id_modelu = Modele.id_modelu
INNER JOIN Marki ON Marki.id_marki = Modele.id_marki
WHERE id_zamowienia IS NULL
GO

CREATE VIEW raporty.widok4 AS 
SELECT imie, nazwisko, COUNT(*) AS liczba_zamowien, SUM(Zamowienia.cena_sprzedazy) AS laczna_kwota
FROM Pracownicy
INNER JOIN Zamowienia ON Zamowienia.id_pracownika = Pracownicy.id_pracownika
WHERE Zamowienia.zrealizowane = 1
GROUP BY imie, nazwisko
GO