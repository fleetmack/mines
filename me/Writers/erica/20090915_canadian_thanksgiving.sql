/*** Canadian Thanksgiving Cards ***/
select id_number
from a_dw_address_good
where person_or_org = 'P'
and id_number in (select id_number from mailing_list where mail_list_code = 'DNM')
and p_country_code = 'CD'
and (
       (id_number IN (select id_number from a_dw_assignment_pm where ass_active_ind = 'Y')) or
       (id_number IN (select id_number FROM allocation_stewardee  WHERE stewardee_code  = 'NS')) or
       (id_number IN (select id_number FROM committee WHERE committee_code IN ('FBOG','FBOGA','FBOGD','FBOGG','FBOGI','FBOGN','BOT') and committee_status_code = 'A')) or
       (id_number IN (select id_number FROM committee WHERE committee_code IN ('BOT') and committee_status_code = 'F'))  
       );


/***
Assigned prospect
Stewarded non-assigned individuals
Foundation Board of Governors
Mines Board of Trustees
***/