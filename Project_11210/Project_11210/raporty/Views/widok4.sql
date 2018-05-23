CREATE VIEW raporty.widok4 AS 
SELECT imie, nazwisko, COUNT(*) AS liczba_zamowien, SUM(Zamowienia.cena_sprzedazy) AS laczna_kwota
FROM Pracownicy
INNER JOIN Zamowienia ON Zamowienia.id_pracownika = Pracownicy.id_pracownika
WHERE Zamowienia.zrealizowane = 1
GROUP BY imie, nazwisko
