/*** Membership in Van Tuyl society in FY05 ***/
drop table temp_mack_van_tuyl_05;
commit;
/

create table temp_mack_van_tuyl_05
as
(select id_Number
from a_dw_pyramid
where year_of_giving = '2005'
and flag_alumni <> '1'
and id_number in
    (select id_number
       from a_dw_gift_clubs
      where pc05 = '1')
having sum(total_jnt_cash) between '2500' and '4999.99'
group by id_number);

/*** Membership in Van Tuyl society in FY06 ***/
drop table temp_mack_van_tuyl_06;
commit;
/

create table temp_mack_van_tuyl_06
as
(select id_Number
from a_dw_pyramid
where year_of_giving = '2006'
and flag_alumni <> '1'
and id_number in
    (select id_number
       from a_dw_gift_clubs
      where pc06 = '1')
having sum(total_jnt_cash) between '2500' and '4999.99'
group by id_number);


/*** FY05 number Trisha wants ***/
select sum(associated_amount + associated_amount_match + associated_amount_claim)
from a_dw_pyramid
where year_of_giving = '2005'
  and flag_alumni <> '1'
  and id_number in
    (select id_number
       from temp_mack_van_tuyl_05);
       
       
/*** FY06 number Trisha wants ***/
select sum(associated_amount + associated_amount_match + associated_amount_claim)
from a_dw_pyramid
where year_of_giving = '2006'
  and flag_alumni <> '1'
  and id_number in
    (select id_number
       from temp_mack_van_tuyl_06);