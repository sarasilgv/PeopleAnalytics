--Turnover (%)

select
    round(
        count(vendas_2016_2020.data_afastamento)::numeric
        / nullif(count(*), 0) * 100, 2
    ) AS turnover_percentual
from rh_database.vendas_2016_2020
where data_admissao <= current_date
