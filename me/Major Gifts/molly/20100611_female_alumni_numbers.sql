--select * from entity where id_number = '0000033568'
/*** Total number living alumni ****/
select count(*) living_alumni
from entity
where record_status_code = 'A'
and record_type_code = 'AL';


/*** Total number of living female alumni ***/
select count(*) living_female_alumni
from entity
where record_status_code = 'A'
and record_type_code = 'AL'
and gender_code = 'F';

 
/*** Total number of living alumni class years 1990-2009 (last 10 years) ***/
select count(*) living_alumni_since_1990
from entity
where record_status_code = 'A'
and record_type_code = 'AL'
and pref_class_year >= '1990';

/*** Total number of living female alumni class years 1990 – 2009 ***/
select count(*) living_female_alumn_since_1990
from entity
where record_status_code = 'A'
and record_type_code = 'AL'
and gender_code = 'F'
and pref_class_year >= '1990';