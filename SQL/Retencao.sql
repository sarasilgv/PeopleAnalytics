/* Tempo de Retenção dos Funcionários

Tempo, em média, que os colaboradores permanecem na empresa.

Cálculo:
Data de desligamento (ou atual) – Data de admissão

Analisar retenção por cargo e área, principalmente nos primeiros meses.*/


with 
	r as (
		select
			cod_funcionario,
			cargo,
			data_admissao,
			data_afastamento,
			(data_afastamento - data_admissao) dias_trabalhando,
			situacao,
			case 
				when (data_afastamento - data_admissao) <=31 then '1 mês'
				when (data_afastamento - data_admissao) <=60 then '2 meses'
				when (data_afastamento - data_admissao) <=90 then '3 meses'
				when (data_afastamento - data_admissao) <=120 then '4 meses'
				when (data_afastamento - data_admissao) >120 then '+ 5 meses'	
				else 'Ativo'
				end as meses_trabalhados
		from rh_database.vendas_2016_2020

	),

-----------------

select
	distinct(cargo)
from rh_database.vendas_2016_2020
order by cargo asc