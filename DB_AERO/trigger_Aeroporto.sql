USE Aeroporto
GO
CREATE TRIGGER validacao_tarifa
ON dbo.tarifas
FOR UPDATE, INSERT AS 
BEGIN 
    DECLARE 
        @valor numeric(7,2) = (SELECT valor FROM dbo.tarifas)
 
    IF (@valor < 50.00)
    BEGIN 
        ROLLBACK TRANSACTION; 
		RAISERROR ('Não é possivel inserir um valor de tarifa menor que R$50,00', 15, 1); 
        RETURN;
    END 
END; 
GO

EXECUTE tarifauspUpdate
   1
  ,1
  ,1
  ,3
GO
