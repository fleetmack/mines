/*** Undergrad Kids Graduating This Semester who should receive mines mag ***/
select dw.id_number
from a_dw_degrees dw
where dw.grad_dt = 'XXXXXXXX'
and dw.id_number IN
    (select ert1.id_number from entity_record_type ert1 where ert1.record_type_code = 'ST')
and dw.id_number NOT IN
    (select mm.id_number
        from a_mines_magazine mm
     where mm.flag_mines_mag NOT IN (0,3)
        and mm.p_flag_tanfc = 0
        and (mm.p_flag_foreign = 1 or mm.p_zipcode <> ' '));