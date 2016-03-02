select dw.id_number, dw.pref_mail_name, dw.pref_name_sort, dw.p_phone_formatted, dw.p_cityline,
    nvl((select a.ass_pref_mail_name from a_dw_assignment_pm a where a.id_number = e.id_number),' ') prospect_mgr,
    e.spouse_Name, 
    nvl((select e2.pref_mail_name from entity e2 where e2.id_number = e.spouse_id_number),' ') spouse_name
from a_dw_address_good   dw,
        entity   e
where dw.id_number(+) = e.id_number
and dw.record_type_code = 'AL'
and dw.p_state_code = 'TX'
and dw.id_number IN
    (select id_number from activity where activity_code IN ('A460','A372','A256') and activity_participation_code IN ('IA','IX'))
and dw.id_number NOT IN
        (select id_number from activity where activity_code = 'H3')
and dw.id_number NOT IN
    (select id_number from mailing_list where mail_list_code IN ('DNP','DNI'))
and dw.p_phone_formatted > ' '
order by dw.pref_name_sort