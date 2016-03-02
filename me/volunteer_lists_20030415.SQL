/***OIA volunteer (campaign, reunion, annual fund, pc) for 2002-2003, excluding "parent only's"***/
SELECT id_number
FROM   A_DW_ADDRESS_GOOD
WHERE  id_number IN
    (SELECT id_number
       FROM committee
      WHERE committee_code IN ('TRCAM','TRCC','TRCRC','TRMGC','TRPGC','TRRC','TRSC',
'RGP','PCVDE','PCVH','PCVNT','PCVO','PCVSC')
      and stop_dt >= '20030630'
      and committee_status_code = 'A'
        AND id_number NOT IN
            (SELECT id_number 
               FROM committee 
              WHERE committee_code = 'PARC'))
              order by id_number;


/***parent volunteers 2003***/
select * from a_dw_address_good
where id_number in
    (select id_number
       from committee
      where committee_code in ('PARC')
        and stop_dt >= '20030630');


/***any oia volunteer for 2000-2002, no parents only***/
SELECT id_number
FROM   a_dw_address_good
WHERE  id_number in
    (select id_number
       from committee
      where committee_code IN ('TRCAM','TRCC','TRCRC','TRMGC','TRPGC','TRRC','TRSC',
'RGP','PCVDE','PCVH','PCVNT','PCVO','PCVSC')
      and start_dt >= '20000701'
      and stop_dt < '20020701')
      AND id_number NOT IN
            (SELECT id_number 
               FROM committee 
              WHERE committee_code = 'PARC')
      AND id_number NOT IN
            (select id_number from a_volunteer_temp_2003)
