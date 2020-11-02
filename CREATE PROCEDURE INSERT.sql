USE Zoologico;  
GO 

CREATE PROCEDURE cidadeuspInsert
    @cod_cidade int,
	@nome_cidade varchar(25)
AS
    BEGIN
        INSERT INTO cidade(
            [cod_cidade]
        ,   [nome_cidade])
      VALUES(
            @cod_cidade
        ,   @nome_cidade 
      )
    END
GO

CREATE PROCEDURE cargouspInsert
    @cod_cargo int,
	@nome_cargo varchar(25),
	@salario money
AS
    BEGIN
        INSERT INTO cargo(
            [cod_cargo]
		,   [nome_cargo]
        ,   [salario])
      VALUES(
            @cod_cargo
        ,   @nome_cargo
		,   @salario
      )
    END
GO

CREATE PROCEDURE enderecouspInsert
    @cod_endereco int, 
	@cod_cidade int,
	@rua varchar(150),
    @numero numeric(10),
    @bairro varchar(50)
AS
    BEGIN
        INSERT INTO endereco(
            [cod_endereco]
		,   [cod_cidade]
        ,   [rua]
		,   [numero]
		,   [bairro])
      VALUES(
            @cod_endereco
        ,   @cod_cidade
		,   @rua
		,   @numero
		,   @bairro
      )
    END
GO


CREATE PROCEDURE funcionariouspInsert
	@matricula int,
	@cod_cargo int,
	@cod_endereco int,
	@cpf varchar(11),
	@rg int,
	@crmv int,
	@nome varchar(255),
	@data_nasc smalldatetime
AS
    BEGIN
        INSERT INTO funcionario(
            [matricula]
		,   [cod_cargo]
        ,   [cod_endereco]
		,   [cpf]
		,   [rg]
		,   [crmv]	
		,   [nome]
		,   [data_nasc])
      VALUES(
            @matricula
        ,   @cod_cargo
		,   @cod_endereco
		,   @cpf
		,   @rg
		,   @crmv
		,   @nome
		,   @data_nasc
      )
    END
GO

CREATE PROCEDURE classeuspInsert
	@cod_classe int,
	@nome varchar(255),
	@descricao varchar(255)
AS
    BEGIN
        INSERT INTO classe(
            [cod_classe]
		,   [nome]
        ,   [descricao])
      VALUES(
            @cod_classe
        ,   @nome
		,   @descricao
      )
    END
GO

CREATE PROCEDURE alaspInsert
	@num_ala int,
	@cod_classe int
AS
    BEGIN
        INSERT INTO ala(
            [num_ala]
		,   [cod_classe])
      VALUES(
            @num_ala
        ,   @cod_classe
      )
    END
GO

CREATE PROCEDURE containeruspInsert
	@cod_container int,
	@num_ala int,
	@tipo varchar(50)
AS
    BEGIN
        INSERT INTO container(
            [cod_container]
		,   [num_ala]
        ,   [tipo])
      VALUES(
            @cod_container
        ,   @num_ala
		,   @tipo
      )
    END
GO

CREATE PROCEDURE animaluspInsert
	@cod_animal int,
	@cod_container int,
	@cod_classe int,
	@nome varchar(255),
	@cor varchar(50),
	@especie varchar(50),
	@altura numeric(3,2)
AS
    BEGIN
        INSERT INTO animal(
            [cod_animal]
		,   [cod_container]
        ,   [cod_classe]
		,   [nome]
		,   [cor]
		,   [especie]
		,   [altura])
      VALUES(
            @cod_animal
        ,   @cod_container
		,   @cod_classe
		,   @nome
		,   @cor
		,   @especie
		,   @altura
      )
    END
GO

CREATE PROCEDURE consultauspInsert
	@cod_consulta int,
	@matricula int,
	@cod_animal int,
	@hora time,
	@data_consulta date
AS
    BEGIN
        INSERT INTO historico_consulta(
            [cod_consulta]
		,   [matricula]
        ,   [cod_animal]
		,   [hora]
		,   [data_consulta])
      VALUES(
            @cod_consulta
        ,   @matricula
		,   @cod_animal
		,   @hora
		,   @data_consulta
      )
    END
GO

CREATE PROCEDURE limpezauspInsert
	@cod_limpeza int,
	@matricula int,
	@cod_container int,
	@hora_limpeza time,
	@data_limpeza date
AS
    BEGIN
        INSERT INTO limpeza(
            [cod_limpeza]
		,   [matricula]
        ,   [cod_container]
		,   [hora_limpeza]
		,   [data_limpeza])
      VALUES(
            @cod_limpeza
		,   @matricula
        ,   @cod_container
		,   @hora_limpeza
		,   @data_limpeza
      )
    END
GO

CREATE PROCEDURE acompanhauspInsert
	@cod_animal INT,
    @matricula INT
AS
    BEGIN
        INSERT INTO acompanha(
            [cod_animal]
		,   [matricula])
      VALUES(
            @cod_animal
		,   @matricula
      )
    END
GO