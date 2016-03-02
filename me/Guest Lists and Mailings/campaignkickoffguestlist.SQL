select * from a_dw_address_good 
where id_number in  
(select id_number 
 from committee		
 where committee_code in ('TRCAM','TRCC','TRCRC','TRMGC','TRPGC','TRRC','TRSC'))
and id_number in
(select id_number from committee where committee_status_code = 'A')


