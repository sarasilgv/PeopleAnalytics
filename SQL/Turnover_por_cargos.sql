--Turnover por cargos (%)

select
	distinct 
		substring(cargo, strpos(cargo, '-')+1) cargo,	
	    round(
        count(vendas_2016_2020.data_afastamento)::numeric
        / nullif(count(*), 0) * 100, 2
    ) AS turnover_percentual
from rh_database.vendas_2016_2020
where vendas_2016_2020.data_admissao <= current_date
group by 
	cargo
order by
	substring(cargo, strpos(cargo, '-')+1) asc



