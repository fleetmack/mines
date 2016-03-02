/***
One with current students 
another for the new alums.
I just need address, email, first & last name, Auth ID.
***/

/*** All students who are not alumni ***/
SELECT id_number
FROM entity_record_type
WHERE record_type_code IN ('ST','GS')
AND id_number NOT IN
    (select id_number from entity_record_type where record_type_code = 'AL');

/*** Everyone who just graduated***/
select distinct id_number
from degrees
where grad_dt = '20100514'
and institution_code = '1';

/*** Everyone who just graduated who didn't already have a degree ***/
select distinct id_number
from degrees
where grad_dt = '20100514'
and institution_code = '1'
and id_number NOT IN
    (select id_number from degrees
      where institution_code = '1' and degree_code <> '401' and degree_year < '2010');

/*** Everyone who just graduated who already have a degree ***/
select distinct id_number
from degrees
where grad_dt = '20100514'
and institution_code = '1'
and id_number IN
    (select id_number from degrees
      where institution_code = '1' and degree_code <> '401' and degree_year < '2010');