IF OBJECT_ID('dbo.TR_Basket_insert_update', 'TR') IS NOT NULL DROP TRIGGER dbo.TR_Basket_insert_update;
GO

CREATE TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT, UPDATE
AS
    IF @@ROWCOUNT = 0 RETURN;
    SET NOCOUNT ON;

    UPDATE dbo.Basket
    SET DiscountValue = B.Value * 0.05 * 
        CASE WHEN I.Quantity >= 2 THEN 1 ELSE 0 END
    FROM dbo.Basket AS B
        INNER JOIN inserted AS I ON B.ID = I.ID;

GO

---------------------------------
-- Аналогично, но в lowercase --
---------------------------------

/*
if object_id('dbo.TR_Basket_insert_update', 'tr') is not null drop trigger dbo.TR_Basket_insert_update;
go

create trigger dbo.TR_Basket_insert_update
on dbo.Basket
after insert, update
as
    if @@rowcount = 0 return;
    set nocount on;

    update dbo.Basket
    set DiscountValue = B.Value * 0.05 * 
        case when I.Quantity >= 2 then 1 else 0 end
    from dbo.Basket as B
        inner join inserted as I on B.ID = I.ID;
        
go
*/
