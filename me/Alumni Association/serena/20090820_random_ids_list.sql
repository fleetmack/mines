select id_number, pref_mail_name, pref_name_sort, h_street1, h_street2, h_street3, h_cityline, h_email_address, h_phone_formatted, 
b_business_title, b_company_name_1, b_street1, b_street2, b_street3, b_cityline, b_phone_formatted, b_email_address
from a_dw_address_good
where id_number IN
('0000050157',
'0000014201',
'0000026857',
'0000042325',
'0000042869',
'0000039393',
'0000008780',
'0000032510',
'0000038773',
'0000039599',
'0000005421',
'0000035906',
'0000029172',
'0000010221',
'0000009696',
'0000030481',
'0000010694',
'0000013407',
'0000005281',
'0000009312',
'0000017532',
'0000040919',
'0000033764',
'0000019700',
'0000012270',
'0000005439',
'0000030452',
'0000006892',
'0000038074',
'0000043314',
'0000030616',
'0000030687',
'0000038172',
'0000004638',
'0000012657',
'0000026733',
'0000033098',
'0000015642',
'0000009059',
'0000047702',
'0000006036',
'0000031390',
'0000014496',
'0000013740',
'0000007499',
'0000034502',
'0000040253',
'0000041328',
'0000043646',
'0000014822',
'0000012790',
'0000036381',
'0000038555',
'0000037761',
'0000038500',
'0000008552',
'0000007936',
'0000011146',
'0000036402',
'0000039429',
'0000006241',
'0000042252',
'0000031353',
'0000034454',
'0000033390',
'0000015096',
'0000031666',
'0000041089',
'0000012362',
'0000040658',
'0000037666',
'0000047615',
'0000034063')