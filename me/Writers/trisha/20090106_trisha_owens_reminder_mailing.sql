drop table temp_mack_rcptn;
commit;
/

create table temp_mack_rcptn
(id_number varchar2(10));
commit;
/

/*** Add Denver Area PC and Century Society***/
insert into temp_mack_rcptn
(select id_number
    from a_dw_address_good
  where p_zipcode between '80000-0000' and '80599-9999'
     and p_email_address > ' '
     and id_number IN
        (select id_number
           from a_dw_gift_clubs
         where (pc08 = '1' OR pc09 = '1' or flag_cs = '1'))
    and id_Number NOT IN
    (select id_number
       from temp_mack_rcptn));
   commit;

/*** Add Board of Trustees, Foundation Board, and Advisory Board ***/
insert into temp_mack_rcptn
(select id_number
from committee
where committee_code IN ('MAB','FBOD','FBOG')
and id_number IN
    (select id_number
        from a_dw_address_good
      where p_email_address > ' ')
and id_number NOT IN
    (select id_number
        from temp_mack_rcptn)      ); 
commit;      
     
/*** Add Denver area HS ***/     
insert into temp_mack_rcptn
(select id_number
from a_dw_gift_clubs
where heritage_society = '1'
and id_number IN
    (select id_number
        from a_dw_address_good
     where p_zipcode between '80000-0000' and '80599-9999'
        and p_email_address > ' ')
and id_number NOT IN
    (select id_number FROM temp_mack_rcptn));     
commit;    


