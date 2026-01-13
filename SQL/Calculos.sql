
select 
distinct cargo, valor_salario
from rh_database.vendas_2016_2020
order by valor_salario


-- Quantidade de Contratacoes

select 
	count(*) Contratacoes
from rh_database.vendas_2016_2020



select 
	cod_funcionario,
	situacao,
	(current_date - ddata_nascimento)/365 || ' anos' idade
from rh_database.vendas_2016_2020
order by idade desc

/* Más Contratações 

❌ Má contratação: até 90 dias

⚠️ Boa contratação: 90 a 365 dias

✅ Excelente contratação: acima de 365 dias

*/

select 
	vendas_2016_2020.cod_funcionario cod_fun,
	vendas_2016_2020.data_afastamento,
	vendas_2016_2020.data_admissao,
	vendas_2016_2020.situacao,
	vendas_2016_2020.cargo,
	vendas_2016_2020.causa_afastamento,
	case 
		when (data_afastamento - data_admissao) <= 90 then 'Má contratação'
		when (data_afastamento - data_admissao) between 90 and 365 then 'Boa contratação'
		when (data_afastamento - data_admissao) >365 then 'Excelente contratação'		
		end as tipo_contratacao
from rh_database.vendas_2016_2020
where vendas_2016_2020.situacao = 'Demitido'


select 
	distinct(vendas_2016_2020.cargo) cargos,
	count(vendas_2016_2020.cod_funcionario) qtde_fun
from rh_database.vendas_2016_2020
where vendas_2016_2020.cargo like '%ESTAGI%'
group by cargos
order by qtde_fun desc


-------------------------------------


SELECT
    'ESTAGIARIOS' AS tipo,
    COUNT(cod_funcionario) AS qtde_estagiarios
FROM rh_database.vendas_2016_2020
WHERE cargo ILIKE '%ESTAGI%';


SELECT
	*,
	CASE
		WHEN cargo ilike '%estagi%' THEN 'ESTAGIARIO'
		WHEN cargo ilike '%diret%' THEN 'DIRETOR'
		WHEN cargo ilike '%gest%' THEN 'GESTOR'
		WHEN cargo ilike '%analis%' THEN 'ANALISTA'
		WHEN cargo ilike '%opera%' THEN 'OPERADOR'
		WHEN cargo ilike '%ajudan%' THEN 'AJUDANTE'
		WHEN cargo ilike '%apren%' THEN 'APRENDIZ'
		WHEN cargo ilike '%assist%' THEN 'ASSISTENTE'
		WHEN cargo ilike '%auxi%' THEN 'AUXILIAR'
		WHEN cargo ilike '%gere%' THEN 'GERENTE'
		ELSE 'outros'
			END AS tipo_cargo
FROM rh_database.vendas_2016_2020 
