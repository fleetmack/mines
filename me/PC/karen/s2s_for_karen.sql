select  p.id_number,  p.alloc, p.pref_mail_name, p.record_type_code,
sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim)
 from a_dw_pyramid      p,
      allocation        a
where p.alloc in ('750','862','476','598')
and p.date_of_record > 19980701
group by p.id_number,  p.alloc, p.pref_mail_name, p.record_type_code

  SELECT ADVANCE.A_DW_PYRAMID.ID_NUMBER,   
         ADVANCE.A_DW_PYRAMID.PREF_MAIL_NAME,   
         ADVANCE.A_DW_PYRAMID.PREF_NAME_SORT,   
         ADVANCE.ALLOCATION.LONG_NAME,   
         ADVANCE.A_DW_PYRAMID.RECEIPT  
    FROM ADVANCE.A_DW_PYRAMID,   
         ADVANCE.ALLOCATION  
   WHERE ( ADVANCE.A_DW_PYRAMID.ALLOC = ADVANCE.ALLOCATION.ALLOCATION_CODE ) AND  
         ( ADVANCE.A_DW_PYRAMID.DATE_OF_RECORD in ( '19980701' ) ) AND  
         ( ADVANCE.A_DW_PYRAMID.ALLOC = ('750','862','476','598') )    
