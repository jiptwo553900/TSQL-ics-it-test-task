# 📄 TSQL-ics-it-test-task 
**Test task for ics-it recruiting (Transact-SQL)**

## ꔵ Branches
Short description of the branches

### Tables
Contains `CreateStructure.sql` to create DB schema.

### Functions
Contain `dbo.udf_GetSKUPrice.sql` to create a function to calculate the price of a product.

### VIEWs
Contain `dbo.vw_SKUPrice.sql` to create a view of all columns of `dbo.SKU` + calculated (with `dbo.udf_GetSKUPrice.sql`) column named `Price`.

### Procedures
Contain `dbo.usp_MakeFamilyPurchase.sql` to create a procedure to calculate and update `dbo.Family.BudgetValue`.

### Triggers
Contain `dbo.TR_Basket_insert_update.sql` to create a DML trigger which fires when `dbo.Basket` is updated or have values inserted to calculate `DiscountValue` field of `dbo.Basket`.
