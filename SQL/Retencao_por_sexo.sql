-- Tempo de Retenção por sexo

with 
	r as (
		select
			cod_funcionario,
			cargo,
			sexo,
			data_admissao,
			data_afastamento,
			(data_afastamento - data_admissao) dias_trabalhando,
			situacao,
			case 
				when (data_afastamento - data_admissao) <=90 then '3 meses'
				when (data_afastamento - data_admissao) <=180 then '6 meses'
				when (data_afastamento - data_admissao) >180 then '+ 6 meses'	
				else 'Ativo'
				end as meses_trabalhados
		from rh_database.vendas_2016_2020

	)

select 
	meses_trabalhados,
	sexo,
	count(*) qtde_funcionarios
from r
group by
	meses_trabalhados,
	sexo
order by
	meses_trabalhados,
	sexo


