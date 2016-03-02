/*** Marquez Hall Donors with their gift credit ***/
/*** Note this double-counts as couples have credit for each others' gifts ***/
select py.id_number, py.pref_mail_name, py.pref_name_sort, py.pref_class_year, py.person_or_org, py.flag_faculty_staff, sum(py.total_jnt_commitment),
         nvl((select ass.ass_pref_mail_name from a_dw_assignment_pm ass where ass.id_number = py.id_number),' ') pm,
        nvl((select dw.p_email_address from a_dw_address_good dw where dw.id_number = py.id_number),' ') p_email_address,
        nvl((select 'X' from dual where py.id_number IN (select id_number from entity_record_type where record_type_code IN ('ST','SF','GS'))),' ') student_ind
from a_dw_pyramid  py
where py.alloc IN ('5378','5478','B4556','9262')
group by py.id_number, py.pref_mail_name, py.pref_name_sort, py.pref_class_year, py.person_or_org, py.flag_faculty_staff;