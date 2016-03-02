/***
1 - Track and field and cross country alumni BUT NOT football alumni
2 - Donors to track and field complex who are not alumni (there will be just a couple of people on this list) 
3 - Football alumni BUT NOT tf/cc alumni
4 - Donors to football field project who are not alumni (not many people on this list either) 
5 - both a football alumni and a tf/cc alumni
6 - Board of Governors, Board of Trustees, CSMAA board, president’s executive committee 
7 - Alumni who are not Track/CC alumni who donated to the TF complex
 
All lists pertain to events on August 28. Lists 1 and 2 are for the track & field reunion/dedication. Lists 3 and 4 are for the football reunion/dedication. List 5 is for dignitaries who we want to invite to both the track & field and football field dedications.
***/
drop table temp_erica;
commit;

create table temp_erica
as
(
/*** 1 ***/
select distinct id_number
from a_dw_address_good
where record_type_code = 'AL'
and id_number IN
    (select id_number
       from sport
    where sport_code IN ('TF','CC'))
MINUS
select id_number
from mailing_list
where mail_list_code IN ('DNM','DNI')
MINUS
select id_number
from sport
where sport_code = 'FB'
);
commit;

/*** 2 ***/
insert into temp_erica
(
select distinct id_number
from a_dw_address_good
where record_type_code <> 'AL'
and id_number in
    (select id_number
       from a_dw_pyramid
     where alloc = '1500')
MINUS
select id_number
from mailing_list
where mail_list_code IN ('DNM','DNI')
);

/*** 3 ***/
insert into temp_erica
(
select distinct id_number
from a_dw_address_good
where record_type_code = 'AL'
and id_number IN
    (select id_number
       from sport
    where sport_code IN ('FB'))
MINUS
select id_number
from mailing_list
where mail_list_code IN ('DNM','DNI')
MINUS
select id_number
from sport
where sport_code IN ('CC','TF')
);

/*** 4 ***/
insert into temp_erica
(
select distinct id_number
from a_dw_address_good
where record_type_code <> 'AL'
and id_number in
    (select id_number
       from a_dw_pyramid
     where alloc IN ('B1502','4962'))
MINUS
select id_number
from mailing_list
where mail_list_code IN ('DNM','DNI')
);

/*** 5 ***/
insert into temp_erica
(
select distinct id_number
from a_dw_address_good
where record_type_code = 'AL'
and id_number in
    (select id_number from sport where sport_code = 'FB')
and id_number in
    (select id_number from sport where sport_code IN ('TF','CC'))
);

/*** 6 -  Board of Governors, Board of Trustees, CSMAA board, president’s executive committee  ***/
insert into temp_erica
(
select distinct id_number
from a_dw_address_good
where id_number IN
    (select id_number from committee where committee_code IN
                                ('AABOD', --CSMAA Board of Directors
                                    'BOT', -- Board of Trustees
                                    'FBOG','FBOGA','FBOGD','FBOGE','FBOGG','FBOGN', --Board of Governors
                                    'FBOGI','MEC')
      and committee_status_code = 'A')
MINUS
select id_number
from mailing_list
where mail_list_code IN ('DNM','DNI'));
commit;

/****
select distinct id_number
from a_dw_address_good
where id_number IN
    (select id_number from committee where committee_code IN
                                ('AABOD', --CSMAA Board of Directors
                                    'BOT', -- Board of Trustees
                                    'FBOG','FBOGA','FBOGD','FBOGE','FBOGG','FBOGN', --Board of Governors
                                    'FBOGI','MEC')
      and committee_status_code = 'A')
and id_number IN
    (select id_number from temp_erica);
***/
insert into temp_erica
(
select distinct id_number
from a_dw_address_good
where record_type_code = 'AL'
and id_number in
    (select id_number
       from a_dw_pyramid
     where alloc = '1500')
MINUS
select id_number
from mailing_list
where mail_list_code IN ('DNM','DNI')
MINUS
select id_number
from temp_erica)
;


select distinct id_number
from a_dw_address_good
where record_type_code = 'AL'
and id_number in
    (select id_number
       from a_dw_pyramid
     where alloc IN ('B1502','4962'))
MINUS
select id_number
from mailing_list
where mail_list_code IN ('DNM','DNI')
MINUS
select id_number
from temp_erica