/*** List 1 ***/
--BOG
select id_number
  from committee
 where committee_code IN ('FBOG','FBOGA','FBOGD','FBOGE','FBOGG','FBOGN')
   and committee_status_code IN ('A')
UNION
--BOT   
select id_number
  from committee
 where committee_code = 'BOT'
   and committee_status_code = 'A'
UNION 
--MCS (alumni only)	  
select id_number
  from a_dw_gift_clubs
  where record_type_code = 'AL'
    and (flag_cs_notif = 1 or flag_cs = 1)
UNION
--CSMAA Board President (John Howe)
select id_number
  from entity
 where id_number = '0000012657'
UNION
--President''s Executive Committee
select id_number
  from mailing_list
 where mail_list_code IN ('MEC','MSC')
UNION
--First Tuesday	
select id_number
  from mailing_list
 where mail_list_code = 'FTUEG'
UNION
--COGA
select id_number
  from mailing_list
 where mail_list_code = 'COGAO'
UNION
--CO and WY alumni rated $100k and up
SELECT id_number 
       FROM a_dw_demop_prof
      WHERE p_state_code IN ('CO','WY')
        AND record_type_code = 'AL'
        AND rp_mgc_value >= 100000
UNION
--PC (Investing member) $10k and up FY11 and/or 12 (alumni only)	
SELECT id_number 
       FROM a_dw_gift_clubs
      WHERE (joint_total_cfy >= 10000 OR joint_total_pfy >= 10000)
        AND record_type_code = 'AL'
UNION
--Plus these people
select id_number
  from entity
 where id_number IN('0000037837',
'0000036924',
'0000006352',
'0000004876',
'0000023219',
'0000060110',
'0000020309',
'0000054799',
'0000029669',
'0000022366',
'0000022716',
'0000022556',
'0000013294',
'0000010547',
'0000024519',
'0000043706',
'0000054331',
'0000019975',
'0000021322',
'0000054660',
'0000022593',
'0000028978',
'0000026508',
'0000010880',
'0000036994',
'0000037523',
'0000010762',
'0000017680',
'0000011669',
'0000043244',
'0000032372',
'0000054803',
'0000033022',
'0000026508',
'0000043706',
'0000043707',
'0000022593',
'0000054331',
'0000043710',
'0000050053',
'0000041545',
'0000054647',
'0000054801',
'0000041722',
'0000043711',
'0000023490',
'0000043715',
'0000029802',
'0000008186',
'0000033658',
'0000023651',
'0000029462',
'0000033798',
'0000041609',
'0000012100',
'0000043244',
'0000037488',
'0000023219',
'0000037510',
'0000037521',
'0000043280',
'0000043298',
'0000009873',
'0000043269',
'0000039170',
'0000043263',
'0000037950',
'0000037499',
'0000043300',
'0000043302',
'0000029669',
'0000039842',
'0000043262',
'0000043267',
'0000043272',
'0000043281',
'0000022728',
'0000020730',
'0000037850',
'0000029769',
'0000019975',
'0000037951',
'0000011282',
'0000041437',
'0000037543',
'0000037524',
'0000037940',
'0000037941',
'0000011470',
'0000043315',
'0000006929',
'0000037520',
'0000043266',
'0000010547',
'0000043311',
'0000043268',
'0000034613',
'0000043310',
'0000043270',
'0000012890',
'0000037527',
'0000043296',
'0000043271',
'0000010808',
'0000043259',
'0000043299',
'0000047710',
'0000043277',
'0000037947',
'0000037538',
'0000043264',
'0000037946',
'0000043309',
'0000037945',
'0000043274',
'0000047716',
'0000005509',
'0000037837',
'0000037955',
'0000037838',
'0000037944',
'0000043261',
'0000022363',
'0000010865',
'0000012568',
'0000029444',
'0000034950',
'0000036994',
'0000037523',
'0000037956',
'0000037537',
'0000011438',
'0000047721',
'0000043301',
'0000037502',
'0000013484',
'0000037599',
'0000043282',
'0000057371',
'0000057370',
'0000057365',
'0000057367',
'0000057368',
'0000057369',
'0000050187',
'0000039171',
'0000053358',
'0000022557',
'0000011249',
'0000012875',
'0000038641',
'0000053897',
'0000051131',
'0000054665',
'0000035069',
'0000016544',
'0000015132',
'0000035737',
'0000060121',
'0000060122')




/*** List 2 -- Run only after you've imported activity codes for the above ***/
(select id_number
  from a_dw_gift_clubs
  where record_type_code IN ('FR','PA','PX','ST','GS')
    and (flag_cs_notif = 1 or flag_cs = 1)
    and id_number NOT IN
        (select id_number from activity where activity_code = 'C372')
UNION
--PC (Investing member) $10k and up FY11 and/or 12 (friends only)
SELECT id_number 
       FROM a_dw_gift_clubs
      WHERE record_type_code IN ('FR','PA','PX','ST','GS')
        AND joint_total_cfy >= 10000 OR joint_total_pfy >= 10000
        and id_number NOT IN
        (select id_number from activity where activity_code = 'C372'));