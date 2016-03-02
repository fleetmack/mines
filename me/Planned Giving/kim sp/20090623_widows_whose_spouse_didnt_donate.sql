/*** Widows who haven't given to Mines ***/
select distinct e1.id_number, e1.pref_mail_name, e2.record_type_code, e1.record_status_code, e1.spouse_id_number, f1.spouse_id_number, e3.pref_mail_name, e3.pref_class_year
from entity_record_type   e2,
        entity     e1,
        entity     e3,
        former_spouse    f1
where e2.id_number = e1.id_number
and e3.id_number = f1.spouse_id_number
and f1.id_number = e1.id_number
and e1.record_status_code = 'A'
and e2.record_type_code = 'WI'
and f1.spouse_id_number  NOT IN
   (SELECT d.id_number FROM a_dw_pyramid  d   WHERE d.flag_alumni <> '1')
--and e1.id_number IN
   -- (SELECT d2.id_number FROM a_dw_pyramid d2 WHERE d2.flag_alumni <> '1')
order by e3.pref_class_year