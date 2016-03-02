/*** Employees and Info ***/
--Here are the entity numbers. Kim would like name, graduation year, major, , business title, business email and business phone # for current employees.
select dwj.id_number, 
dwj.pref_mail_name, 
dwj.pref_name_sort,  
dwj.employer_name1, 
deg.degrees, 
dwj.job_title, 
DECODE(dwa.b_flag_no_email,'1',' ',dwa.b_email_address), 
DECODE(dwa.flag_dnp,'1',' ',dwa.b_phone_formatted)
from a_dw_jobs  dwj,  
a_dw_address_good  dwa, 
a_dw_degree_count  deg
where dwa.id_number(+) = dwj.id_number
and deg.id_number(+) = dwj.id_number
and dwj.employ_relat_code = 'PE'
and dwj.job_status_code = 'C'
and dwj.record_type_code = 'AL'
and  dwj.employer_id_number IN
('0000037483',
'0000019460',
'0000019169',
'0000018171',
'0000019118',
'0000025578',
'0000018188',
'0000018219',
'0000037620',
'0000018213',
'0000034406',
'0000038563',
'0000018116',
'0000033724',
'0000034602',
'0000019578',
'0000019218 ',
'0000028366',
'0000019192');