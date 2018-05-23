CREATE VIEW raporty.widok1 AS 
SELECT Marki.nazwa, COUNT(*) AS ilosc_zamowien, SUM(Zamowienia.cena_sprzedazy) AS suma
FROM Marki
INNER JOIN Modele ON Marki.id_marki = Modele.id_marki
INNER JOIN Zamowienia ON Modele.id_modelu = Zamowienia.id_modelu
GROUP BY Marki.nazwa
