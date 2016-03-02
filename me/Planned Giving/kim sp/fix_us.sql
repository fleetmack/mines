/*** These people have two E type addresses ***/
select id_number
from address
where addr_type_code = 'E'
group by id_number
having count(*) > 1;


/*** Plug their ID#'s in here ***/
select e.id_number, e.pref_mail_name, a.email_address, a.operator_name, a.date_added
from address  a,
     entity e
where e.id_number = a.id_number
and a.addr_type_code = 'E'
and a.id_number IN
('0000005055',
'0000036256',
'0000016406',
'0000036621',
'0000039496',
'0000030760',
'0000015377',
'0000012096',
'0000040882',
'0000042837',
'0000047258',
'0000048902',
'0000053551',
'0000053528',
'0000060015',
'0000059388',
'0000008849',
'0000017930',
'0000013121',
'0000034558',
'0000029461',
'0000006042',
'0000039868',
'0000048063',
'0000050727',
'0000012104',
'0000049166',
'0000053683',
'0000056778',
'0000059460',
'0000014029',
'0000007439',
'0000057148',
'0000005814',
'0000007174',
'0000017608',
'0000038846',
'0000031367',
'0000038976',
'0000015562',
'0000010931',
'0000047519',
'0000038329',
'0000035126',
'0000031788',
'0000036668',
'0000057174',
'0000053651',
'0000057115',
'0000025983',
'0000004810',
'0000033601',
'0000016907',
'0000025781',
'0000032868',
'0000049113',
'0000057244',
'0000048213',
'0000045571',
'0000053682',
'0000053340',
'0000042170',
'0000048349',
'0000057289',
'0000030136',
'0000006076',
'0000027040',
'0000038206',
'0000038204',
'0000012370',
'0000039690',
'0000057013',
'0000016535',
'0000053672',
'0000053157',
'0000035766',
'0000014284',
'0000009790',
'0000010220',
'0000015026',
'0000056492',
'0000059400',
'0000038194',
'0000017695',
'0000015390',
'0000036046',
'0000016529',
'0000038816',
'0000039533',
'0000031329',
'0000011258',
'0000015372',
'0000049240')
order by e.id_number;

/*** These people have two 1 type (home cell) addresses ***/
select id_number
from address
where addr_type_code = '1'
group by id_number
having count(*) > 1;


select e.id_number, e.pref_mail_name, a.phone_area_code||a.phone_number, a.operator_name, a.date_added
from address  a,
     entity e
where e.id_number = a.id_number
and a.addr_type_code = '1'
and a.id_number IN
('0000010846',
'0000036559',
'0000040223',
'0000042498',
'0000045725',
'0000042814',
'0000046439',
'0000046291',
'0000042841',
'0000045351',
'0000046204',
'0000060015',
'0000057051',
'0000059460',
'0000057295',
'0000043888',
'0000006741',
'0000014387',
'0000010861',
'0000033135',
'0000043478',
'0000056597',
'0000047483',
'0000038329',
'0000044655',
'0000046294',
'0000009778',
'0000006784',
'0000046565',
'0000038181',
'0000016774',
'0000052841',
'0000044294',
'0000047498',
'0000043757',
'0000052870',
'0000059507',
'0000027114',
'0000040916',
'0000014656',
'0000015827',
'0000043349',
'0000045511',
'0000047490',
'0000044283',
'0000052893',
'0000043813',
'0000045327',
'0000045498',
'0000047178',
'0000044246',
'0000056444',
'0000009678',
'0000056412',
'0000045876',
'0000045352',
'0000056510',
'0000044389',
'0000034893',
'0000042005',
'0000011998',
'0000057059',
'0000044773',
'0000033826',
'0000036087',
'0000003358',
'0000042729',
'0000046860',
'0000047066',
'0000040596')
order by a.id_number;

/*** Now write a data error report to check for this in the future ***/
/*** Then write a data error where either spouse cell or spouse email exists, but the spouse exists as an entity already ****/