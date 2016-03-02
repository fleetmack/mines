/*** add these 3 to get a total number or letters that will be sent ***/
/*** you only need to have run the main departmental creation table program for this to work***/
select count(distinct id_number) as single_people
from a_temp_dept_mail
where flag_married = '0';

select count(distinct id_number) as married_joint_letter
from a_temp_dept_mail
where flag_married = '1'
and flag_married_same = '1'
order by name_sort;

select count(distinct id_number) as married_separate_letter
from a_temp_dept_mail
where flag_married = '1'
and flag_married_same = '0'
order by name_sort;


select *
from a_temp_dept_mail
where flag_married = '1'
and flag_married_same = '1'
order by name_sort;

select *
from a_temp_dept_mail
where flag_married = '1'
and flag_married_same = '0'
order by name_sort;

