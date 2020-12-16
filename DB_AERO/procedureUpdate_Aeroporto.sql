USE Aeroporto;  
GO

CREATE PROCEDURE paisuspuspUpdate
    @cod_pais char(1),  
    @dsc_pais VARCHAR(40)
AS
    BEGIN
        UPDATE dbo.paises
		SET dsc_pais = ISNULL(@dsc_pais,dsc_pais)
        WHERE cod_pais = @cod_pais
    END
GO

EXECUTE paisuspuspUpdate
   1
  ,"Colombia"
GO

USE Aeroporto;  
GO

CREATE PROCEDURE companhiauspUpdate
    @cod_comp numeric(3), 
	@dsc_comp varchar(40)
AS
    BEGIN
        UPDATE dbo.companhias_aeras
		SET dsc_comp = ISNULL(@dsc_comp,dsc_comp)
        WHERE cod_comp = @cod_comp
    END
GO

EXECUTE companhiauspUpdate
   1
  ,"LATAM"
GO

USE Aeroporto;  
GO

CREATE PROCEDURE cidadeuspUpdate
    @cod_cid numeric(4), 
	@nom_cid varchar(40)
AS
    BEGIN
        UPDATE dbo.cidades
		SET nom_cid = ISNULL(@nom_cid,nom_cid)
        WHERE cod_cid = @cod_cid
    END
GO

EXECUTE cidadeuspUpdate
   1
  ,"SALVADOR"
GO

USE Aeroporto;  
GO

CREATE PROCEDURE tipouspUpdate
    @cod_tpa numeric(3),
	@capacidade numeric(3)
AS
    BEGIN
        UPDATE dbo.tipos_avioes
		SET capacidade = ISNULL(@capacidade,capacidade)
        WHERE cod_tpa = @cod_tpa
    END
GO

EXECUTE tipouspUpdate
   1
  ,"600"
GO

USE Aeroporto;  
GO

CREATE PROCEDURE voouspUpdate
    @cod_voo numeric(4),
	@horario numeric(4)
AS
    BEGIN
        UPDATE dbo.voos
		SET horario = ISNULL(@horario,horario)
        WHERE cod_voo = @cod_voo
    END
GO

EXECUTE voouspUpdate
   1
  ,"3.30"
GO

USE Aeroporto;  
GO

CREATE PROCEDURE aeroportouspUpdate
    @cod_aero char(3), 
	@nom_aero varchar(40)
AS
    BEGIN
        UPDATE dbo.aeroportos
		SET nom_aero = ISNULL(@nom_aero,nom_aero)
        WHERE cod_aero = @cod_aero
    END
GO

EXECUTE aeroportouspUpdate
   1
  ,"SALVADOR AERO"
GO

USE Aeroporto;  
GO

CREATE PROCEDURE escalauspUpdate
    @cod_voo numeric(4),
    @num_esc numeric(2),
	@cod_aero char(3)
AS
    BEGIN
        UPDATE dbo.escalas
		SET num_esc = ISNULL(@num_esc,num_esc)
        WHERE cod_voo = @cod_voo and cod_aero = @cod_aero
    END
GO

EXECUTE escalauspUpdate
   1
  ,2
  ,1
GO


USE Aeroporto;  
GO

CREATE PROCEDURE tarifauspUpdate
    @cod_comp char(1),
	@cod_aero_origem char(3),
	@cod_aero_destino char(3),
	@valor numeric(7,2)
AS
    BEGIN
        UPDATE dbo.tarifas
		SET valor = ISNULL(@valor,valor)
        WHERE cod_comp = @cod_comp and cod_aero_origem = @cod_aero_origem and cod_aero_destino = @cod_aero_destino
    END
GO

EXECUTE tarifauspUpdate
   1
  ,1
  ,1
  ,3
GO

SELECT * FROM DBO.tarifas