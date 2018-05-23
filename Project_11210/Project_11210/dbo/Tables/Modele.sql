CREATE TABLE [dbo].[Modele] (
    [id_modelu]         INT            IDENTITY (1, 1) NOT NULL,
    [id_marki]          INT            NULL,
    [nazwa]             VARCHAR (20)   NULL,
    [pojemnosc_silnika] DECIMAL (2, 1) NULL,
    PRIMARY KEY CLUSTERED ([id_modelu] ASC),
    FOREIGN KEY ([id_marki]) REFERENCES [dbo].[Marki] ([id_marki]) ON DELETE SET NULL ON UPDATE SET NULL
);

