USE Zoologico;  
GO

EXECUTE cidadeuspInsert
   3
  ,"Sim�o Dias"
GO

EXECUTE cargouspInsert
	2
   ,"Servi�os"
   , 1000
GO

EXECUTE enderecouspInsert
	2
   ,1
   ,"Rua Judas Perdeu as Botas"
   ,99
   ,"Centro"
GO

EXECUTE funcionariouspInsert
	201800
   ,2
   ,1
   ,"07111909500"
   ,2085420
   ,8888888
   ,"Rayssa"
   ,"14-08-1998 12:35:29"
GO

EXECUTE classeuspInsert
	1
   ,"Mam�fero"
   ,"presen�as de pelos no corpo e de gl�ndulas mam�rias"
GO

EXECUTE alaspInsert
	1
   ,1
GO

EXECUTE containeruspInsert
	1
   ,1
   ,"A�o"
GO

EXECUTE animaluspInsert
	1
   ,1
   ,1
   ,"cachorro"
   ,"marrom"
   ,"viralata"
   ,0.65
GO

EXECUTE consultauspInsert
	1
   ,201600
   ,1
   ,"12:32:01"
   ,"01/01/2020"
GO

EXECUTE limpezauspInsert
	1
   ,201800
   ,1
   ,"12:32:01"
   ,"01/01/2020"
GO

EXECUTE acompanhauspInsert
	1
   ,201800
GO

