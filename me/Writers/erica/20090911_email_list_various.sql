SELECT DISTINCT(id_number)
FROM a_dw_address_good
WHERE p_email_address > ' '
    AND 
((record_type_code = 'AL' AND p_zipcode BETWEEN '80000-0000' AND '80505-9999') --Denver Metrol Alumni
OR (id_number IN (select id_number FROM a_dw_gift_clubs WHERE (pc08='1' or pc09='1' or pc10='1')) and p_zipcode BETWEEN '80000-0000' AND '80505-9999') --Denver Metro PC last 3 years
OR (id_number IN (select id_number FROM a_dw_gift_clubs WHERE heritage_society = '1') and p_zipcode BETWEEN '80000-0000' AND '80505-9999') --Denver Metro Heritage Society
OR (id_number IN (select id_number FROM a_dw_gift_clubs WHERE flag_cs = '1') and p_zipcode BETWEEN '80000-0000' AND '80505-9999') --Denver Metro Century Society
OR (id_number IN (select id_number from committee where committee_code IN ('FBOG','FBOGA','FBOGD','FBOGG','FBOGI','FBOGN') and committee_status_code = 'A')) --FBOG
OR (id_number IN (select id_number from committee where committee_code IN ('BOT') and committee_status_code = 'F' ))
)




/***
Denver metro alumni 
Denver metro PC FY08,09,10
Denver metro Mines Century Society
Denver Metro Heritage Society
Foundation Board of Governors
Former Foundation Board of Trustees
***/