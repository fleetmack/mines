/*** Thanksgiving List ***/
/***
h.	CFR Mines magazine mailing list
***/

--a.	assigned prospects 
select id_number
  from a_dw_assignment_pm
 where ass_active_ind = 'Y'
   and person_or_org = 'P'
   and ass_id_number <> '0000057383'
UNION
--b.	stewarded non-assigned individuals who have ever made a gift
select id_number
  from a_stew_main_9
 where person_or_org = 'P'
   and id_number IN
    (select id_number from a_dw_pyramid where flag_alumni <> '1' and flag_non_monthend <> '1')
   and id_number NOT IN
    (select id_number from a_dw_assignment_pm where ass_active_ind = 'Y')
UNION
--c.	Foundation Board of Governors  
--d.	Former Foundation Board of Governors  
select id_number
  from a_dw_address_good
 where id_number in
    (select id_number  from committee where committee_code IN ('FBOG','FBOGA','FBOGD','FBOGE','FBOGG','FBOGN'))
UNION
--e.	Former Foundation Board of Trustees   f.	Active Mines Board of Trustees
select id_number
  from a_dw_address_good
 where id_number in
    (select id_number  from committee where committee_code = 'BOT')
UNION
--g.	Engaged others (as coded in Advance) 
select id_number
  from a_dw_address_good
 where id_number IN
    (select id_number from mailing_list where mail_list_code = 'EO') 
UNION    
--h.	CFR Mines magazine mailing list
select id_number
  from a_dw_address_good
 where id_number IN
    (select id_number from mailing_list where mail_list_code = 'CMM')    