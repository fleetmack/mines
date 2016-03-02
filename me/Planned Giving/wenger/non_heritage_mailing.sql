/*** for wenger's heritage society mailing***/
/*** run this then select all from temp_wenger_blah in a_std_3 ***/

create table temp_wenger_blah
as
(select id_number from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year <= 1951
and id_number not in
    (select id_number
       from a_dw_gift_clubs
      where heritage_society = 1));
commit;
/

delete from temp_wenger_blah
where id_number in
(select  p.id_number
from temp_wenger_blah  w,
              a_dw_pyramid      p
        where p.id_number = w.id_number
       having sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) >=25000
       group by p.id_number)

commit;
/



/***
drop table temp_wenger_blah;
commit;
/

select * from temp_wenger_blah