/*** Parent Email For Donor Event Thing ***/
select id_number, p_email_address
from a_dw_address_good
where p_email_address > ' '
and id_number IN
(select id_number from temp_kim_parents)
and id_number NOT IN
    (select id_number from mailing_list where mail_list_code = 'EXE')
and id_number NOT IN
('0000040253',
'0000048041',
'0000049044',
'0000048005',
'0000048537',
'0000040126',
'0000048896',
'0000042471',
'0000047840',
'0000012667',
'0000012568',
'0000041935',
'0000039730',
'0000009773');
