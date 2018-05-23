CREATE TABLE [dbo].[Pracownicy] (
    [id_pracownika]  INT          IDENTITY (1, 1) NOT NULL,
    [imie]           VARCHAR (20) NULL,
    [nazwisko]       VARCHAR (20) NULL,
    [data_przyjecia] VARCHAR (20) NULL,
    [pesel]          CHAR (11)    NULL,
    PRIMARY KEY CLUSTERED ([id_pracownika] ASC),
    UNIQUE NONCLUSTERED ([pesel] ASC)
);

