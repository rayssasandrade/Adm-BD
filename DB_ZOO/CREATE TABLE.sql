CREATE TABLE dbo.cidade
   (cod_cidade int PRIMARY KEY NOT NULL,  
   nome_cidade varchar(25) NOT NULL)  
GO

CREATE TABLE dbo.cargo
   (cod_cargo int PRIMARY KEY NOT NULL,  
   nome_cargo varchar(25) NOT NULL,
   salario money NOT NULL check (salario>0) )  
GO

CREATE TABLE dbo.endereco
   (
      cod_endereco int NOT NULL, 
	  cod_cidade int NOT NULL,
	  rua varchar(150) NOT NULL,
      numero numeric(10) NULL,
      bairro varchar(50) NOT NULL
      , CONSTRAINT pk_endereco PRIMARY KEY (cod_endereco)
      , CONSTRAINT fk_endereco_cidade FOREIGN KEY (cod_cidade)
        REFERENCES cidade (cod_cidade)
        ON DELETE CASCADE
        ON UPDATE CASCADE
   );

CREATE TABLE dbo.funcionario
   (
      matricula int NOT NULL,
	  cod_cargo int NOT NULL,
	  cod_endereco int NOT NULL,
	  cpf varchar(11) NOT NULL,
	  rg numeric(10) NOT NULL,
	  crmv numeric(10) NOT NULL,
	  nome varchar(255) NOT NULL,
	  data_nasc smalldatetime NOT NULL
      , CONSTRAINT pk_funcionario PRIMARY KEY (matricula)
      , CONSTRAINT fk_cargo_funcionario FOREIGN KEY (cod_cargo)
		REFERENCES cargo (cod_cargo)
	  , CONSTRAINT fk_endereco_funcionario FOREIGN KEY (cod_endereco)
		REFERENCES endereco (cod_endereco)
        ON DELETE CASCADE
        ON UPDATE CASCADE
   );

CREATE TABLE dbo.classe
   (
	  cod_classe int PRIMARY KEY NOT NULL,
	  nome varchar(255) NOT NULL,
	  descricao varchar(255) NOT NULL)
GO

CREATE TABLE dbo.ala
   (
	  num_ala int NOT NULL,
	  cod_classe int NOT NULL
      , CONSTRAINT pk_ala PRIMARY KEY (num_ala)
      , CONSTRAINT fk_classe_ala FOREIGN KEY (cod_classe)
		REFERENCES classe (cod_classe)
        ON DELETE CASCADE
        ON UPDATE CASCADE
   );

CREATE TABLE dbo.container
   (
	  cod_container int NOT NULL,
	  num_ala int NOT NULL,
	  tipo varchar(50) NOT NULL
      , CONSTRAINT pk_container PRIMARY KEY (cod_container)
      , CONSTRAINT fk_ala_container FOREIGN KEY (num_ala)
		REFERENCES ala (num_ala)
        ON DELETE CASCADE
        ON UPDATE CASCADE
   );

CREATE TABLE dbo.animal
   (
	  cod_animal int NOT NULL,
	  cod_container int NOT NULL,
	  cod_classe int NOT NULL,
	  nome varchar(255) NOT NULL,
	  cor varchar(50) NOT NULL,
	  especie varchar(50) NOT NULL,
	  altura numeric(3,2) NOT NULL
      , CONSTRAINT pk_animal PRIMARY KEY (cod_animal)
      , CONSTRAINT fk_classe_animal FOREIGN KEY (cod_classe)
		REFERENCES classe (cod_classe)
	  , CONSTRAINT fk_container_animal FOREIGN KEY (cod_container)
	    REFERENCES container (cod_container)
        ON DELETE CASCADE
        ON UPDATE CASCADE
   );

CREATE TABLE dbo.historico_consulta
   (
	  cod_consulta int NOT NULL,
	  matricula int NOT NULL,
	  cod_animal int NOT NULL,
	  hora time NOT NULL,
	  data_consulta date NOT NULL
      , CONSTRAINT pk_historico_consulta PRIMARY KEY (cod_consulta)
      , CONSTRAINT fk_funcionario_historico FOREIGN KEY (matricula)
		REFERENCES funcionario (matricula)
	  , CONSTRAINT fk_animal_historico FOREIGN KEY (cod_animal)
		REFERENCES animal (cod_animal)
        ON DELETE CASCADE
        ON UPDATE CASCADE
   );

CREATE TABLE dbo.limpeza
   (
	  cod_limpeza int NOT NULL,
	  matricula int NOT NULL,
	  cod_container int NOT NULL,
	  hora_limpeza time NOT NULL,
	  data_limpeza date NOT NULL
      , CONSTRAINT pk_limpeza PRIMARY KEY (cod_limpeza)
      , CONSTRAINT fk_funcionario_limpeza FOREIGN KEY (matricula)
		REFERENCES funcionario (matricula)
	  , CONSTRAINT fk_container_limpeza FOREIGN KEY (cod_container)
		REFERENCES container (cod_container)
        ON DELETE CASCADE
        ON UPDATE CASCADE
   );

CREATE TABLE dbo.acompanha
(
    cod_animal INT NOT NULL,
    matricula INT NOT NULL,
    CONSTRAINT pk_acompanha PRIMARY KEY(cod_animal, matricula),
    CONSTRAINT fk_animal_acompanha FOREIGN KEY (cod_animal) REFERENCES animal (cod_animal),
    CONSTRAINT fk_funcionario_acompanha FOREIGN KEY (matricula) REFERENCES funcionario (matricula)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);