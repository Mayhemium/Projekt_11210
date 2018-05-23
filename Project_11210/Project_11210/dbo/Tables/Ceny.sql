CREATE TABLE [dbo].[Ceny] (
    [id_ceny]   INT            IDENTITY (1, 1) NOT NULL,
    [id_modelu] INT            NULL,
    [data_od]   DATE           NULL,
    [data_do]   DATE           NULL,
    [cena]      DECIMAL (9, 2) NULL,
    PRIMARY KEY CLUSTERED ([id_ceny] ASC),
    FOREIGN KEY ([id_modelu]) REFERENCES [dbo].[Modele] ([id_modelu]) ON DELETE SET NULL ON UPDATE SET NULL
);

