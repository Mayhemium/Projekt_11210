CREATE TABLE [dbo].[Klienci] (
    [id_klienta]     INT          IDENTITY (1, 1) NOT NULL,
    [imie]           VARCHAR (20) NULL,
    [nazwisko]       VARCHAR (20) NULL,
    [data_urodzenia] DATE         NULL,
    [nr_dowodu]      CHAR (9)     NULL,
    PRIMARY KEY CLUSTERED ([id_klienta] ASC),
    UNIQUE NONCLUSTERED ([nr_dowodu] ASC)
);

