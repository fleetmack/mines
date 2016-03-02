/***Creates and Edits a temp table to show los angeles people who gave $250 or more in one of the past 3 years ***/

create table a_temp_wenger
as
--insert into a_temp_wenger 
(
select id_number, pref_mail_name, pref_name_sort, pref_class_year, sum(associated_amount + associated_amount_match + associated_amount_claim) as giving
  from a_dw_pyramid
 where date_of_record between '20030701' and '20040630'
   and flag_alumni = 0
   and flag_behalf = 0
   and person_or_org = 'P'
  -- and id_number NOT IN
  -- (select id_number from a_temp_wenger)
   and id_number in
    (select id_number
       from a_dw_address_good
      where (p_zipcode between '90000-0000' and '91899-9999'
         or  p_zipcode between '92300-0000' and '92899-9999'
         or  p_zipcode between '93400-0000' and '93499-9999'))
group by id_number, pref_mail_name, pref_name_sort, pref_class_year 
having sum(associated_amount + associated_amount_match + associated_amount_claim) >= 250)

/***drop table a_temp_wenger;
commit;
/
  
