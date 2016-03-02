select m.id_number, ass.pref_mail_name, ass.ass_pref_name_sort,  m.mail_list_code, m.mail_list_type_code, m.xcomment 
from mailing_list       m,
     a_dw_assignment    ass
where ass.id_number = m.id_number
  and m.mail_list_code = 'DNS'
  and m.mail_list_type_code <> 'PHN'
order by ass.ass_pref_name_sort
