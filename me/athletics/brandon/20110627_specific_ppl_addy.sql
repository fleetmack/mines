/*** Addys for Brandon ***/
select a.id_number, a.pref_mail_name, a.p_company_name_1, a.p_business_title, a.p_street1, a.p_street2, a.p_street3, a.p_city, a.p_state_code, a.p_zipcode, a.p_phone_formatted, a.p_email_address
from entity e,
     a_dw_address_good a
where a.id_number(+) = e.id_number
and e.id_number IN
('0000013911',
'0000043059',
'0000024505',
'0000010714',
'0000038090',
'0000034988',
'0000016780',
'0000017203',
'0000006876')

/***
Will Fleckenstein
Steve Chonka
Peter Han
Brian Glade
Michelle Moorman
Paula Nolan
Blaine Spies
Mark Woempner
Marshall Crouch
***/