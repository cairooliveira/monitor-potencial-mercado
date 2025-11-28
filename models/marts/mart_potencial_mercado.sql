with pib as (
    select * from {{ ref('stg_pib_municipio') }}
),

geo as (
    select * from {{ ref('stg_municipio_geo') }}
),

final as (
    select
        geo.municipio_id,
        geo.nome_cidade,
        geo.estado,
        pib.ano,
        pib.pib,
        

        case
            when pib.pib > 1000000000 then 'Alta Prioridade' 
            when pib.pib > 500000000 then 'Média Prioridade'
            else 'Baixa Prioridade'
        end as cluster_mercado

    from pib
    inner join geo on pib.municipio_id = geo.municipio_id
    where pib.ano = 2021
)

select * from final
order by pib desc