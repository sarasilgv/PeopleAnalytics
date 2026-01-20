-- Média Salarial dos Cargos

select 
	distinct 
		substring(cargo, strpos(cargo, '-')+1) cargo,	
	round(
		cast(avg(valor_salario) as numeric), 2
		) media_salarial
from rh_database.vendas_2016_2020
group by 
	cargo
order by
	substring(cargo, strpos(cargo, '-')+1) asc
