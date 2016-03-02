/*** business address and job title  ...     ***/
/*** lifetime giving & 5 year giving summary ***/

select id_number, pref_mail_name, pref_name_sort, pref_class_year
from a_dw_address_good
where id_number IN
('0000025764',
'0000009570',
'0000011216',
'0000034837',
'0000031263',
'0000031556',
'0000010700',
'0000014364',
'0000027620',
'0000010734',
'0000009088',
'0000008528',
'0000016951',
'0000033084',
'0000034843',
'0000034757',
'0000011389',
'0000012419',
'0000016547',
'0000030966',
'0000035176')
