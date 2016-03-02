/***
We are getting ready to send out the Denver Holiday Party invitations.  The party is on December 14.  
Based on what we’ve done in the past, and after tweaking it a bit, we’d like to include the following groups of people on our mailing list:
***/

--All Alumni with Zip Code range of 80000-80505
select id_number
from a_dw_address_good
where record_type_code = 'AL'
and p_zipcode BETWEEN '80000-0000' AND '80505-9999'
--All parents of current students
UNION
select id_number
from a_dw_address_good
where id_number IN
    (select id_number
      from entity_record_type
        where record_type_code = 'PA')
--Anyone that has given in the last 2 years
UNION
select id_number
   from a_dw_address_good
 where id_number in
        (select id_number
            from a_dw_pyramid
            where flag_non_monthend <> 1
            and year_of_giving >= '2010')
--Anyone that was a CURRENT member of the CSMAA in the last 2 years
UNION
select id_number
   from a_dw_address_good
where id_number in
        (select id_number
        from a_dw_memb
        where memb_year IN ('2010','2011'))
--Anyone that is a Life or Honorary Member of the CSMAA
UNION
select id_number
    from a_dw_address_good
where id_number in
        (select id_number
        from a_dw_memb
        where memb_type_code IN ('H','L'))
--Members of the Heritage Society
UNION
 select id_number
   from a_dw_address_good
where id_number in
        (select id_number from a_dw_gift_clubs where heritage_society = '1')
--Members of the Mines Century Society
UNION
select id_number
from a_dw_address_good
where id_number IN
    (select id_number from a_dw_gift_clubs where flag_cs = '1')
--CSMAA Board of Directors
--BOT members
--Foundation BOG members
--Members of the Mines Executive Committee
UNION
select distinct id_number
from a_dw_address_good
where id_number IN
    (select id_number from committee where committee_code IN
                                ('AABOD', --CSMAA Board of Directors
                                    'BOT', -- Board of Trustees
                                    'FBOG','FBOGA','FBOGD','FBOGE','FBOGG','FBOGN', --Board of Governors
                                    'MEC') --Mines Executive Committee
      and committee_status_code = 'A')
--Corporate Partners – need input from Kim Saenger on who to include here (Per kim - there are none, leave this blank 
/**********************************************************************/
--Past Presidents 
UNION
select id_number
from a_dw_address_good
where id_number in
('0000028839', --bickart
'0000020113', --trefny
'0000013553', --ansell
'0000008240') --mcbride
--Emeritus Professors
UNION
select id_number
from a_dw_address_good
where id_number IN
        (select id_number
        from a_dw_jobs
        where lower(job_title) like '%emeritus%'
        and employer_id_number IN ('0000020910','0000017894','0000019431','0000034805','0000018591'))
--Past Medalists/Honorary Degree recipients
UNION
select id_number
from a_dw_address_good
where id_number IN
        (select id_number
        from awards_and_honors
        where awd_honor_code IN
            (select awd_honor_code from tms_awd_honor where award_honor_group_code IN ('MED','HON')))
--Widows of Medalists
UNION
select id_number
from a_dw_address_good
where id_number IN 
(SELECT    id_number
      FROM    entity_record_type
     WHERE    record_type_code = 'WI'
          AND id_number IN
            (select id_number
                from former_spouse
                where spouse_id_number IN
                 (select id_number
                      from awards_and_honors
                    where awd_honor_code IN
                        (select awd_honor_code from tms_awd_honor where award_honor_group_code = 'MED'))))
--People who are stewarded on a named endowment
UNION
SELECT DISTINCT id_number
FROM a_stew_main_9
--Visiting Committee members 
UNION
select id_number
from a_dw_address_good
where id_number in
        (select id_number
        from committee  
        where committee_code in ('VAD','VCEP','VCGC','VCIF','VEB','VENG','VESE','VGE','VGL','VGP','VHON','VHUM','VLAI','VLIB','VME','VMIN','VML','VMME','VMS','VMSC','VPE','VPH','VPHY')
        and committee_status_code = 'A')
--OMIT Do_Not_Mail, Do_Not_Invite, and those outside of Denver area
minus
select id_number
from a_dw_address_good
where flag_omit_from_mail = 1
minus
select id_number
from mailing_list
where mail_list_code = 'DNI'
minus
select id_number
from a_dw_address_good
where p_zipcode < '80000-0000'
or p_zipcode >= '80506-0000';