-- Colaboradores ativos desde:

select
	substring(data_admissao::text, 1, 4) as ano,
	count(*) quantidade
from rh_database.vendas_2016_2020
where situacao != 'Demitido'
group by ano
order by ano