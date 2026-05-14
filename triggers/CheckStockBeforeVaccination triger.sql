CREATE TRIGGER CheckStockBeforeVaccination
ON _pinkaschisunim
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted I
        INNER JOIN _stocVaccine Sv 
		ON I.VaccineId = Sv.Id
        WHERE Sv.stoc <= 0
    )
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 50000, 'not found in stoc', 1;
    END
END;
