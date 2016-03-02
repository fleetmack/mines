/*** Parents of Graduating Undergrads ***/
/*** Only who are donors ***/
select distinct(dw.id_number)
from a_dw_pyramid  dw,   ids  i
where dw.id_number = i.id_number
and dw.id_number IN (select ep.id_number from entity_record_type ep where ep.record_type_code = 'PA')
and dw.flag_alumni <> '1'
and dw.flag_non_monthend <> '1'
and i.ids_type_code = 'CI1'
and i.other_id IN
(select i2.other_id
     from ids  i2
where i2.ids_type_code = 'CID'
and i2.id_number IN
(select ert.id_number
from entity_record_type ert
where ert.record_type_code = 'ST'
and ert.id_number not in
    (select e.id_number from entity e where e.record_type_code = 'AL')
and ert.id_number in
    (select dwd.id_number from a_dw_degrees dwd where dwd.grad_dt = 'XXXXXXXX')
));