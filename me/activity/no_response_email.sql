/*** No Response To Certain Activity ***/
select d.id_number, d.p_email_address
from activity   a,
     a_dw_address_good  d
where a.id_number       = d.id_number 
and a.activity_code = 'C268'
and a.activity_participation_code = 'I'
and d.p_email_address > ' '