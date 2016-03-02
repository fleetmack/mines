 select a.p_cityline,
a.p_foreign_cityzip,
a.p_street1,
a.p_street2,
m.id_number, 
m.start_dt, 
m.stop_dt,
e.pref_mail_name,
e.pref_name_sort,
ass.ass_pref_name_sort,
ass.ass_pref_mail_name,
ass.ass_type_desc
from mailing_list   m,
entity              e,
a_dw_address_good   a,
a_dw_assignment	  ass
where m.id_number = e.id_number
and   e.id_number = a.id_number
and   a.id_number = ass.id_number 
and m.mail_list_code = 'DNS'
and m.id_number in
(select id_number from a_dw_assignment)
and m.id_number not in
(select id_number from entity where person_or_org = 'O')
order by ass.ass_pref_name_sort, e.pref_name_sort

