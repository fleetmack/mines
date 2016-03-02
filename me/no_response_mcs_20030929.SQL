select id_number, pref_mail_name, p_phone_formatted, pref_name_sort
from a_dw_address_good
where p_phone_formatted > ' '
  and id_number in
    (select id_number from activity
where activity_code = 'C232'
and activity_participation_code NOT IN ('D','IX'))
order by pref_name_sort





