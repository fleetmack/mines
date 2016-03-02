/*** HS members with their birth date (if we have it) ***/
select e1.id_number, e1.pref_mail_name, e1.pref_name_sort, decode(e1.birth_dt,'00000000',' ',e1.birth_dt)
from a_dw_gift_clubs        dw,
        entity     e1,
        entity     e2
where e1.id_number(+) = dw.id_number
and e2.id_number = dw.id_number
and e2.record_status_code = 'A'
and dw.heritage_society = '1'
order by e1.pref_name_sort;


select count(*)
from a_dw_gift_clubs
where heritage_society  = '1'
and id_number in
    (select id_number from entity where record_status_code = 'A')
