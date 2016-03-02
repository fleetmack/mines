/*** Those who are DNI or DNM who would otherwise be invited to MCS dinner ***/
select e.id_number, e.pref_mail_name, dw.ass_pref_mail_name
from entity e,
     a_dw_assignment_pm  dw
where dw.id_number(+) = e.id_number
and e.id_number IN
(select id_number
from a_std_3
where id_number IN (select id_number from mailing_list where mail_list_code = 'DNM')
or id_number IN (select id_number from mailing_list where mail_list_code = 'DNI')
MINUS
select id_number from a_temp_mcs_save_date_2012)