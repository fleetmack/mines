/*** Creates table with PC Members for past 10-14 years ***/
/******* Leave in inactive people, DNS, etc. ***********/
create table temp_miriam_pc_10_14
as
(select id_number
from a_dw_gift_clubs
where pc94 = '1'
and pc95 = '1'
and pc96 = '1'
and pc97 = '1'
and pc98 = '1'
and pc99 = '1'
and pc00 = '1'
and pc01 = '1'
and pc02 = '1'
and pc03 = '1')
commit;
/

/*** Delete those who gave for more than 15 consecutive years at PC level ***/
delete from temp_miriam_pc_10_14
where id_number in
(select id_number
from a_dw_pyramid
where date_of_record between '19880701' and '19890630'
  and person_or_org = 'P'
  and flag_behalf = '0'
  and flag_alumni = '0'
having sum(associated_amount + associated_amount_match + associated_amount_claim) >= 1000
group by id_number)
commit;
/



/*** Create Table for those who gave for 15 to 19 years at PC level ***/




/*** Drops Temp Table
drop table temp_miriam_pc_10_14;
commit;
/