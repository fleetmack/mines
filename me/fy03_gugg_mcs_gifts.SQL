select g.gift_club_id_number,
       g.gift_club_start_date,
       tg.club_desc,
       n.pref_name,
       n.name_sort
  from gift_clubs            g,
       tms_gift_club_table  tg,
       name                  n
 where g.gift_club_id_number = n.id_number
   and tg.club_code          = g.gift_club_code
   and n.name_type_code      = 'PC'
   and g.gift_club_code      IN ('GDR','GBE','GE','CSD','CSC','CSG','CSP','CSS')
   and g.gift_club_start_date BETWEEN '20020701' AND '20030630'
