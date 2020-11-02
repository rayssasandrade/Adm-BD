USE Zoologico
GO
CREATE FUNCTION retornaIdCidade(@nome_cidade varchar(25))
RETURNS int 
AS 
	BEGIN
		DECLARE @idCidade int 
		SET @idCidade= 
			(SELECT cod_cidade FROM dbo.cidade WHERE nome_cidade = @nome_cidade)
		RETURN (@idCidade)
	END
GO

create FUNCTION retornaExisteSalario(@salario money)
RETURNS nvarchar(3)
AS 
	BEGIN
		DECLARE @existeSalario nvarchar(3)
			select @existeSalario = 
				CASE 
					WHEN salario = @salario THEN 'Yes' 
					WHEN salario = @salario THEN 'No'
				END
			FROM dbo.cargo
		RETURN (@existeSalario)
	END
GO

CREATE FUNCTION retornaQtdEndrecos(@cod_cidade int)
RETURNS int
AS 
	BEGIN
		DECLARE @qtdEnderecos int 
		SET @qtdEnderecos = 
			(SELECT COUNT(cod_cidade) FROM dbo.endereco where cod_cidade = @cod_cidade)
		RETURN (@qtdEnderecos)
	END
GO

CREATE FUNCTION retornaMediaIdadeFuncionarios(@cod_cargo int)
RETURNS float
AS 
	BEGIN
		DECLARE @mediaIdade float 
		SET @mediaIdade = 
			(select AVG(DATEDIFF(YY, data_nasc, GETDATE())) from funcionario where cod_cargo = @cod_cargo)
		RETURN (@mediaIdade)
	END
GO

CREATE FUNCTION retornaDescricao(@nome varchar(255))
RETURNS varchar(255)
AS 
	BEGIN
		DECLARE @descricao varchar(255)
		SET @descricao= 
			(SELECT descricao from dbo.classe where nome = @nome)
		RETURN (@descricao)
	END
GO

CREATE FUNCTION retornaNumAlas(@cod_classe int)
RETURNS varchar(255)
AS 
	BEGIN
		DECLARE @numAlas varchar(255)
		SET @numAlas = (
			SELECT COALESCE(@numAlas + ', ', '') + num_ala FROM dbo.ala where cod_classe = @cod_classe
		)
		RETURN (@numAlas)
	END
GO

CREATE FUNCTION retornaQtdContainer(@tipo varchar(50))
RETURNS int
AS 
	BEGIN
		DECLARE @qtdContainers int 
		SET @qtdContainers = 
			(SELECT COUNT(cod_container) FROM dbo.container where tipo = @tipo)
		RETURN (@qtdContainers)
	END
GO

CREATE FUNCTION retornaMaiorAnimal(@cod_container int)
RETURNS varchar(255)
AS 
	BEGIN
		DECLARE @animal varchar(255)
		SET @animal = 
			(SELECT CONCAT('Nome:',
				IsNull(nome,0),', Cor: ',
				IsNull(cor,0),', Espécie:',
				IsNull(especie,0))
			 FROM dbo.animal where cod_container = @cod_container
			)
		RETURN (@animal)
	END
GO

CREATE FUNCTION retornaQtdConsultaEntre(@data_incio date, @data_fim date)
RETURNS int
AS 
	BEGIN
		DECLARE @qtdConsultas int 
		SET @qtdConsultas = 
			(select COUNT(cod_consulta) FROM dbo.historico_consulta where data_consulta >= @data_incio AND data_consulta < @data_fim)
		RETURN (@qtdConsultas)
	END
GO

CREATE FUNCTION funcionarioQueFezLimpeza(@cod_container int)
RETURNS varchar(255)
AS 
	BEGIN
		DECLARE @funcionario varchar(255)
		SET @funcionario = 
			(SELECT f.nome from dbo.funcionario f left join dbo.limpeza l on l.matricula = f.matricula where l.cod_container = @cod_container)
		RETURN (@funcionario)
	END
GO

CREATE FUNCTION retornaMatriculaAcompanha(@cod_animal int)
RETURNS int
AS 
	BEGIN
		DECLARE @matriculaFun int
		SET @matriculaFun = 
			(SELECT matricula from dbo.acompanha where cod_animal = @cod_animal)
		RETURN (@matriculaFun)
	END
GO



