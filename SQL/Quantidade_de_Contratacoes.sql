-- Quantidade de Contratacoes

select 
	count(*) contratacoes
from rh_database.vendas_2016_2020
where vendas_2016_2020.situacao in ('Trabalhando', 'Férias')