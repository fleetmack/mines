/*** current alberta residents ***/
create table a_temp_mack_blah
as
(select p_email_address
from a_dw_address_good
where p_country_code = 'CD'
and person_or_org = 'P'
and (p_foreign_cityzip) like '%AB%'
and p_email_address > ' ');
commit;