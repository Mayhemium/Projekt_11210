CREATE TABLE [dbo].[Zamowienia] (
    [id_zamowienia]   INT            IDENTITY (1, 1) NOT NULL,
    [id_klienta]      INT            NULL,
    [id_pracownika]   INT            NULL,
    [id_modelu]       INT            NULL,
    [cena_sprzedazy]  DECIMAL (9, 2) NULL,
    [data_zamowienia] DATE           NULL,
    [data_odbioru]    DATE           NULL,
    [zrealizowane]    BIT            NULL,
    [oplacone]        BIT            NULL,
    PRIMARY KEY CLUSTERED ([id_zamowienia] ASC),
    CHECK ([cena_sprzedazy]>(0)),
    FOREIGN KEY ([id_klienta]) REFERENCES [dbo].[Klienci] ([id_klienta]) ON DELETE SET NULL ON UPDATE SET NULL,
    FOREIGN KEY ([id_modelu]) REFERENCES [dbo].[Modele] ([id_modelu]) ON DELETE SET NULL ON UPDATE SET NULL,
    FOREIGN KEY ([id_pracownika]) REFERENCES [dbo].[Pracownicy] ([id_pracownika]) ON DELETE SET NULL ON UPDATE SET NULL
);

