IF OBJECT_ID('dbo.Basket', 'U') IS NOT NULL DROP TABLE dbo.Basket;
IF OBJECT_ID('dbo.SKU', 'U') IS NOT NULL DROP TABLE dbo.SKU;
IF OBJECT_ID('dbo.Family', 'U') IS NOT NULL DROP TABLE dbo.Family;
GO

CREATE TABLE dbo.SKU
(
    ID INT NOT NULL IDENTITY(1, 1),
    Code AS (('s' + CAST(ID AS VARCHAR(9)))),
    [Name] VARCHAR(255) NOT NULL,
    CONSTRAINT PK_SKU_id PRIMARY KEY (ID),
    CONSTRAINT AK_SKU_Code UNIQUE (Code)
);
GO

CREATE TABLE dbo.Family
(
    ID INT NOT NULL IDENTITY(1, 1),
    SurName VARCHAR(255) NOT NULL,
    BudgetValue DECIMAL(18, 2) NOT NULL,
    CONSTRAINT PK_Family_id PRIMARY KEY (ID)
);
GO

CREATE TABLE dbo.Basket
(
    ID INT NOT NULL IDENTITY(1, 1),
    ID_SKU INT NOT NULL,
    ID_Family INT NOT NULL,
    Quantity SMALLINT NOT NULL
        CONSTRAINT CHK_Basket_Quantity CHECK (Quantity > 0),
    [Value] DECIMAL(18, 2) NOT NULL
        CONSTRAINT CHK_Basket_Value CHECK ([Value] >= 0),
    PurchaseDate DATE NOT NULL
        CONSTRAINT DF_Basket_PurchaseDate DEFAULT (CAST(GETDATE() AS DATE)),
    DiscountValue DECIMAL(18, 2) NULL,
    CONSTRAINT PK_Basket_ID PRIMARY KEY (ID),
    CONSTRAINT FK_Basket_ID_SKU FOREIGN KEY (ID_SKU) REFERENCES dbo.SKU(id),
    CONSTRAINT FK_Basket_ID_Family FOREIGN KEY (ID_Family) REFERENCES dbo.Family(id)
);
GO

---------------------------------
-- Аналогично, но в lowercase --
---------------------------------

/*
if object_id('dbo.Basket', 'u') is not null drop table dbo.Basket;
if object_id('dbo.SKU', 'u') is not null drop table dbo.SKU;
if object_id('dbo.Family', 'u') is not null drop table dbo.Family;
go

create table dbo.SKU
(
    ID int not null identity(1,1)
    ,Code as (('s' + cast(ID as varchar(9))))
    ,[Name] varchar(255) not null
    ,constraint PK_SKU_id primary key (ID)
    ,constraint AK_SKU_Code unique (Code)
);
go

create table dbo.Family
(
    ID int not null identity(1,1)
    ,SurName varchar(255) not null
    ,BudgetValue decimal(18, 2) not null
    ,constraint PK_Family_id primary key (ID)
);
go

create table dbo.Basket
(
    ID int not null identity(1,1)
    ,ID_SKU int not null
    ,ID_Family int not null
    ,Quantity smallint not null
        constraint CHK_Basket_Quantity check (Quantity > 0)
    ,[Value] decimal(18,2) not null
        constraint CHK_Basket_Value check ([Value] >= 0)
    ,PurchaseDate date not null
        constraint DF_Basket_PurchaseDate default (cast(getdate() as date))
    ,DiscountValue decimal(18,2) null
    ,constraint PK_Basket_ID primary key (ID)
    ,constraint FK_Basket_ID_SKU foreign key (ID_SKU) references dbo.SKU(id)
    ,constraint FK_Basket_ID_Family foreign key (ID_Family) references dbo.Family(id)
);
go
*/
