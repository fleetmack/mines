/*** 1 Degree Stats - RUN FOR EACH DEPARTMENT TO GET number of those with 1 degree for each department ***/
select DISTINCT ID_NUMBER
from a_temp_dept_mail
where dept_code = 'PHY'
  and flag_married = 0

/*** Calculates Married Couples With Same Dept Degree ***/
select distinct id_number
from a_temp_dept_mail   j1
where j1.flag_married = 1
and j1.dept_code = 'PHY'
and  j1.dept_code in
    (select j2.dept_code
       from a_temp_dept_mail    j2
      where j1.spouse_id = j2.id_number)
      
      
/*** Calculates Single People within a couples with a unique degree ***/
select distinct id_number
from a_temp_dept_mail   j1
where j1.flag_married = 1
and  j1.dept_code = 'CHEM'
and  j1.dept_code not in
    (select j2.dept_code
       from a_temp_dept_mail    j2
      where j1.spouse_id = j2.id_number)
      

/*** ADD THIS LINE IF YOU WANT TO KNOW THE NUMBER WHO WERE ATHLETES***/
AND flag_sport = 1

/*** Number of Athletes with 2, 3, and 4 degrees - change the 4 in the temp table to 3 and 2 to get those numbers respectively ***/
select distinct id_number
from a_temp_jrod_4_degrees
where id_number in
    (select id_number from a_temp_dept_mail where flag_sport = '1')


select id_number
  from a_temp_dept_mail
 where flag_married = 1
   and dept_code in
        (select dept_code
           from a_temp_dept_mail
          where 