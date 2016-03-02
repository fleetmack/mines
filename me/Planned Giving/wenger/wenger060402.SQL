/***tier 1,2,or 3 in san antonio***/

select * 
from a_dw_address_good
where p_zipcode between '78000' and '78299'
and id_number in 
    (select id_number
       from demographic_profile
      where dp_rating_code in ('1','2','3'))

/***tier 1,2,or 3 in austin***/

select * 
from a_dw_address_good
where p_zipcode between '78600' and '78799'
and id_number in 
    (select id_number
       from demographic_profile
      where dp_rating_code in ('1','2','3'))



/***chris's assignments in san antonio***/
select * from a_dw_assignment
where id_number in
(select id_number from a_dw_address_good
where p_zipcode between '78000' and '78299'
and ass_initials = 'CW')

/*** chris's assignements in austin***/
select * from a_dw_assignment
where id_number in
(select id_number from a_dw_address_good
where p_zipcode between '78600' and '78799'
and ass_initials = 'CW')






