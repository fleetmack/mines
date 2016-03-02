


//***were pc during sometime the last 5 years and live in chi-town***//
select * from a_dw_address_good
where p_zipcode between '60016' and '62949'
and id_number in
(select id_number from a_dw_gift_clubs
where (pc_cfy = 1
or pc_pfy = 1
or pc02 = 1
or pc01 = 1
or pc00 = 1
or pc99 = 1
or pc98 = 1
or pc97 = 1))


//***those entities with a prospect manager assigned that live in the greater Chicago area***//

select id_number from a_dw_address_good
where p_zipcode between '60016' and '62949'
and id_number in
(select id_number from  assignment)






