select ep.id_number parent_id, ep.pref_mail_name parent_name, es.pref_mail_name student_name, es.pref_name_sort, nvl(ad.p_city,' '), nvl(ad.p_state_code,' '), nvl(ad.p_zipcode,' '), nvl(ad.p_email_address,' '),max(s.sport_code)
from entity   ep,
        entity   es,
        ids        pi,
        ids        si,
        entity_record_type  ertp,
        entity_record_type  erts,
        sport     s,
        a_dw_address_good  ad
WHERE ep.id_number = ertp.id_number
     AND ep.id_number = pi.id_number
     AND ad.id_number(+) = ep.id_number
     AND pi.other_id = si.other_id
     AND si.id_number = s.id_number
     AND s.id_number = erts.id_number
     AND es.id_number = s.id_number
and ertp.record_type_code = 'PA'
and erts.record_type_code IN ('ST','GS')
and s.sport_code IN ('TF','CC')
and pi.ids_type_code = 'CI1'
and si.ids_type_code = 'CID'
group by ep.id_number, ep.pref_mail_name, es.pref_mail_name, es.pref_name_sort, ad.p_city, ad.p_state_code, ad.p_zipcode, ad.p_email_address
order by es.pref_name_sort;