-- Classificacao das Contratacoes 

with contratacao as (
	select 
		vendas_2016_2020.cod_funcionario cod_fun,
		vendas_2016_2020.data_afastamento,
		vendas_2016_2020.data_admissao,
		vendas_2016_2020.situacao,
		vendas_2016_2020.cargo,
		vendas_2016_2020.causa_afastamento,
		case 
			when (data_afastamento - data_admissao) <= 90 then 'Má contratação'
			when (data_afastamento - data_admissao) between 90 and 365 then 'Boa contratação'
			when (data_afastamento - data_admissao) >365 then 'Excelente contratação'	
			else 'Ativos'
			end as tipo_contratacao
	from rh_database.vendas_2016_2020
)

	select
		tipo_contratacao,
		count(contratacao.tipo_contratacao) contratacoes
	from contratacao
	group by 
		tipo_contratacao
	order by 
		tipo_contratacao