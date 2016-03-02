/*** FY 05 Gifts ***/
/*** Transaction Types ***/

/*** BP ***/
select *
from a_dw_pyramid
where id_number in ('0000018248',
'0000034266',
'0000019079',
'0000030166',
'0000030163',
'0000029465',
'0000018710',
'0000029758',
'0000030163',
'0000018248',
'0000026059',
'0000019722',
'0000019238',
'0000029465',
'0000034907',
'0000019718',
'0000029465',
'0000018710',
'0000019651') 
and date_of_record between '20040701' and '20050630'
and transaction_type in ('MG','MC')


/*** Conoco Phillips ***/
select *
from a_dw_pyramid
where id_number in ('0000018051',
                    '0000018200',
                    '0000018053') 
and date_of_record between '20040701' and '20050630'
and transaction_type in ('MG','MC')
                   
/*** Shell ***/
select *
from a_dw_pyramid
where id_number in ('0000029788',
'0000018228',
'0000019589',
'0000034816',
'0000033802',
'0000028494',
'0000019068',
'0000019594',
'0000018226',
'0000018227',
'0000018838',
'0000019556',
'0000019191') 
and date_of_record between '20040701' and '20050630'
and transaction_type in ('MG','MC')

/*** exxonmobile ***/
select *
from a_dw_pyramid
where id_number in ('0000025665',
'0000029633',
'0000029631',
'0000034526',
'0000024589',
'0000029691',
'0000025663',
'0000032146',
'0000032268',
'0000018323')
and date_of_record between '20040701' and '20050630'
and transaction_type in ('MG','MC')

/*** chevron ***/
select *
from a_dw_pyramid
where id_number in  ('0000032105',
'0000019826',
'0000019449',
'0000019576',
'0000029659',
'0000019762',
'0000018243',
'0000033801',
'0000028912',
'0000019849',
'0000018401',
'0000018245',
'0000019577',
'0000019762',
'0000032105',
'0000025732',
'0000018011',
'0000018244',
'0000018246',
'0000032105',
'0000018242',
'0000019762',
'0000033801',
'0000028912',
'0000019577') 
and date_of_record between '20040701' and '20050630'
and transaction_type in ('MG','MC')

/*** Marathon Oil ***/
select *
from a_dw_pyramid
where id_number in ('0000036057',
'0000018296',
'0000018297',
'0000018298',
'0000018373',
'0000019818') 
and date_of_record between '20040701' and '20050630'
and transaction_type in ('MG','MC')