-- Massa Salarial

select
	round(
		cast(sum(valor_salario) as numeric), 2
		) massa_salarial
from rh_database.vendas_2016_2020
where vendas_2016_2020.situacao != 'Demitido'