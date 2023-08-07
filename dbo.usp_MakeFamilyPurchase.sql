IF OBJECT_ID('dbo.usp_MakeFamilyPurchase', 'P') IS NOT NULL DROP PROC dbo.usp_MakeFamilyPurchase;
GO

CREATE PROC dbo.usp_MakeFamilyPurchase
    @FamilySurName AS VARCHAR(255)
AS

IF @FamilySurName IN (SELECT SurName FROM dbo.Family)
    BEGIN
        DECLARE @ID_Family INT;
        SET @ID_Family = (
            SELECT ID FROM dbo.Family
            WHERE SurName = @FamilySurName
        );

        UPDATE dbo.Family
        SET BudgetValue = BudgetValue - (
            SELECT SUM(B.value)
            FROM dbo.Basket AS B
            WHERE B.ID_Family = @ID_Family
            GROUP BY B.ID_Family
        )
        WHERE id = @ID_Family;             
    END;

ELSE RAISERROR(N'Family does not exists.', 1, 1);
GO

---------------------------------
-- Аналогично, но в lowercase --
---------------------------------

/*
if object_id('dbo.usp_MakeFamilyPurchase', 'p') is not null drop proc dbo.usp_MakeFamilyPurchase;
go

create proc dbo.usp_MakeFamilyPurchase
    @FamilySurName as varchar(255)
as

if @FamilySurName in (select SurName from dbo.Family)
    begin
        declare @ID_Family int;
        set @ID_Family = (
            select ID from dbo.Family
            where SurName = @FamilySurName
        );

        update dbo.Family
        set BudgetValue = BudgetValue - (
            select SUM(B.value)
            from dbo.Basket as B
            where B.ID_Family = @ID_Family
            group by B.ID_Family
        )
        where id = @ID_Family;             
    end;

else raiserror(N'Family does not exists.', 1, 1);
go
*/