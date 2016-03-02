/*** Heritage Society Non-Member Mailing ***/
/*** Used 1946-1972 in fy2007 **************/
select id_number
from a_dw_address_good      
where record_type_code = 'AL'
and pref_class_year between '1946' and '1973'
and (p_flag_foreign = '0' or p_country_code = 'CD')
and id_number in
    (select p.id_number
       from a_dw_pyramid    p
      where flag_alumni <> '1'
     having sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) >= 2500
     group by p.id_number)
and id_number not in
    (select id_number
       from a_dw_gift_clubs
      where heritage_society = 1);
      
      
      select count(id_number) from a_std_3;
      
      
select *
from salutation
where salutation_type_code = 'MW'
order by id_number