IF OBJECT_ID('dbo.udf_GetSKUPrice', 'FN') IS NOT NULL DROP FUNCTION dbo.udf_GetSKUPrice;
GO

CREATE FUNCTION dbo.udf_GetSKUPrice
(
    @ID_SKU AS INT
)
RETURNS DECIMAL(18, 2)
AS
    BEGIN
        RETURN
        (
            SELECT CAST(SUM(B.Value) / SUM(B.Quantity) AS DECIMAL(18, 2))
            FROM dbo.Basket AS B
            WHERE ID_SKU = @ID_SKU
            GROUP BY B.ID_SKU
        );
    END;
GO

---------------------------------
-- Аналогично, но в lowercase --
---------------------------------

/*
if object_id('dbo.udf_GetSKUPrice', 'fn') is not null drop function dbo.udf_GetSKUPrice;
GO

create function dbo.udf_GetSKUPrice
(
    @ID_SKU as int
)
returns decimal(18,2)
as
    begin
        return
        (
            select 
                cast(sum(B.Value) / sum(B.Quantity) as decimal(18,2))
            from dbo.Basket as B
            where ID_SKU = @ID_SKU
            group by B.ID_SKU
        );
    end;
go
*/
