select e.id_number,
       e.pref_mail_name,
       e.pref_name_sort,
       e.record_type_code,
       e.pref_class_year,
       ad.p_cityline,
       pg.total_years_giving,
       g.gift_club_start_date
from gift_clubs     g,
     a_dw_pg_prospecting    pg,
     a_dw_address_good      ad,
     entity                 e
where ad.id_number(+)  = g.gift_club_id_number
  and e.id_number      = g.gift_club_id_number
  and pg.id_number(+)  = g.gift_club_id_number 
  and g.gift_club_code = 'HS'
and e.record_status_code = 'A'


/*** powerbuilder style
select advance.entity.id_number,
       advance.entity.pref_mail_name,
       advance.entity.pref_name_sort,
       advance.entity.record_type_code,
       advance.entity.pref_class_year,
       advance.a_dw_addres_good.p_cityline,
       advance.a_dw_pg_prospecting.total_years_giving,
       advance.gift_clubs.gift_club_start_date
from advance.gift_clubs,
     advance.a_dw_pg_prospecting,
     advance.a_dw_address_good,
     advance.entity                 
where advance.a_dw_address_good.id_number(+)  = advance.gift_clubs.gift_club_id_number
  and advance.entity.id_number      = advance.gift_clubs.gift_club_id_number
  and advance.a_dw_pg_prospecting.id_number(+)  = advance.gift_clubs.gift_club_id_number 
  and advance.gift_clubs.gift_club_code = 'HS'
  
  
  
    SELECT A_DW_ADDRESS_GOOD.RECORD_TYPE_DESC  
    FROM A_DW_ADDRESS_GOOD,   
         A_DW_PG_PROSPECTING,   
         ENTITY,   
         GIFT_CLUBS  
   WHERE ( A_DW_ADDRESS_GOOD.ID_NUMBER(+) = GIFT_CLUBS.GIFT_CLUB_ID_NUMBER ) and  
         ( A_DW_PG_PROSPECTING.ID_NUMBER(+) = GIFT_CLUBS.GIFT_CLUB_ID_NUMBER ) and  
         ( ENTITY.ID_NUMBER = GIFT_CLUBS.GIFT_CLUB_ID_NUMBER ) 