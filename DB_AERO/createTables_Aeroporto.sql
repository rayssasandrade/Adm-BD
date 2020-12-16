use Aeroporto
CREATE TABLE dbo.paises
   (cod_pais char(1) PRIMARY KEY NOT NULL,  
   dsc_pais VARCHAR(40) NOT NULL,
   continente char(1) NOT NULL)  
GO

use Aeroporto
CREATE TABLE dbo.companhias_aeras
   (
      cod_comp numeric(3) NOT NULL, 
	  cod_pais char(1) NOT NULL,
	  dsc_comp varchar(40) NOT NULL
      , CONSTRAINT pk_companhias PRIMARY KEY (cod_comp)
      , CONSTRAINT fk_companhias_paises FOREIGN KEY (cod_pais)
        REFERENCES paises (cod_pais)
        ON DELETE CASCADE
        ON UPDATE CASCADE
   );

use Aeroporto
CREATE TABLE dbo.cidades
   (
      cod_cid numeric(4) NOT NULL, 
	  cod_pais char(1) NOT NULL,
	  nom_cid varchar(40) NOT NULL
      , CONSTRAINT pk_cidades PRIMARY KEY (cod_cid)
      , CONSTRAINT fk_cidades_paises FOREIGN KEY (cod_pais)
        REFERENCES paises (cod_pais)
        ON DELETE CASCADE
        ON UPDATE CASCADE
   );

use Aeroporto
CREATE TABLE dbo.tipos_avioes
   (
      cod_tpa numeric(3) PRIMARY KEY NOT NULL,
	  capacidade numeric(3) NOT NULL,
	  dsc_tipo varchar(40) NOT NULL
   );

use Aeroporto
CREATE TABLE dbo.voos
   (
      cod_voo numeric(4) NOT NULL, 
	  cod_comp numeric(3) NOT NULL,
	  cod_tpa numeric(3) NOT NULL,
	  dia numeric(1) NOT NULL,
	  horario numeric(4) NOT NULL
      , CONSTRAINT pk_voos PRIMARY KEY (cod_voo)
      , CONSTRAINT fk_voos_companhias FOREIGN KEY (cod_comp)
        REFERENCES companhias_aeras (cod_comp)
		ON DELETE CASCADE
        ON UPDATE CASCADE
	  , CONSTRAINT fk_voos_tipos FOREIGN KEY (cod_tpa)
		REFERENCES tipos_avioes (cod_tpa)
        ON DELETE CASCADE
        ON UPDATE CASCADE
   );

use Aeroporto
CREATE TABLE dbo.aeroportos
   (
      cod_aero char(3) NOT NULL, 
	  tpo_aero char(1) NOT NULL,
	  cod_cid numeric(4) NOT NULL,
	  nom_aero varchar(40) NOT NULL,
	  obs varchar(200) NOT NULL
      , CONSTRAINT pk_aeroportos PRIMARY KEY (cod_aero)
	  , CONSTRAINT fk_aeroportos_cidades FOREIGN KEY (cod_cid)
		REFERENCES cidades (cod_cid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
   );

use Aeroporto
CREATE TABLE dbo.escalas
(
    cod_voo numeric(4) NOT NULL,
    num_esc numeric(2) NOT NULL,
	cod_aero char(3) NOT NULL
  , CONSTRAINT pk_escalas PRIMARY KEY(cod_voo, num_esc)
  , CONSTRAINT fk_escalas_aeroportos FOREIGN KEY (cod_aero) 
	REFERENCES aeroportos (cod_aero)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

use Aeroporto
CREATE TABLE dbo.tarifas
(
    cod_comp char(1) NOT NULL,
	cod_aero_origem char(3) NOT NULL,
	cod_aero_destino char(3) NOT NULL,
	valor numeric(7,2) NOT NULL
  , CONSTRAINT pk_tarifas PRIMARY KEY(cod_comp, cod_aero_origem, cod_aero_destino)
);


