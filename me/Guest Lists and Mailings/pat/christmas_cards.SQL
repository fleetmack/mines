/*** Unassigned ***/
select id_number from a_temp_pat_blah
where id_number  NOT IN
    (select id_number 
       from a_dw_assignment_pm
      where ass_id_number  IN ('0000024505','0000033218','0000026244','0000035634',
      '0000035501','0000032740','0000033408','0000012159','0000025722','0000035081'))

/***Peter 24505   31***/
select id_number from a_temp_pat_blah
where id_number in
    (select id_number
       from a_dw_assignment_pm
      where ass_id_number = '0000024505')

/***Rod  33218    6***/
select id_number from a_temp_pat_blah
where id_number in
    (select id_number
       from a_dw_assignment_pm
      where ass_id_number = '0000033218');

/***Wenger 26244    35 ***/
select id_number from a_temp_pat_blah
where id_number in
    (select id_number
       from a_dw_assignment_pm
      where ass_id_number = '0000026244')

/*** Miriam 35634     2***/
select id_number from a_temp_pat_blah
where id_number in
    (select id_number
       from a_dw_assignment_pm
      where ass_id_number = '0000035634')

/*** Nilmini 35501       12***/
select id_number from a_temp_pat_blah
where id_number in
    (select id_number
       from a_dw_assignment_pm
      where ass_id_number = '0000035501');

/*** J-Rod 32740       2***/
select id_number from a_temp_pat_blah
where id_number in
    (select id_number
       from a_dw_assignment_pm
      where ass_id_number = '0000032740');

/*** Nick 33408         0***/
select id_number from a_temp_pat_blah
where id_number in
    (select id_number
       from a_dw_assignment_pm
      where ass_id_number = '0000033408')

/*** Linda 12159          0***/
select id_number from a_temp_pat_blah
where id_number in
    (select id_number
       from a_dw_assignment_pm
      where ass_id_number = '0000012159')

/*** Maureen 25722       40***/
select id_number from a_temp_pat_blah
where id_number in
    (select id_number
       from a_dw_assignment_pm
      where ass_id_number = '0000025722');

/*** Rosie 35081         3***/
select id_number from a_temp_pat_blah
where id_number in
    (select id_number
       from a_dw_assignment_pm
      where ass_id_number = '0000035081');


select * from a_temp_pat_blah


/***Create Table for Christmas Cards December 2003 for Pat***/
create table a_temp_pat_blah
as
select id_number
from a_dw_address_good
where id_number IN 
('0000001674',
'0000001995',
'0000002385',
'0000002595',
'0000002703',
'0000002711',
'0000002794',
'0000002883',
'0000003018',
'0000003107',
'0000003183',
'0000003216',
'0000003258',
'0000003358',
'0000003364',
'0000003394',
'0000003402',
'0000003413',
'0000003423',
'0000003428',
'0000003482',
'0000003500',
'0000003525',
'0000003548',
'0000003553',
'0000003763',
'0000003893',
'0000003958',
'0000004142',
'0000004183',
'0000004199',
'0000004269',
'0000004316',
'0000004397',
'0000004470',
'0000004477',
'0000004481',
'0000004570',
'0000004611',
'0000004643',
'0000004711',
'0000004780',
'0000004876',
'0000004900',
'0000004991',
'0000005042',
'0000005334',
'0000005489',
'0000005509',
'0000005529',
'0000005541',
'0000005621',
'0000005641',
'0000005768',
'0000005890',
'0000005956',
'0000005996',
'0000006064',
'0000006110',
'0000006129',
'0000006207',
'0000006214',
'0000006265',
'0000006274',
'0000006294',
'0000006309',
'0000006348',
'0000006352',
'0000006409',
'0000006485',
'0000006487',
'0000006607',
'0000006611',
'0000006660',
'0000006734',
'0000006933',
'0000007103',
'0000007122',
'0000007124',
'0000007160',
'0000007214',
'0000007290',
'0000007345',
'0000007363',
'0000007500',
'0000007529',
'0000007632',
'0000007646',
'0000007728',
'0000007763',
'0000007983',
'0000008240',
'0000008257',
'0000008686',
'0000008772',
'0000008895',
'0000008905',
'0000008978',
'0000009085',
'0000009284',
'0000009336',
'0000009367',
'0000009610',
'0000009904',
'0000009913',
'0000009962',
'0000010127',
'0000010235',
'0000010285',
'0000010436',
'0000010484',
'0000010994',
'0000011893',
'0000012742',
'0000012959',
'0000013049',
'0000013070',
'0000013270',
'0000013553',
'0000014268',
'0000015577',
'0000015686',
'0000015762',
'0000015764',
'0000020026',
'0000020031',
'0000020032',
'0000020044',
'0000020601',
'0000020977',
'0000021369',
'0000021394',
'0000021424',
'0000024679',
'0000024744',
'0000025196',
'0000026149',
'0000026258',
'0000028656',
'0000028839',
'0000029349',
'0000029447',
'0000029480',
'0000029687',
'0000032282',
'0000033163',
'0000033325',
'3000003411',
'0000035154');


/*** Drop table***/
drop table a_temp_pat_blah;
commit;
/
