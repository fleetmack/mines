/*** tertiary planned giving gg&a prospects with ......
largest gift,
number of gifts,
cityline,
name,
id_number,
max alphabetical degree ***/



/**** create temp table ****/
create table temp_wenger_blah
as
(select id_number
from degrees
where id_number in
    (select id_number
    from demographic_profile
    where dp_rating_code = 'T')
  and id_number in
    (select id_number
       from a_dw_address_good
      where record_type_code = 'AL'));
      commit;
      /

/*** remove dups....***/
create table temp_wenger_blah_2 as
(select distinct id_number from temp_wenger_blah);
commit;
/

/*** drop first table ***/
drop table temp_wenger_blah;
commit;
/

/*** add wenger's fields ***/
alter table temp_wenger_blah_2
add pref_mail_name  varchar2(80)  null;

alter table temp_wenger_blah_2
add pref_name_sort  varchar2(80)  null;

alter table temp_wenger_blah_2
add p_cityline varchar2(80) null;

alter table temp_wenger_blah_2
add pref_class_year varchar2(4)  null;

alter table temp_wenger_blah_2
add degree_type varchar2(8)     null;

alter table temp_wenger_blah_2
add num_of_gifts   varchar2(3) null;

alter table temp_wenger_blah_2
add largest_gift varchar2(8) null;

/*** update ***/
update temp_wenger_blah_2   t
set t.pref_mail_name =
    (select a.pref_mail_name
       from a_dw_address_good   a
      where a.id_number = t.id_number)
      
/*** update ***/
update temp_wenger_blah_2   t
set t.pref_name_sort =
    (select a.pref_name_sort
       from a_dw_address_good   a
      where a.id_number = t.id_number)
      
/*** update ***/
update temp_wenger_blah_2   t
set t.p_cityline =  
    (select a.p_cityline
       from a_dw_address_good   a
      where t.id_number = a.id_number)
      
/*** update ***/
update temp_wenger_blah_2   t
set t.pref_class_year =
    (select a.pref_class_year
       from a_dw_address_good   a
      where a.id_number = t.id_number)
commit;
/

/*** create degree_type temp table ***/
create table temp_wenger_blah_3
as
    (select d.id_number, max(d.dept_code) as dept_code
       from degrees d,
            temp_wenger_blah_2  t
      where d.id_number         = t.id_number
      group by d.id_number)
      
/**** update temp_wenger_2 dept_code ***/
update temp_wenger_blah_2   t1
set t1.degree_type = 
    (select t2.dept_code
    from temp_wenger_blah_3 t2
   where t1.id_number   = t2.id_number);
commit;


/*** drop table ***/
drop table temp_wenger_blah_3;
commit;
/

/*** yet another temp table for # of gifts ***/
create table temp_wenger_blah_4    
as
(select p.id_number, p.associated_amount, p.receipt, p.associated_amount_match, p.associated_amount_claim
from a_dw_pyramid       p,
     temp_wenger_blah_2     t2
where p.id_number = t2.id_number
and p.transaction_type = 'GF'
and p.flag_alumni <> '1')

/*** create another temp then drop 4 and 5 ***/
create table temp_wenger_blah_5
as
(select id_number, count(receipt) as num_of_gifts
from temp_wenger_blah_4
group by id_number);
commit;
/

/*** Update main table ***/
update temp_wenger_blah_2   t2
set t2.num_of_gifts =
    (select t5.num_of_gifts
       from temp_wenger_blah_5  t5
      where t2.id_number        = t5.id_number);
commit;
/

/*** update nulls ***/
update temp_wenger_blah_2   
set num_of_gifts = 0
where num_of_gifts is null;
commit;
/

/*** drop tables ***/
drop table temp_wenger_blah_4;
drop table temp_wenger_blah_5;
commit;
/

/*** one more to go ****/
create table temp_wenger_blah_7
as
(select p.id_number, max(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) as largest
from a_dw_pyramid   p,
temp_wenger_blah_2  t2
where p.id_number   = t2.id_number
and p.transaction_type = 'GF'
and p.flag_alumni <> '1'
group by p.id_number);
commit;

/*** update original ***/
update temp_wenger_blah_2   t2
set t2.largest_gift =
(select t7.largest
from temp_wenger_blah_7     t7
where t2.id_number  = t7.id_number);
commit;

/*** update nulls ***/
update temp_wenger_blah_2
set largest_gift = 0
where largest_gift is null;
commit;

/*** drop ***/
drop table temp_wenger_blah_7;
commit;


select * from temp_wenger_blah_2

