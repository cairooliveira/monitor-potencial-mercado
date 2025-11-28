with source as (
    -- Aqui usamos a função source do dbt para criar a conexão e a linhagem
    select * from {{ source('basedosdados', 'municipio') }}
),

renamed as (
    select
        id_municipio as municipio_id,
        ano,
        pib,
        -- Vamos pegar também o PIB per capita para análises futuras
        impostos_liquidos,
      
    from source
)

select * from renamed
where ano >= 2018 -- Vamos filtrar para não carregar dados muito antigos