/*** heritage society members with/without anonymous status ***/
/*** ohs = omit name from heritage society lists ***/
select id_number
from a_dw_address_good
where id_number in
    (select gift_club_id_number
       from gift_clubs
      where gift_club_code = 'HS')
  and id_number not in
    (select id_number
        from mailing_list
       where mail_list_code = 'OHS')