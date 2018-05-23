CREATE TABLE [dbo].[Marki] (
    [id_marki]         INT          IDENTITY (1, 1) NOT NULL,
    [nazwa]            VARCHAR (20) NULL,
    [kraj_pochodzenia] VARCHAR (20) NULL,
    [data_zalozenia]   DATE         NULL,
    PRIMARY KEY CLUSTERED ([id_marki] ASC)
);

