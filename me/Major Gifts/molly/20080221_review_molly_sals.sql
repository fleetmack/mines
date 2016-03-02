/*** Creates list of pc, hs, and cs members along with mines/foundation staff ***/
create table a_temp_mack_blah
as
(select e.id_number
  from entity          e,
        a_dw_gift_clubs gc
  where gc.id_number    = e.id_number
    and e.record_status_code = 'A'
    and (pc07 = '1' or pc08 = '1'));

insert into a_temp_mack_blah
(select id_number
   from a_dw_gift_clubs
   where heritage_society = '1'
     and record_status_code = 'A');

insert into a_temp_mack_blah
(select id_number
   from a_dw_gift_clubs
  where flag_cs = '1'
    and record_status_code = 'A');
    
insert into a_temp_mack_blah
  (select id_number
     from a_dw_jobs
    where flag_faculty_staff = '1'
      and record_status_code = 'A'
      and job_status_code = 'C'
      and employ_relat_code = 'PE');
commit;

select count(distinct(id_number))
from a_temp_mack_blah; 

drop table a_temp_mack_blah2;
commit;


create table a_temp_mack_blah2
as
(select e.id_number,
       e.pref_mail_name,
       e.salutation,
       e.spouse_name,
       e.spouse_salutation,
       e.pref_jnt_mail_name1||' '||e.pref_jnt_mail_name2 as pref_jnt_mail_name,
       s.salutation  molly_sal,
       e.pref_name_sort,
       e.jnt_mailings_ind
  from entity   e,
       salutation   s
 where s.id_number(+) = e.id_number
   and s.salutation_type_code (+)= 'MW'
   and e.id_number in
    (select id_number from a_temp_mack_blah));
commit;
    
drop table a_temp_mack_blah;
commit;


/**********************************************************************************/
/*** Update Molly_Sal Where person is Single and molly_sal not stored on system ***/
/**********************************************************************************/
UPDATE a_temp_mack_blah2      m
   SET m.molly_sal =
        (SELECT e.prefix||' '||e.last_name
           FROM entity          e
          WHERE e.id_number     = m.id_number
            AND e.pref_jnt_mail_name1 <= ' '
            AND e.person_or_org        = 'P')
 WHERE m.molly_sal IS NULL
   AND m.id_number IN
        (SELECT e2.id_number
           FROM entity          e2
          WHERE e2.pref_jnt_mail_name1 <= ' '
            AND e2.person_or_org       = 'P');
            
/*****************************************************************/
/*** Update Molly_SAL where person is married but does not *******/
/******************* want joint mailings *************************/
/*****************************************************************/
UPDATE a_temp_mack_blah2      m
   SET m.molly_sal  = 
        (SELECT e.prefix||' '||e.last_name
           FROM entity          e
          WHERE m.id_number     = e.id_number
            AND e.pref_jnt_mail_name1 > ' '
            AND jnt_mailings_ind     = 'N')
 WHERE m.molly_sal IS NULL
   AND m.id_number IN
        (SELECT e2.id_number
           FROM entity      e2
          WHERE e2.pref_jnt_mail_name1 > ' '
            AND jnt_mailings_ind      = 'N');

/*****************************************************************/
/*** Update Molly_Sal Where person is Married, *******************/
/*** with spouse on system, and molly_sal not stored on system ***/
/**************** Same last name *********************************/
/*****************************************************************/
UPDATE a_temp_mack_blah2  m
   SET m.molly_sal    =
    (SELECT e1.prefix||' and '||e2.prefix||' '||e1.last_name
       FROM entity              e1,
            entity              e2
      WHERE e1.spouse_id_number =   e2.id_number
        AND m.id_number         =   e1.id_number
        AND e1.pref_jnt_mail_name1 > ' '
        AND e1.jnt_mailings_ind    = 'Y'
        AND e1.last_name           = e2.last_name) 
  WHERE m.molly_sal IS NULL
    AND m.id_number IN
        (SELECT e3.id_number
           FROM entity  e3,
                entity  e4
          WHERE e3.spouse_id_number    = e4.id_number
            AND e3.pref_jnt_mail_name1 > ' '
            AND e3.jnt_mailings_ind    = 'Y'
            AND e3.last_name           = e4.last_name);

/*****************************************************************/
/*** Update Molly_Sal Where person is Married, *******************/
/*** with spouse on system, and molly_sal not stored on system ***/
/**************** Diff last name *********************************/
/*****************************************************************/
UPDATE a_temp_mack_blah2  m
   SET m.molly_sal    =
    (SELECT e1.prefix||' '||e1.last_name||' and '||e2.prefix||' '||e2.last_name
       FROM entity              e1,
            entity              e2
      WHERE e1.spouse_id_number =   e2.id_number
        AND m.id_number         =   e1.id_number
        AND e1.pref_jnt_mail_name1 > ' '
        AND e1.jnt_mailings_ind    = 'Y'
        AND e1.last_name           <> e2.last_name) 
  WHERE m.molly_sal IS NULL
    AND m.id_number IN
        (SELECT e3.id_number
           FROM entity  e3,
                entity  e4
          WHERE e3.spouse_id_number    = e4.id_number
            AND e3.pref_jnt_mail_name1 > ' '
            AND e3.jnt_mailings_ind    = 'Y'
            AND e3.last_name           <> e4.last_name);                 
   
select * from a_temp_mack_blah2
order by pref_name_sort;