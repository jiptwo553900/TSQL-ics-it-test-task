IF OBJECT_ID('dbo.vw_SKUPrice', 'V') IS NOT NULL DROP VIEW dbo.vw_SKUPrice;
GO

CREATE VIEW dbo.vw_SKUPrice
AS
    SELECT S.ID, S.Code, S.name, dbo.udf_GetSKUPrice(S.ID) AS Price
    FROM dbo.SKU AS S;
GO

---------------------------------
-- Аналогично, но в lowercase --
---------------------------------

/*
if object_id('dbo.vw_SKUPrice', 'v') is not null drop view dbo.vw_SKUPrice;
go

create view dbo.vw_SKUPrice
as
    select S.ID
        ,S.Code
        ,S.name
        ,dbo.udf_GetSKUPrice(S.ID) as Price
    from dbo.SKU as S;
go
*/
