/*** Creates list for Nilmini for her PC prospects of any given area, change zip code range or change it to a state code to get
a certain area.  Modify as needed, but you should be able to just modify each section in that same way.   Put the bottom commented-code into
powerbuilder, then add Address Good, 5 Year Giving Summary, and Assignments Sub reports ***/



/*** Create and Insert FY 03 pc prospects ***/
create table a_temp_nilmini_blah as 
(
--insert into a_temp_nilmini_blah
select id_number
from a_dw_pyramid
where date_of_record BETWEEN '20020701' and '20030630'
and person_or_org = 'P'
and flag_alumni = 0
and id_number in
    (select id_number
       from a_dw_address_good
      where p_state_code = 'FL')
having sum(associated_amount + associated_amount_match + associated_amount_claim) >= 500
group by id_number)
commit;
/

/*** Add FY 02 pc prospects***/
insert into a_temp_nilmini_blah
select id_number
from a_dw_pyramid
where date_of_record BETWEEN '20010701' and '20020630'
and person_or_org = 'P'
and flag_alumni = 0
and id_number in
    (select id_number
       from a_dw_address_good
      where p_state_code = 'FL')
having sum(associated_amount + associated_amount_match + associated_amount_claim) >= 500
group by id_number
commit;
/

/*** Add FY 01 pc prospects***/
insert into a_temp_nilmini_blah
select id_number
from a_dw_pyramid
where date_of_record BETWEEN '20000701' and '20010630'
and person_or_org = 'P'
and flag_alumni = 0
and id_number in
    (select id_number
       from a_dw_address_good
      where p_state_code = 'FL')
having sum(associated_amount + associated_amount_match + associated_amount_claim) >= 500
group by id_number
commit;
/


/*** add pc01,pc02, and pc03 members***/
insert into a_temp_nilmini_blah
select id_number
from a_dw_gift_clubs
where p_state_code = 'FL'
and ( pc01 = 1
or    pc02 = 1
or    pc03 = 1);
commit;
/


/*** tells you total distinct people in temp table***/
select distinct id_number from a_temp_nilmini_blah


/***drops temp table***/
drop table a_temp_nilmini_blah;
commit;
/


/***select distinct nil.id_number, n.pref_name, n.name_sort, a.pref_class_year
from a_temp_nilmini_blah    nil,
     name                   n,
     a_dw_address_good      a
where nil.id_number         = n.id_number
  and a.id_number           = nil.id_number
  and n.name_type_code = '00'


