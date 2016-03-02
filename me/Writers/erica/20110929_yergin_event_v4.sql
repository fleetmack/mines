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
--CO and WY alumni rated $100k and up with affinity ratings of 1 or 2
select  dwag.id_number
               from a_dw_affinity dwa,
                    a_dw_address_good dwag,
                    a_dw_demop_prof  dp
              where dwag.id_number = dwa.id_number
                and dp.id_number = dwag.id_number
                and substr(donor_continuum,1,1) IN ('1','2')
                and dwag.record_type_code = 'AL'
                and dwag.p_state_code IN ('CO','WY')
                and dp.rp_mgc_value >= 100000
UNION
--MCS (CO and WY alumni only)
select id_number
  from a_dw_gift_clubs
  where record_type_code = 'AL'
    and (flag_cs_notif = 1 or flag_cs = 1)
    and id_number IN
        (select id_number
           from a_dw_address_good
          where p_state_code IN ('CO','WY'))
UNION
--Guggenheim (CO and WY alumni only)
--PC (Investing member) $10k and up FY11 and/or 12 (CO and WY alumni only)
SELECT id_number 
       FROM a_dw_gift_clubs
      WHERE (joint_total_cfy >= 10000 OR joint_total_pfy >= 10000)
        AND record_type_code = 'AL'
        AND id_number IN
            (SELECT id_number from a_dw_address_good where p_state_code IN ('CO','WY'))
UNION            
--CSMAA Board President (John Howe)
select id_number
  from entity
 where id_number = '0000012657'        
UNION
--Make sure those who RSVP'd earlier are still included
select id_number
  from entity
 where id_number IN ('0000012890','0000028979')
UNION
--First Tuesday
select id_number
  from mailing_list
 where mail_list_code = 'FTUEG'
UNION
--Plus entities listed below
SELECT id_number
  FROM entity
 WHERE id_number IN
('0000037837','0000006352','0000004876','0000023219','0000060110','0000020309','0000054799','0000029669','0000022366','0000022716','0000022556','0000013294','0000010547','0000024519','0000043706','0000054331','0000019975','0000021322','0000054660','0000022593','0000028978','0000026508','0000010880','0000036994','0000037523','0000010762','0000017680','0000011669','0000043244','0000032372','0000054803','0000033022','0000026508','0000043706','0000043707','0000022593','0000054331','0000043710','0000050053','0000054647','0000054801','0000043711','0000023490','0000043715','0000033658','0000029462','0000033798','0000012100','0000037488','0000023219','0000037510','0000043280','0000009873','0000039170','0000037499','0000029669','0000039842','0000022728','0000037850','0000029769','0000019975','0000011282','0000041437','0000037524','0000037941','0000011470','0000006929','0000037520','0000043266','0000010547','0000012890','0000037527','0000010808','0000047710','0000037538','0000037945','0000047716','0000005509','0000037955','0000037838','0000037944','0000043261','0000010865','0000012568','0000034950','0000036994','0000037537','0000037502','0000037599','0000057369','0000050187','0000039171','0000053358','0000022557','0000011249','0000012875','0000038641','0000053897','0000051131','0000054665','0000035069','0000016544','0000015132','0000035737','0000060121','0000060122','0000005509','0000007900','0000010808','0000011061',
'0000011251','0000011425','0000012394','0000015132','0000043679','0000040537','0000019919','0000020026','0000012742','0000006607','0000060440','0000003402','0000004900','0000035737','0000037510','0000054790','0000054791','0000060437','0000054795','0000060442','0000041069','0000054796','0000060445','0000060447','0000032372','0000011849','0000060448','0000054797','0000011470','0000054799','0000054800','0000060449','0000054801','0000060450','0000054802','0000060446','0000060444','0000040305','0000060443','0000060441','0000054804','0000035436')
MINUS
--do not include
select id_number
  from entity
 where id_number IN
    ('0000015391','0000003553','0000004222')