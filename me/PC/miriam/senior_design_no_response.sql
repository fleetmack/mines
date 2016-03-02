/*** Non response to senior design -- Miriam wants to send an email to them ***/
select a.id_number, g.pref_mail_name, g.pref_name_sort, g.p_cityline, g.p_state_code, g.p_zipcode, g.p_email_address, g.b_email_address, g.h_email_address
from activity   a,
  a_dw_address_good  g
where g.id_number   = a.id_number
and a.activity_code = 'C267'
and a.activity_participation_code = 'I'
order by g.p_state_code
