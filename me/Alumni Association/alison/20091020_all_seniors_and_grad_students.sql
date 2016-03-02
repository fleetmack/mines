/*** Everyone Classified as a Senior or Grad Student in Fall 2009 ***/
select i.id_number, i.other_id, e.pref_mail_name, e.pref_name_sort
from ids    i,   entity   e
where i.id_number(+) = e.id_number
   and i.ids_type_code = 'CID'
   and e.record_status_code = 'A'
   and (
    e.id_number IN (select ert.id_number from entity_record_type ert where ert.record_type_code IN ('ST') and pref_class_year = '2010')
    OR
    e.id_number IN (select ert2.id_number from entity_record_type ert2 where ert2.record_type_code IN ('GS') and pref_class_year = '2011'))