-- Quantidade de Demicoes

select 
	count(*) demissoes
from rh_database.vendas_2016_2020
where vendas_2016_2020.situacao = 'Demitido'

