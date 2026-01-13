
-- Turnover

/*Fórmula básica:
Desligamentos no período ÷ Funcionários ativos no período anterior*/


with 

desligamentos as (
	select
		--vendas_2016_2020.data_afastamento,
		--date_part('year', vendas_2016_2020.data_afastamento) ano,
		date_part('month', vendas_2016_2020.data_afastamento) mes,
		count(*) qtde_desligados
	from rh_database.vendas_2016_2020
	where vendas_2016_2020.situacao = 'Demitido'
	group by 
		--ano,
		mes
	order by
		--ano,
		mes
	),

ativos as (
	select
		--date_part('year', vendas_2016_2020.data_admissao) ano,
		date_part('month', vendas_2016_2020.data_admissao) mes,
		count(*) qtde_ativos
	from rh_database.vendas_2016_2020
	where vendas_2016_2020.situacao in('Trabalhando','Férias')
	group by 
		--ano,
		mes
	order by
		--ano,
		mes
		)

		
select 
	--desligamentos.ano,
	desligamentos.mes,
	desligamentos.qtde_desligados,
	ativos.qtde_ativos,
	lag(qtde_ativos) over () ativos_anterior,
	((qtde_desligados/(lag(qtde_ativos) over ()))) turnover
from desligamentos left join ativos on 
	desligamentos.mes = ativos.mes
order by
	--desligamentos.ano,
	desligamentos.mes



