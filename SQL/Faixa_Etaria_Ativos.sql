-- Faixa Etária dos Colaboradores Ativos

with idades as (
	select
		funcionario,
		(current_date - ddata_nascimento)/365 as idade
	from rh_database.vendas_2016_2020
	where situacao != 'Demitido' and (current_date - ddata_nascimento)/365 >0
)

select
	case
		when idade between 20 and 30 then '20 - 30 anos'
		when idade between 31 and 40 then '31 - 40 anos'
		when idade between 41 and 50 then '41 - 50 anos'
		else '50 - 60 anos'
		end as faixa_etaria,
	count( idades.funcionario) as qtde_de_colaboradores
from idades
group by
	faixa_etaria
order by 
	faixa_etaria