with source as (

    select * from {{ source('basedosdados', 'municipio') }}
),

renamed as (
    select
        id_municipio as municipio_id,
        ano,
        pib,
                impostos_liquidos,
      
    from source
)

select * from renamed
where ano >= 2018 