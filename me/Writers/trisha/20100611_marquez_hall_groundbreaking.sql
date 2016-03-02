/***
Hi Bryan – sorry to barrage you with requests! When you get a chance, we’d like to start putting together our list of invitees to the Marquez Hall groundbreaking event (10/8), to include at least the following to start:
Ø       All donors to Marquez Hall ever (individual, corporate and foundation)
Ø       All donors to petroleum engineering dept, this year and last (individual, corporate and foundation) …. Could we maybe see how just Colorado PE donor #s compare with all FY09 and FY10 PE donors? I’m not sure whether to extend the invite outside Colorado.
Ø       Current and former FBOG, BOT, CSMAA board, past presidents, Investment Committee
Ø       Local emeritus faculty
***/
drop table temp_marquez_hall_gb;
commit;

create table temp_marquez_hall_gb
(id_number varchar2(10));
commit;

--marquez hall gifts
insert into temp_marquez_hall_gb
(select distinct id_number
from a_dw_pyramid
where alloc IN ('5378','5478'));
commit;

--petroleum department fund
insert into temp_marquez_hall_gb
(select distinct id_number
from a_dw_pyramid
where year_of_giving IN ('2009','2010')
and alloc = '4641'
/************************************************************************* NOTE: next part in only if you decide to have only CO people in this segment *****
and id_number in
    (select id_number from a_dw_address_good where p_state_code = 'CO')
/**************************************************************************************************************************************************/
and id_number not in
    (select id_number from temp_marquez_hall_gb));
commit;


/*** Add current and former of these groups 
--FBOG
--BOT
--CSMAA Board
--Past Presidents
--Investment Committee
***/
insert into temp_marquez_hall_gb
(select distinct id_number
from committee
where committee_code IN
    ('AABOD', --CSMAA Board of Directors
     'BOT', -- Board of Trustees
     'FBOG','FBOGA','FBOGD','FBOGE','FBOGG','FBOGN', --Board of Governors
     'FBOGI','MFIC')
and id_number not in
    (select id_number from temp_marquez_hall_gb)); --Investing Committee
commit;

/*** Add Past Presidents ***/
insert into temp_marquez_hall_gb
(select id_number
from entity
where id_number IN
('0000020113', --Scoggins
'0000020113', --Trefny
'0000028839', --bickart
'0000013553', --ansell
'0000008240') --mcbride
and id_number not in
    (select id_number from temp_marquez_hall_gb));
commit;

/*** Add emiritus professors ***/
insert into temp_marquez_hall_gb
(select id_number
from a_dw_jobs
where lower(job_title) like '%emeritus%'
and employer_name1 like '%CSM%'
and record_status_code = 'A'
and id_number in
    (select id_number from a_dw_address_good where p_state_code = 'CO')
and id_number not in
    (select id_number from temp_marquez_hall_gb));
commit;

delete from temp_marquez_hall_gb
where id_number in
    (select id_number from mailing_list where mail_list_code = 'DNI');
commit;

select id_number
from temp_marquez_hall_gb;