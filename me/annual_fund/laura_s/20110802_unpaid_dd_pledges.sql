/*** Unpaid DiggerDial Pledges ***/
select distinct id_number, receipt, pref_mail_name, pref_name_sort, date_of_record, prim_pledge_original_amount, ass_pref_mail_name
from a_rem_3
where substr(appeal_code,1,2) = 'PP'
and paid = 0
order by date_of_record;