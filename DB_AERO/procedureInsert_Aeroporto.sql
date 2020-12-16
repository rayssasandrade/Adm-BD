USE Aeroporto;  
GO
CREATE PROCEDURE paisuspInsert
    @cod_pais char(1),  
    @dsc_pais VARCHAR(40),
    @continente char(1)
AS
    BEGIN
        INSERT INTO paises(
            [cod_pais]
        ,   [dsc_pais]
		,	[continente])
      VALUES(
            @cod_pais
        ,   @dsc_pais
		,	@continente
      )
    END
GO

EXECUTE paisuspInsert
1,
"BRAZIL",
"AMÉRICA CENTRAL"
GO

USE Aeroporto;  
GO
CREATE PROCEDURE companhiauspInsert
    @cod_comp numeric(3), 
	@cod_pais char(1),
	@dsc_comp varchar(40)
AS
    BEGIN
        INSERT INTO companhias_aeras(
            [cod_comp]
        ,   [cod_pais]
		,	[dsc_comp])
      VALUES(
            @cod_comp
        ,   @cod_pais
		,	@dsc_comp
      )
    END
GO

EXECUTE companhiauspInsert
1,
1,
"GOL"
GO

USE Aeroporto;  
GO
CREATE PROCEDURE cidadeuspInsert
    @cod_cid numeric(4), 
	@cod_pais char(1),
	@nom_cid varchar(40)
AS
    BEGIN
        INSERT INTO cidades(
            [cod_cid]
        ,   [cod_pais]
		,	[nom_cid])
      VALUES(
            @cod_cid
        ,   @cod_pais
		,	@nom_cid
      )
    END
GO

EXECUTE cidadeuspInsert
2,
1,
"MACEIÓ"
GO

USE Aeroporto;  
GO
CREATE PROCEDURE tipouspInsert
    @cod_tpa numeric(3),
	@capacidade numeric(3),
	@dsc_tipo varchar(40)
AS
    BEGIN
        INSERT INTO tipos_avioes(
            [cod_tpa]
        ,   [capacidade]
		,	[dsc_tipo])
      VALUES(
            @cod_tpa
        ,   @capacidade
		,	@dsc_tipo
      )
    END
GO

EXECUTE tipouspInsert
2,
540,
"Airbus A380"
GO

USE Aeroporto;  
GO
CREATE PROCEDURE voouspInsert
    @cod_voo numeric(4), 
	@cod_comp numeric(3),
	@cod_tpa numeric(3),
	@dia numeric(1),
	@horario numeric(4)
AS
    BEGIN
        INSERT INTO voos(
            [cod_voo]
        ,   [cod_comp]
		,	[cod_tpa]
		,	[dia]
		,	[horario])
      VALUES(
            @cod_voo
        ,   @cod_comp
		,	@cod_tpa
		,	@dia
		,	@horario
      )
    END
GO

EXECUTE voouspInsert
1,
1,
2,
1,
52
GO

USE Aeroporto;  
GO
CREATE PROCEDURE aeroportouspInsert
    @cod_aero char(3), 
	@tpo_aero char(1),
	@cod_cid numeric(4),
	@nom_aero varchar(40),
	@obs varchar(200)
AS
    BEGIN
        INSERT INTO aeroportos(
            [cod_aero]
        ,   [tpo_aero]
		,	[cod_cid]
		,	[nom_aero]
		,	[obs])
      VALUES(
            @cod_aero
        ,   @tpo_aero
		,	@cod_cid
		,	@nom_aero
		,	@obs
      )
    END
GO

EXECUTE aeroportouspInsert
2,
1,
2,
"MACEIÓ PORT",
"CENTRO"
GO

USE Aeroporto;  
GO
CREATE PROCEDURE escalauspInsert
    @cod_voo numeric(4),
    @num_esc numeric(2),
	@cod_aero char(3)
AS
    BEGIN
        INSERT INTO escalas(
            [cod_voo]
        ,   [num_esc]
		,	[cod_aero])
      VALUES(
            @cod_voo
        ,   @num_esc
		,	@cod_aero
      )
    END
GO

EXECUTE escalauspInsert
1,
20,
2
GO

USE Aeroporto;  
GO
CREATE PROCEDURE tarifauspInsert
    @cod_comp char(1),
	@cod_aero_origem char(3),
	@cod_aero_destino char(3),
	@valor numeric(7,2)
AS
    BEGIN
        INSERT INTO tarifas(
            [cod_comp]
        ,   [cod_aero_origem]
		,	[cod_aero_destino]
		,	[valor])
      VALUES(
            @cod_comp
        ,   @cod_aero_origem
		,	@cod_aero_destino
		,	@valor
      )
    END
GO

EXECUTE tarifauspInsert
2,
2,
2,
5
GO
