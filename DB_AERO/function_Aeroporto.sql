USE Aeroporto
GO

create Function buscaVoosInter()
Returns @voosInter Table (dia numeric(1), horario numeric(4), dsc_comp varchar(40), dsc_pais VARCHAR(40), nom_cid varchar(40))
As
Begin
	Insert @voosInter
		Select vo.dia, vo.horario, ca.dsc_comp, pa.dsc_pais, ci.nom_cid
			From dbo.voos vo left join dbo.companhias_aeras ca 
			on(vo.cod_comp = ca.cod_comp)
							 left join dbo.paises pa
			on(pa.cod_pais = ca.cod_pais)
							 left join dbo.cidades ci
			on(ci.cod_pais = pa.cod_pais)	 
		Where (select ca.cod_pais from tarifas ta left join companhias_aeras ca on(ta.cod_aero_origem = ca.cod_comp)) 
		<> (select ca.cod_pais from tarifas ta left join companhias_aeras ca on(ta.cod_aero_destino = ca.cod_comp))
	Return
End
Go


