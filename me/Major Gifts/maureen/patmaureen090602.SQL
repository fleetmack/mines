select * from a_dw_address_good
where id_number in
    (SELECT ID_NUMBER FROM COMMITTEE
     WHERE ID_NUMBER IN
        (SELECT ID_NUMBER
         FROM 




(select id_number 
 from committee		
 where committee_code in ('TRCAM','TRCC','TRCRC','TRMGC','TRPGC','TRRC','TRSC'))
