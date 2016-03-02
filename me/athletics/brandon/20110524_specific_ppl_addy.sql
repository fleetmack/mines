/*** Addys for Brandon ***/
select a.id_number, a.pref_mail_name, a.p_company_name_1, a.p_business_title, a.p_street1, a.p_street2, a.p_street3, a.p_city, a.p_state_code, a.p_zipcode, a.p_phone_formatted, a.p_email_address
from entity e,
     a_dw_address_good a
where a.id_number(+) = e.id_number
and e.id_number IN
('0000043030',
'0000020601',
'0000016195',
'0000017264',
'0000051344',
'0000014294',
'0000010320',
'0000006186',
'0000054943',
'0000038392')