/*** Invite Email for No Responses to Track Dedication activity ***/
select id_number, pref_mail_name, pref_name_sort, p_email_address
from a_dw_address_good
where p_email_address > ' '
and id_number IN
(select id_number
from activity
where activity_code = 'C341'
and activity_participation_code = 'I')
order by pref_name_sort;