drop table temp_david_pgn;
commit;

create table temp_david_pgn
(id_number varchar2(10));
commit;

insert into temp_david_pgn
(select distinct(id_number)
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year <= '1975');
commit;

insert into temp_david_pgn
(select id_number
from a_dw_address_good
where id_number in
(select gift_club_id_number
from gift_clubs
where gift_club_code = 'HS')
and id_number NOT IN
    (select d2.id_number from temp_david_pgn d2));
COMMIT;    

insert into temp_david_pgn
(select id_number
from a_dw_address_good
where id_number IN
    (select id_number
       from entity_record_type
      where record_type_code = 'WI')
  and id_number NOT IN
    (select  d2.id_number from temp_david_pgn d2));
commit;    

insert into temp_david_pgn
(SELECT   id_number
       FROM   mailing_list
       WHERE  mail_list_code            IN('PGN')
          AND id_number NOT IN
            (select d2.id_number from temp_david_pgn d2));
COMMIT;

select count(distinct(id_number)) from temp_david_pgn;