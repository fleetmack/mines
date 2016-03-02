/***all chicago people who were PC in 01 or 02***/
select id_number from a_dw_address_good
where p_zipcode between '60016' and '62949'
and id_number in
(select id_number from a_dw_gift_clubs
where pc01 = 1 or pc02 = 1)



/***all chicago people who are in major prospect category a,b, or c***/
select id_number from a_dw_address_good                    
where   p_zipcode between '60016' and '62949'
and id_number in
    (select id_number from a_dw_demop_prof
     where major_gift_code in ('A','B','C'))



