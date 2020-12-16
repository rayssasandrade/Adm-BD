USE Aeroporto;  
GO
CREATE PROCEDURE tarifauspDelete
    @cod_comp char(1),
	@cod_aero_origem char(3),
	@cod_aero_destino char(3)
AS
BEGIN
    DELETE FROM dbo.tarifas WHERE cod_comp = @cod_comp and cod_aero_origem = @cod_aero_origem and cod_aero_destino = @cod_aero_destino
END

EXECUTE tarifauspDelete
    1,1,2
GO

USE Aeroporto;  
GO
CREATE PROCEDURE escalauspDelete
    @cod_voo numeric(4),
    @num_esc numeric(2)
AS
BEGIN
    DELETE FROM dbo.escalas WHERE cod_voo = @cod_voo and num_esc = @num_esc
END

EXECUTE escalauspDelete
    1,1
GO

USE Aeroporto;  
GO
CREATE PROCEDURE aeroportouspDelete
    @cod_aero char(3)
AS
BEGIN
    DELETE FROM dbo.aeroportos WHERE cod_aero = @cod_aero
END

EXECUTE aeroportouspDelete
    1
GO

USE Aeroporto;  
GO
CREATE PROCEDURE voouspDelete
    @cod_voo numeric(4)
AS
BEGIN
    DELETE FROM dbo.voos WHERE cod_voo = @cod_voo
END

EXECUTE voouspDelete
    1
GO

USE Aeroporto;  
GO
CREATE PROCEDURE tipouspDelete
    @cod_tpa numeric(3)
AS
BEGIN
    DELETE FROM dbo.tipos_avioes WHERE cod_tpa = @cod_tpa
END

EXECUTE tipouspDelete
    1
GO

USE Aeroporto;  
GO
CREATE PROCEDURE companhiauspDelete
   @cod_comp numeric(3)
AS
BEGIN
    DELETE FROM dbo.companhias_aeras WHERE cod_comp = @cod_comp
END

EXECUTE companhiauspDelete
    1
GO

USE Aeroporto;  
GO
CREATE PROCEDURE paisuspDelete
    @cod_pais char(1)
AS
BEGIN
    DELETE FROM dbo.paises WHERE cod_pais = @cod_pais
END

EXECUTE paisuspDelete
    1
GO