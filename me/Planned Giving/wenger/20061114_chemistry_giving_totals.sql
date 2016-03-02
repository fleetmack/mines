/*** FY07 Chemistry Degree Alumnus' Donations ***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) as FY07
from a_dw_pyramid
where flag_alumni <> '1'
  and record_type_code = 'AL'
  and date_of_record between '20060701' and '20070630'
  and id_number in
    (select id_number
       from degrees
      where dept_code = 'CHEM');

/*** FY07 Individual Giving ***/
select id_number, pref_mail_name, pref_name_sort, sum(associated_amount + associated_amount_match + associated_amount_claim) as FY07_Sum
  from a_dw_pyramid
 where flag_alumni <> '1'
   and record_type_code = 'AL'
   and date_of_record between '20060701' and '20070630'
   and id_number in
        (select id_number
           from degrees
          where dept_code = 'CHEM')
having sum(associated_amount + associated_amount_match + associated_amount_claim) >= 1000
group by id_number, pref_mail_name, pref_name_sort;

/*** FY06 Chemistry Degree Alumnus' Donations ***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) as FY06
from a_dw_pyramid
where flag_alumni <> '1'
  and record_type_code = 'AL'
  and date_of_record between '20050701' and '20060630'
  and id_number in
    (select id_number
       from degrees
      where dept_code = 'CHEM');

/*** FY06 Individual Giving ***/
select id_number, pref_mail_name, pref_name_sort, sum(associated_amount + associated_amount_match + associated_amount_claim) as FY06_Sum
  from a_dw_pyramid
 where flag_alumni <> '1'
   and record_type_code = 'AL'
   and date_of_record between '20050701' and '20060630'
   and id_number in
        (select id_number
           from degrees
          where dept_code = 'CHEM')
having sum(associated_amount + associated_amount_match + associated_amount_claim) >= 1000
group by id_number, pref_mail_name, pref_name_sort;

/*** FY05 Chemistry Degree Alumnus' Donations ***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) as FY05
from a_dw_pyramid
where flag_alumni <> '1'
  and record_type_code = 'AL'
  and date_of_record between '20040701' and '20050630'
  and id_number in
    (select id_number
       from degrees
      where dept_code = 'CHEM');
      

/*** FY05 Individual Giving ***/
select id_number, pref_mail_name, pref_name_sort, sum(associated_amount + associated_amount_match + associated_amount_claim) as FY05_Sum
  from a_dw_pyramid
 where flag_alumni <> '1'
   and record_type_code = 'AL'
   and date_of_record between '20040701' and '20050630'
   and id_number in
        (select id_number
           from degrees
          where dept_code = 'CHEM')
having sum(associated_amount + associated_amount_match + associated_amount_claim) >= 1000
group by id_number, pref_mail_name, pref_name_sort;

/***Total gifts from people with chemistry degrees for this year and the 
last two fiscal years.
 I’d like total $ plus number of donors. 
 Also, please provide detail on any gifts of $1000 or more—name of donor and amount of gift.
 ***/