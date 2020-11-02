USE Zoologico
GO

Create Function F_ConsultarProdutos (@Codigo Int)
Returns @Tabela1 Table (codigo Int, descricao Varchar(10))
As
Begin
Insert @Tabela1
Select Codigo, Descricao
From Produtos
Where Codigo = @Codigo
Return
End
Go