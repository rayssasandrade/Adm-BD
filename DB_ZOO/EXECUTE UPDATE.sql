USE Zoologico;  
GO

EXECUTE cidadeuspUpdate
   1
  ,"Lagarto"
GO

EXECUTE cargouspUpdate
	2
   ,"Serviços gerais"
   , 3000
GO

EXECUTE enderecouspUpdate
	2
   ,1
   ,"Praça da Rodoviária"
   ,55
   ,"Centro"
GO

EXECUTE funcionariouspUpdate
	201800
   ,2
   ,1
   ,"07111909500"
   ,2085420
   ,8888888
   ,"Rayssa"
   ,"14-08-1998 12:35:29"
GO

EXECUTE classeuspUpdate
	1
   ,"Aves"
   ,"capacidade de manter a temperatura corporal constante"
GO

EXECUTE alaspUpdate
	1
   ,1
GO

EXECUTE containeruspUpadate
	1
   ,1
   ,"Ferro"
GO

EXECUTE animaluspUpdate
	1
   ,1
   ,1
   ,"papagaio"
   ,"verde"
   ,"Papagaio-chauá"
   ,0.65
GO

EXECUTE consultauspUpdate
	1
   ,201600
   ,1
   ,"12:00:00"
   ,"01/05/2020 12:00:00"
GO

EXECUTE limpezauspUpdate
	1
   ,201800
   ,1
   ,"02:32:01"
   ,"01/01/2020 02:32:01"
GO

EXECUTE acompanhauspUpdate
	1
   ,201600
GO

