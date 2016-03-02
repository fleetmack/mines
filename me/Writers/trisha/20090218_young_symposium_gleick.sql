/*** MAILING LIST for young symposium .... email list is separate ***/
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
     and id_number IN
        (select id_number
           from a_dw_gift_clubs
         where (pc08 = '1' OR pc09 = '1' or flag_cs = '1'))
    and id_Number NOT IN
    (select id_number
       from temp_mack_rcptn));
   commit;
   /
   
   /*** Add Denver area HS ***/     
insert into temp_mack_rcptn
(select id_number
from a_dw_gift_clubs
where heritage_society = '1'
and id_number IN
    (select id_number
        from a_dw_address_good
     where p_zipcode between '80000-0000' and '80599-9999')
and id_number NOT IN
    (select id_number FROM temp_mack_rcptn));     
commit;    
/

/*** Add Foundation Boards, and Advisory Board ***/
insert into temp_mack_rcptn
(select id_number
from committee
where committee_code IN ('MAB','FBOD','FBOG')
and id_number IN
    (select id_number
        from a_dw_address_good)
and id_number NOT IN
    (select id_number
        from temp_mack_rcptn)); 
commit;
    /
    
/*** Add FORMER BOT (NOT the current BOT!!!) ***/
insert into temp_mack_rcptn
(select id_number
from committee
where committee_code = 'BOT'
and committee_status_code = 'F'
and id_number IN
    (select id_number
    from a_dw_address_good)
and id_number NOT IN
    (select id_number
      from temp_mack_rcptn));
commit;
/

/*** Add Executive Committee ***/
/*** Review as needed ***/
insert into temp_mack_rcptn
(select id_number
from a_dw_address_good
where id_number IN 
('0000026020',/*Nigel Middleton*/
'0000039054',/*Kirsten Volpi*/
'0000039053',/*John Poate*/
 '0000020394',/*Harold Cheuvront*/
 '0000024201',/*Molly Williams*/
 '0000024505',/*Peter Han*/
 '0000035044',/*Anne Walker*/
 '0000040043',/*Mike Dougherty*/
 '0000036923')/*Anita Pariseau*/
 and id_number NOT IN
    (select id_number
       from temp_mack_rcptn));
commit;
/

/*** Add additional people per Trisha ***/
insert into temp_mack_rcptn
(select id_number
from a_dw_address_good
where id_number IN
('0000041675', /*Jacob Smith*/
'0000041533',/*Mike Bestor*/
'0000041606',/*Dan Hartman*/
'0000033798'/*James Cole*/)
and id_number NOT IN 
    (select id_number
       from temp_mack_rcptn));
commit;
/

/*** Make sure current BOT members are not in there ***/
delete from temp_mack_rcptn
where id_number IN
    (select id_number
      from committee
   where committee_code = 'BOT'
      and committee_status_code = 'A');
commit;      
/

/************************************************************** now create email list ************************************************************/
drop table temp_mack_rcptn_e;
commit;
/

create table temp_mack_rcptn_e
as
(select id_number from temp_mack_rcptn);
commit;
/

delete from temp_mack_rcptn_e
where id_number IN
    (select id_number 
       from a_dw_address_good
     where p_email_address <= ' ');
commit;     

insert into temp_mack_rcptn_e
(select id_number
from a_dw_address_good
where record_type_code = 'AL'
and p_zipcode between '80000-0000' and '80599-9999'
and p_email_address > ' '
and id_number NOT IN
    (select id_number from temp_mack_rcptn_e));
commit;    
/

/*** delete do-not-email people ***/
delete from temp_mack_rcptn_e
where id_number in
    (select id_number from mailing_list where mail_list_code = 'EXE');
commit;    


/*** Make sure current BOT members are not in there ***/
delete from temp_mack_rcptn_e
where id_number IN
    (select id_number
      from committee
   where committee_code = 'BOT'
      and committee_status_code = 'A');
commit;      
/