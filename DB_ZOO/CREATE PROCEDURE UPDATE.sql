USE Zoologico;  
GO 

CREATE PROCEDURE cidadeuspUpdate
    @cod_cidade int,
	@nome_cidade varchar(25)
AS
    BEGIN
        UPDATE dbo.cidade
		SET nome_cidade = ISNULL(@nome_cidade,nome_cidade)
        WHERE cod_cidade = @cod_cidade
    END
GO

CREATE PROCEDURE cargouspUpdate
    @cod_cargo int,
	@nome_cargo varchar(25),
	@salario money
AS
    BEGIN
        UPDATE cargo
		SET nome_cargo = ISNULL(@nome_cargo, nome_cargo) 
        ,   salario = ISNULL(@salario, salario)
		WHERE cod_cargo = @cod_cargo
    END;
GO

CREATE PROCEDURE enderecouspUpdate
    @cod_endereco int, 
	@cod_cidade int,
	@rua varchar(150),
    @numero numeric(10),
    @bairro varchar(50)
AS
    BEGIN
        UPDATE endereco
		SET cod_cidade = ISNULL(@cod_cidade,cod_cidade)
		,   rua = ISNULL(@rua,rua)
        ,   numero = ISNULL(@numero,numero)
		,   bairro = ISNULL(@bairro,bairro)
		WHERE cod_endereco = @cod_endereco
    END;
GO

CREATE PROCEDURE funcionariouspUpdate
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
        UPDATE funcionario
		SET cod_cargo = ISNULL(@cod_cargo,cod_cargo)
		,   cod_endereco = ISNULL(@cod_endereco,cod_endereco) 
        ,   cpf = ISNULL(@cpf,cpf)
		,   rg = ISNULL(@rg,rg) 
		,   crmv = ISNULL(@crmv,crmv)
		,   nome = ISNULL(@nome,nome)
		,   data_nasc = ISNULL(@data_nasc,data_nasc)
		WHERE matricula = @matricula
    END;
GO

CREATE PROCEDURE classeuspUpdate
	@cod_classe int,
	@nome varchar(255),
	@descricao varchar(255)
AS
    BEGIN
        UPDATE classe
		SET nome = ISNULL(@nome,nome)
		,   descricao = ISNULL(@descricao,descricao)
		WHERE cod_classe = @cod_classe
    END
GO

CREATE PROCEDURE alaspUpdate
	@num_ala int,
	@cod_classe int
AS
    BEGIN
        UPDATE ala
		SET cod_classe = ISNULL(@cod_classe,cod_classe)
		WHERE num_ala = @num_ala
    END
GO

CREATE PROCEDURE containeruspUpadate
	@cod_container int,
	@num_ala int,
	@tipo varchar(50)
AS
    BEGIN
        UPDATE container
		SET num_ala = ISNULL(@num_ala,num_ala)
		,   tipo = ISNULL(@tipo,tipo) 
		WHERE cod_container = @cod_container
    END
GO

CREATE PROCEDURE animaluspUpdate
	@cod_animal int,
	@cod_container int,
	@cod_classe int,
	@nome varchar(255),
	@cor varchar(50),
	@especie varchar(50),
	@altura numeric(3,2)
AS
    BEGIN
        UPDATE animal
		SET cod_container = ISNULL(@cod_container,cod_container) 
		,   cod_classe = ISNULL(@cod_classe,cod_classe)
        ,   nome = ISNULL(@nome,nome)
		,   cor = ISNULL(@cor,cor) 
		,   especie = ISNULL(@especie,especie)
		,   altura = ISNULL(@altura,altura)
		WHERE cod_animal = @cod_animal
    END;
GO

CREATE PROCEDURE consultauspUpdate
	@cod_consulta int,
	@matricula int,
	@cod_animal int,
	@hora time,
	@data_consulta smalldatetime
AS
    BEGIN
        UPDATE historico_consulta
		SET matricula = ISNULL(@matricula,matricula) 
		,   cod_animal = ISNULL(@cod_animal,cod_animal)
        ,   hora = ISNULL(@hora,hora)
		,   data_consulta = ISNULL(@data_consulta,data_consulta)
		WHERE cod_consulta = @cod_consulta
    END;
GO

CREATE PROCEDURE limpezauspUpdate
	@cod_limpeza int,
	@matricula int,
	@cod_container int,
	@hora_limpeza time,
	@data_limpeza smalldatetime
AS
    BEGIN
        UPDATE limpeza
		SET matricula = ISNULL(@matricula,matricula)
		,   cod_container = ISNULL(@cod_container,cod_container)
        ,   hora_limpeza = ISNULL(@hora_limpeza,hora_limpeza)
		,   data_limpeza = ISNULL(@data_limpeza,data_limpeza)
		WHERE cod_limpeza = @cod_limpeza
    END
GO

CREATE PROCEDURE acompanhauspUpdate
	@cod_animal INT,
    @matricula INT
AS
    BEGIN
        UPDATE acompanha
		SET matricula = ISNULL(@matricula,matricula)
		WHERE cod_animal = @cod_animal
    END
GO