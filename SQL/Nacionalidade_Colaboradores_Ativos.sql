-- Quadro de Colaboradores Ativos por Nacionalidade

select 
	distinct vendas_2016_2020.nacionalidade,
	count (*) quantidade
from rh_database.vendas_2016_2020
where vendas_2016_2020.situacao != 'Demitido'
group by 
	vendas_2016_2020.nacionalidade