--gives counts by department of currently enrolled grad students who are also alums
select primary_1st_department_desc, count(*)
from  temp_mack_all_students
where student_classification = 'GR'
and id_number IN
    (select id_number from entity_record_type where record_type_code = 'AL')
group by primary_1st_department_desc
order by primary_1st_department_desc;

--displays total table of all currently enrolled grad students who are alums
select *
from  temp_mack_all_students
where student_classification = 'GR'
and id_number IN
    (select id_number from entity_record_type where record_type_code = 'AL')
order by primary_1st_department_desc;