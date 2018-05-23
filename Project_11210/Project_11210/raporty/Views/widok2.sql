CREATE VIEW raporty.widok2 AS 
SELECT Zamowienia.id_zamowienia, cast((cena-cena_sprzedazy)/cena AS DECIMAL(9,2)) AS rabat
FROM Zamowienia
INNER JOIN Ceny ON Zamowienia.id_modelu = Ceny.id_modelu AND Zamowienia.data_zamowienia >= Ceny.data_od AND Zamowienia.data_zamowienia < Ceny.data_do
