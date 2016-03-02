/*** trying to find a 750 count for a PG mailing ***/
select id_number
--count(id_number)
from a_dw_address_good
where pref_class_year between '1954' and '1960'
and record_type_code = 'AL'
and flag_dns <> '1'
and flag_omit_from_mail <> '1'
and id_number not in
    (select id_number
    from a_dw_gift_clubs
    where heritage_society = '1')