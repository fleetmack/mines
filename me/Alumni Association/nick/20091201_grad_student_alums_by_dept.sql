/**** Mines Mag -- Grad Student Alums and their Departments ***/
select t.short_desc, count(*)
from a_dw_degree_count dw, tms_dept_code t
where t.dept_code = dw.dept_code1
and dw.id_number in
(select ert.id_number
from entity_record_type   ert
where ert.record_type_code = 'GS'
and ert.id_number  IN
    (select ert2.id_number from entity_record_type ert2 where ert2.record_type_code = 'AL'))
group by t.short_desc
order by t.short_desc