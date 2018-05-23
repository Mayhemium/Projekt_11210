CREATE VIEW raporty.widok3 AS 
SELECT Marki.nazwa AS Marka, Modele.nazwa AS Model
FROM Zamowienia
RIGHT JOIN Modele ON Zamowienia.id_modelu = Modele.id_modelu
INNER JOIN Marki ON Marki.id_marki = Modele.id_marki
WHERE id_zamowienia IS NULL
