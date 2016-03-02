/*** Canadian Thanksgiving Card

i.	Additional corporate contacts (as determined by Kim Senger and team)
NOTE: for (i) TBK will get a separate list from Senger later ... don't include them here

***/
--a.	assigned prospects 
(
select ag.id_number
from a_dw_address_good  ag,
     a_dw_assignment_pm ass
where ag.id_number = ass.id_number
  and ag.p_country_code = 'CD'
  and ag.person_or_org = 'P'
union
--b.	stewarded non-assigned individuals who have ever made a gift 
select id_number
  from a_stew_main_9
 where person_or_org = 'P'
   and p_country_code = 'CD'
   and id_number IN
    (select id_number from a_dw_pyramid where flag_alumni <> '1' and flag_non_monthend <> '1')
   and id_number NOT IN
    (select id_number from a_dw_assignment_pm)
UNION    
--c.	Foundation Board of Governors d.	Former Foundation Board of Governors 
select id_number
  from a_dw_address_good
 where p_country_code = 'CD'
   and id_number in
    (select id_number  from committee where committee_code IN ('FBOG','FBOGA','FBOGD','FBOGE','FBOGG','FBOGN'))
UNION
--e.	Former Foundation Board of Trustees f.	Active Mines Board of Trustees    
select id_number
  from a_dw_address_good
 where p_country_code = 'CD'
   and id_number in
    (select id_number  from committee where committee_code = 'BOT')
UNION    
--g.	Engaged others (as coded in Advance) 
select id_number
  from a_dw_address_good
 where p_country_code = 'CD'
   and id_number IN
    (select id_number from mailing_list where mail_list_code = 'EO')
UNION    
--h.	CFR Mines magazine mailing list
select id_number
  from a_dw_address_good
 where p_country_code = 'CD'
   and id_number IN
    (select id_number from mailing_list where mail_list_code = 'CMM'))