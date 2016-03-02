/*** Count of alumni by dept broken down by level ***/
/*** Note:  This is powerbuilder report a_alumni_cnt_by_dept ***/
select tms.short_desc, dw.degree_level_desc, dw.major_code1_desc, count(distinct(dw.id_number))
from a_dw_degrees   dw,
        tms_dept_code   tms
where dw.institution_code = '1'
and dw.dept_code = tms.dept_code
and dw.degree_code <> '401'
and id_number in
    (select id_number from entity where record_type_code = 'AL')
group by tms.short_desc, dw.degree_level_desc, dw.major_code1_desc
order by tms.short_desc, dw.degree_level_desc, dw.major_code1_desc;




select *
from a_dw_degrees