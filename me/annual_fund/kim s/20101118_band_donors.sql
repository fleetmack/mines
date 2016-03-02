/*** Parents or Past Parents who have given to band at all ***/
select *
from a_dw_pyramid
where alloc = '4347'
and id_number in
    (select id_number from entity_record_type where record_type_code IN ('PA','PX'));

/*** Parents of band students who have given to anything ***/
select *
from a_dw_pyramid
where id_number in
    (select id_number from entity_record_type
      where record_type_code = 'PA'
        and id_number in
            (select id_number from ids where ids_type_code = 'CI1' and other_id IN
                (select other_id from ids where ids_type_code = 'CID' and id_number in
                    (select id_number from entity_record_type where record_type_code IN ('ST','GS') and id_number in
                        (select id_number from student_activity where student_activity_code = 'BAND')))));

/*** Current parents of band students who have given to anything ***/
select *
from a_dw_pyramid
where alloc = '4347'
and  id_number in
    (select id_number from entity_record_type
      where record_type_code = 'PA'
        and id_number in
            (select id_number from ids where ids_type_code = 'CI1' and other_id IN
                (select other_id from ids where ids_type_code = 'CID' and id_number in
                    (select id_number from entity_record_type where record_type_code IN ('ST','GS') and id_number in
                        (select id_number from student_activity where student_activity_code = 'BAND')))));

/*** Parents of current band members ***/
select *
from entity
where id_number in
    (select id_number from entity_record_type
      where record_type_code = 'PA'
        and id_number in
            (select id_number from ids where ids_type_code = 'CI1' and other_id IN
                (select other_id from ids where ids_type_code = 'CID' and id_number in
                    (select id_number from entity_record_type where record_type_code IN ('ST','GS') and id_number in
                        (select id_number from student_activity where student_activity_code = 'BAND')))));