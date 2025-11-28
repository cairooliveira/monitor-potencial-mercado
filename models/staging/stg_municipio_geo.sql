with source as (
    select * from {{ source('diretorios', 'municipio') }}
),

renamed as (
    select
        id_municipio as municipio_id,
        nome as nome_cidade,
        sigla_uf as estado

    from source
)

select * from renamed