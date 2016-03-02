/*** Deceased HS ***/
select id_number, pref_mail_name
from entity
where record_status_code <> 'A'
and id_number in
    (select id_number
from a_dw_gift_clubs
where heritage_society = 1);


select id_number, pref_mail_name
from entity
where id_number in
    (select id_number
       from a_dw_gift_clubs
    where heritage_society = 1
        and flag_anon_don = 1);
