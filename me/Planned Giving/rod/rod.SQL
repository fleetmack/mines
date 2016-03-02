
SELECT  e.id_number
  FROM  demographic_profile     d,
        entity                  e    
 WHERE d.id_number = e.id_number
   AND (LOWER(d.dp_rating_code) LIKE '%s%' 
           OR LOWER(d.dp_rating_code) LIKE '%p%') 
   AND LOWER(d.dp_rating_type_code) LIKE 'pgc'
   AND d.id_number NOT IN 
      (SELECT id_number
         FROM a_dw_gift_clubs
        WHERE heritage_society = 1)
   and e.id_number  not in 
   (select id_number from a_dw_address_good
   where p_count = 1)


