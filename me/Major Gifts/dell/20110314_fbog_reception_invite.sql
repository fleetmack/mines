/*** CSM Foundation BOG
CSM Board of Trustees
Executive Committee
Strategy Committee
Department Heads 
****/
select id_number
from a_dw_address_good
where id_number IN
(select distinct id_number
from committee  c
where committee_code IN ('FBOG','BOT','FBOGE')
and committee_status_code = 'A'
union 
select distinct id_number
from mailing_list
where mail_list_code IN ('MEC','MSC','DEP')
and mail_list_status_code = 'A');