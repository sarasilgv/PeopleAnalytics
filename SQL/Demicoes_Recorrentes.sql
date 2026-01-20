-- Tipos das Demicoes recorrentes

select 
	vendas_2016_2020.causa_afastamento,
	count(*) quantidade
from rh_database.vendas_2016_2020
where vendas_2016_2020.situacao = 'Demitido'
group by
	vendas_2016_2020.causa_afastamento
order by quantidade desc