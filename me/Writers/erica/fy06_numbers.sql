/***
# of members of PC in young alumni program in FY02
# of members of PC in young alumni program in FY06
Total $ giving from PC members in FY06 
Total $ giving from PC members in FY02 through FY06 (sum of FY02:FY06)
Total # members of PC in young alumni program FY02 through FY06 (sum of FY02:FY06)
Membership in Randall society in each of the years: FY02, FY03, FY04, FY05 and FY06
***/

/***# of members of PC in young alumni program in FY02***/
select count(id_number)
from a_dw_gift_clubs
where pc02 = '1'
and record_type_Code = 'AL'
and pref_class_year >= '1993';


/***# of members of PC in young alumni program in FY06 ***/
select count(id_number)
from a_dw_gift_clubs
where pc06 = '1'
and record_type_code = 'AL'
and pref_class_year >= '1997';


/*** Total $$ giving from PC members in FY06 ***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) as fy06_pc_giving
from a_dw_pyramid
where year_of_giving = '2006'
and flag_alumni <> '1'
and id_number in
    (select id_number
       from a_dw_gift_clubs
      where pc06 = '1');
      
/*** Total $ giving from PC members in FY02 through FY06 (sum of FY02:FY06) ***/
drop table mack_temp_02;
drop table mack_temp_03;
drop table mack_temp_04;
drop table mack_temp_05;
drop table mack_temp_06;
commit;

create table mack_temp_06
as
(select sum(associated_amount + associated_amount_match + associated_amount_claim) as fy06
   from a_dw_pyramid
  where year_of_giving = '2006'
    and flag_alumni <> '1'
    and id_number in
        (select id_number
           from a_dw_gift_clubs
          where pc06 = '1'));

create table mack_temp_05
as
(select sum(associated_amount + associated_amount_match + associated_amount_claim) as fy05
   from a_dw_pyramid
  where year_of_giving = '2005'
    and flag_alumni <> '1'
    and id_number in
        (select id_number
           from a_dw_gift_clubs
          where pc05 = '1'));

create table mack_temp_04
as
(select sum(associated_amount + associated_amount_match + associated_amount_claim) as fy04
   from a_dw_pyramid
  where year_of_giving = '2004'
    and flag_alumni <> '1'
    and id_number in
        (select id_number
           from a_dw_gift_clubs
          where pc04 = '1'));

create table mack_temp_03
as
(select sum(associated_amount + associated_amount_match + associated_amount_claim) as fy03
   from a_dw_pyramid
  where year_of_giving = '2003'
    and flag_alumni <> '1'
    and id_number in
        (select id_number
           from a_dw_gift_clubs
          where pc03 = '1'));

create table mack_temp_02
as
(select sum(associated_amount + associated_amount_match + associated_amount_claim) as fy02
   from a_dw_pyramid
  where year_of_giving = '2002'
    and flag_alumni <> '1'
    and id_number in
        (select id_number
           from a_dw_gift_clubs
          where pc02 = '1'));
commit;

/*** Gives the # Erica Wants ***/
select a.fy06 + b.fy05 + c.fy04 + d.fy03 + e.fy02 as total_fy02_thru_fy06
  from mack_temp_06     a,
       mack_temp_05     b,
       mack_temp_04     c,
       mack_temp_03     d,
       mack_temp_02     e;
       
/*** Total # members of PC in young alumni program FY02 through FY06 (sum of FY02:FY06) ***/
drop table mack_ya_02;
commit;


create table mack_ya_02
as 
    (select id_number
       from a_dw_gift_clubs
      where pc02 = '1'
        and record_type_code = 'AL'
        and pref_class_year >= '1993');
        commit;

insert into mack_ya_02
 (select id_number
    from a_dw_gift_clubs
   where pc03 = '1'
     and record_type_code = 'AL'
     and pref_class_year >= '1994');
commit;

insert into mack_ya_02
    (select id_number
       from a_dw_gift_clubs
      where pc04 = '1'
        and record_type_code = 'AL'      
        and pref_class_year >= '1995');
commit; 

insert into mack_ya_02
    (select id_number
       from a_dw_gift_clubs
      where pc05 = '1'
        and record_type_code = 'AL'      
        and pref_class_year >= '1996');
commit;

insert into mack_ya_02
    (select id_number
       from a_dw_gift_clubs
      where pc06 = '1'
        and record_type_code = 'AL'      
        and pref_class_year >= '1997');    
commit;

/*** The Number Erica Wants Is .... ***/
select count(distinct id_number) from mack_ya_02; 


/*** Membership in Randall society in each of the years: FY02, FY03, FY04, FY05 and FY06 ***/
select id_Number
from a_dw_pyramid
where year_of_giving = '2002'
and flag_alumni <> '1'
and id_number in
    (select id_number
       from a_dw_gift_clubs
      where pc02 = '1')
having sum(associated_amount + associated_amount_match + associated_amount_claim) between '1000' and '2499.99'
group by id_number;

select id_Number
from a_dw_pyramid
where year_of_giving = '2003'
and flag_alumni <> '1'
and id_number in
    (select id_number
       from a_dw_gift_clubs
      where pc03 = '1')
having sum(associated_amount + associated_amount_match + associated_amount_claim) between '1000' and '2499.99'
group by id_number;

select id_Number
from a_dw_pyramid
where year_of_giving = '2004'
and flag_alumni <> '1'
and id_number in
    (select id_number
       from a_dw_gift_clubs
      where pc04 = '1')
having sum(associated_amount + associated_amount_match + associated_amount_claim) between '1000' and '2499.99'
group by id_number;

select id_Number
from a_dw_pyramid
where year_of_giving = '2005'
and flag_alumni <> '1'
and id_number in
    (select id_number
       from a_dw_gift_clubs
      where pc05 = '1')
having sum(associated_amount + associated_amount_match + associated_amount_claim) between '1000' and '2499.99'
group by id_number;

select id_Number
from a_dw_pyramid
where year_of_giving = '2006'
and flag_alumni <> '1'
and id_number in
    (select id_number
       from a_dw_gift_clubs
      where pc06 = '1')
having sum(associated_amount + associated_amount_match + associated_amount_claim) between '1000' and '2499.99'
group by id_number;