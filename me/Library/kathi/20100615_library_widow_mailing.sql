
--Who the fuck is 51064?!

/***
1 - all Library donors for the past 5 years, all widows EXCEPT DNS through 9/30/2009, all Library Alumni EXCEPT CURRENT STUDENTS 
2 - widows who are DNS 
3 - all new widows, including DNS, from 10/01/2009 to 5/30/2010 
/*********** 1  ******************/
select distinct id_number
from a_dw_pyramid
where flag_alumni = 0
and flag_non_monthend = 0
and year_of_giving BETWEEN '2006' AND '2010'
and alloc IN
('B445',
'4752',
'4914',
'722',
'870',
'B7870',
'9255',
'751',
'4832',
'B5602',
'4178',
'9254',
'824',
'B4589',
'4510',
'B7492',
'B492',
'4011')
and id_number NOT IN
    (select id_number
        from entity_record_type
         where record_type_code = 'WI'
         and to_char(date_modified,'YYYYMMDD') <= '20090930'
         and id_number IN
            (select id_number from mailing_list where mail_list_code = 'DNS'))
and id_number NOT IN
    (select id_number from student_activity where student_activity_code = 'LA' and id_number in
        (select id_number from entity_record_type where record_type_code IN ('GS','ST')))
UNION
select id_number
        from entity_record_type
         where record_type_code = 'WI'
         and to_char(date_modified,'YYYYMMDD') <= '20090930'
         and id_number NOT IN
            (select id_number from mailing_list where mail_list_code = 'DNS')
        and id_number NOT IN 
          (select id_number from entity_record_type where record_type_code IN ('GS','ST'))
UNION
select id_number
from student_activity
where student_activity_code = 'LA'
and id_number NOT IN
    (select id_number from entity_record_type where record_type_code IN ('GS','ST'))
and id_number NOT IN
            (select id_number from mailing_list where mail_list_code = 'DNS')
MINUS
select id_number
from entity_record_type
where record_type_code = 'WI'
and to_char(date_modified,'YYYYMMDD') <= '20090930'
and id_number IN
            (select id_number from mailing_list where mail_list_code = 'DNS');

/**** 2 ****/
select id_number
from entity_record_type
where record_type_code = 'WI'
and to_char(date_modified,'YYYYMMDD') <= '20090930'
and id_number IN
            (select id_number from mailing_list where mail_list_code = 'DNS')
MINUS
(select distinct id_number
from a_dw_pyramid
where flag_alumni = 0
and flag_non_monthend = 0
and year_of_giving BETWEEN '2006' AND '2010'
and alloc IN
('B445',
'4752',
'4914',
'722',
'870',
'B7870',
'9255',
'751',
'4832',
'B5602',
'4178',
'9254',
'824',
'B4589',
'4510',
'B7492',
'B492',
'4011')
and id_number NOT IN
    (select id_number
        from entity_record_type
         where record_type_code = 'WI'
         and to_char(date_modified,'YYYYMMDD') <= '20090930'
         and id_number IN
            (select id_number from mailing_list where mail_list_code = 'DNS'))
and id_number NOT IN
    (select id_number from student_activity where student_activity_code = 'LA' and id_number in
        (select id_number from entity_record_type where record_type_code IN ('GS','ST')))
UNION
select id_number
        from entity_record_type
         where record_type_code = 'WI'
         and to_char(date_modified,'YYYYMMDD') <= '20090930'
         and id_number NOT IN
            (select id_number from mailing_list where mail_list_code = 'DNS')
        and id_number NOT IN 
          (select id_number from entity_record_type where record_type_code IN ('GS','ST'))
UNION
select id_number
from student_activity
where student_activity_code = 'LA'
and id_number NOT IN
    (select id_number from entity_record_type where record_type_code IN ('GS','ST'))
and id_number NOT IN
            (select id_number from mailing_list where mail_list_code = 'DNS'));

/*********** 3  ******************/
select id_number
from entity_record_type
where record_type_code = 'WI'
and to_char(date_modified,'YYYYMMDD') BETWEEN '20091001' AND '20100530'
MINUS
select id_number
from entity_record_type
where record_type_code = 'WI'
and to_char(date_modified,'YYYYMMDD') <= '20090930'
and id_number IN
            (select id_number from mailing_list where mail_list_code = 'DNS')
MINUS
(select distinct id_number
from a_dw_pyramid
where flag_alumni = 0
and flag_non_monthend = 0
and year_of_giving BETWEEN '2006' AND '2010'
and alloc IN
('B445',
'4752',
'4914',
'722',
'870',
'B7870',
'9255',
'751',
'4832',
'B5602',
'4178',
'9254',
'824',
'B4589',
'4510',
'B7492',
'B492',
'4011')
and id_number NOT IN
    (select id_number
        from entity_record_type
         where record_type_code = 'WI'
         and to_char(date_modified,'YYYYMMDD') <= '20090930'
         and id_number NOT IN
            (select id_number from mailing_list where mail_list_code = 'DNS'))
and id_number NOT IN
    (select id_number from student_activity where student_activity_code = 'LA' and id_number in
        (select id_number from entity_record_type where record_type_code IN ('GS','ST')))
UNION
select id_number
        from entity_record_type
         where record_type_code = 'WI'
         and to_char(date_modified,'YYYYMMDD') <= '20090930'
         and id_number NOT IN
            (select id_number from mailing_list where mail_list_code = 'DNS')
        and id_number NOT IN 
          (select id_number from entity_record_type where record_type_code IN ('GS','ST'))
UNION
select id_number
from student_activity
where student_activity_code = 'LA'
and id_number NOT IN
    (select id_number from entity_record_type where record_type_code IN ('GS','ST'))
and id_number NOT IN
            (select id_number from mailing_list where mail_list_code = 'DNS'));