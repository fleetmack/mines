select id_number from a_dw_address_good
where id_number in 
    (select id_number 
    from a_dw_pyramid where commitment_date > '20010701'
    and total_commitment > '1000'
    and total_cash < total_commitment
)


select * from a_dw_pyramid where commitment_date > '20010701'
    and total_commitment > '1000'
    and total_cash < total_commitment


    select * from a_dw_address_good
