  SELECT nt.ID_NUMBER,     
         n.first_name,
         n.last_name,
         nt.GUEST_NAME_TAG,
         nt.xcomment
    FROM A_DW_NAME_TAGS         nt, 
         activity               a,
         name                   n
   WHERE a.id_number = nt.id_number
     and nt.id_number = n.id_number
     and n.name_type_code = '00'
     and a.activity_code = 'C232'
     and nt.activity_code = 'C232'
     and a.activity_participation_code = 'IX'




  





 
