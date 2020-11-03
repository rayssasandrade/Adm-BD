USE Zoologico
GO

create Function buscaCidade(@cod_cidade int)
Returns @cidade Table (cod_cidade int, descricao varchar(25))
As
Begin
Insert @cidade
Select cod_cidade, nome_cidade
From dbo.cidade
Where cod_cidade = @cod_cidade
Return
End
Go

create Function buscaCargo(@cod_cargo int)
Returns @cargo Table (cod_cargo int, nome_cargo varchar(25), salario money)
As
Begin
Insert @cargo
Select cod_cargo, nome_cargo, salario
From dbo.cargo
Where cod_cargo = @cod_cargo
Return
End
Go

create Function enderecoCompleto(@cod_endereco Int)
Returns @enderecoCompleto Table (cod_endereco int, descricao Varchar(MAX))
As
Begin
Insert @enderecoCompleto
Select cod_endereco, CONCAT(
						IsNull(rua,0),',',
						IsNull(numero,0),'-',
						IsNull(bairro,0)
					)
From dbo.endereco
Where cod_endereco = @cod_endereco
Return
End
Go

create Function buscaFuncionario(@nome varchar(255))
Returns @funcionario Table (matricula int, nome varchar(255), nome_cargo varchar(25),
							cpf varchar(11), data_nasc smalldatetime)
As
Begin
Insert @funcionario
Select f.matricula, f.nome, c.nome_cargo, f.cpf, f.data_nasc
From dbo.funcionario f left join dbo.cargo c on(f.cod_cargo = c.cod_cargo)
Where nome = @nome
Return
End
Go

create Function buscaClasse(@cod_classe int)
Returns @classe Table (cod_classe int, nome varchar(255), descricao varchar(255))
As
Begin
Insert @classe
Select cod_classe, nome, descricao
From dbo.classe
Where cod_classe = @cod_classe
Return
End
Go

create Function buscaAlas(@cod_classe int)
Returns @alasDaClasse Table (cod_classe int, num_ala int)
As
Begin
Insert @alasDaClasse
Select * From dbo.ala
Where cod_classe = @cod_classe
Return
End
Go

create Function buscaContainerPorTipo(@tipo varchar(50))
Returns @containers Table (cod_container int, num_ala int, tipo varchar(50))
As
Begin
Insert @containers
Select * From dbo.container
Where tipo = @tipo
Return
End
Go

create Function qtdAnimaisPorEspecie()
Returns @AnimaisPorEspecie Table (especie varchar(50), qtd int)
As
Begin
Insert @AnimaisPorEspecie
Select especie, Count(especie) AS Qtd
From dbo.animal
group by especie
Return
End
Go

create Function buscaHistoricoConsulta(@cod_consulta int)
Returns @consulta Table (cod_consulta int, funcionario varchar(255),
	  animal varchar(255), hora time, data_consulta date )
As
Begin
Insert @consulta
Select hc.cod_consulta, f.nome, a.nome, hc.hora, hc.data_consulta
From dbo.historico_consulta hc left join funcionario f on(f.matricula = hc.matricula) 
								left join animal a on(a.cod_animal = hc.cod_animal)
Where cod_consulta = @cod_consulta
Return
End
Go


create Function buscalimpezasPorData(@data date)
Returns @limpezasDoDia Table (cod_limpeza int, matricula int, cod_container int, 
		hora_limpeza time, data_limpeza date)
As
Begin
Insert @limpezasDoDia
Select * From dbo.limpeza
Where data_limpeza = @data
Return
End
Go

create Function buscaAcompanhamentoPorAnimal(@cod_animal int)
Returns @acompanhamentos Table (cod_animal int, matricula int)
As
Begin
Insert @acompanhamentos
Select cod_animal, matricula
From dbo.acompanha
Where cod_animal = @cod_animal
group by cod_animal, matricula
Return
End
Go

