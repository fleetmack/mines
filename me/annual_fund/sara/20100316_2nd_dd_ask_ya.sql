/*** 2nd DiggerDial Asks ... complicated, email below ***/
drop table temp_dd_ask2;
commit;

create table temp_dd_ask2
as
(select id_number,
          spouse_id,
          record_type_code,
          pref_class_year,
          salutation as mail_sal
from a_aga_3
where a_comb_seg IN ('ya_lyb_10',
'ya_nvr_1_10',
'ya_nvr_1_10 - CHK',
'ya_nvr_1_10 - PM',
'ya_nvr_2_10',
'ya_nvr_2_10 - CHK',
'ya_nvr_2_10 - MEM',
'ya_nvr_2_10 - PM',
'ya_pc_10',
'ya_pc_10 - PM',
'ya_recent_10',
'ya_syb_10',
'ya_syb_10 - CHK',
'ya_syb_10 - PM',
'grad_ya_10',
'grad_ya_10 - CHK',
'ya_recent_10')
and flag_gift_cfy = '1'
and flag_dns = 0
and record_type_code = 'AL'
and    flag_fac_staff_curr   = 0
and flag_omit_from_mail = 0
and id_number NOT IN
    (select id_number from appeals where appeal_code = 'PP10S'));
commit;

alter table temp_dd_ask2
add 
(prefix  varchar2(10),
first_name varchar2(20),
middle_name varchar2(20),
last_name varchar2(30),
pers_suffix varchar2(30),
prof_suffix varchar2(20),
ass_pref_mail_name varchar2(80),
ass_pref_name_sort varchar2(80),
gender_code varchar2(1),
spname  varchar2(40),
descript   varchar2(50),
p_street1 varchar2(40),
p_street2 varchar2(40),
p_street3 varchar2(40), 
p_city varchar2(30),
p_state_code varchar2(2),
p_zipcode varchar2(10),
p_email_address varchar2(40),
h_phone_area_code varchar2(3),
h_phone_number varchar2(7),
b_phone_area_code varchar2(3),
b_phone_number varchar2(7),
largest_gift  varchar2(12),
largest_gift_date varchar2(10),
largest_gift_allocation varchar2(50),
last_pledge  varchar2(12),
last_pledge_date varchar2(10),
b_company_name_1 varchar2(60),
b_business_title varchar2(60),
b_company_name_2 varchar2(60),
b_street1 varchar2(60),
b_street2 varchar2(60),
b_street3 varchar2(60),
b_city varchar2(60),
b_state_code varchar2(2),
b_zipcode varchar2(10),
b_email_address varchar2(60),
salutation varchar2(60),
sp_salutation varchar2(30),
sp_year varchar2(8),
letter_sal  varchar2(30),
flag_special varchar2(1),
flag_mines_fund number(1),
flag_other number(1),
flag_holding_account number(1),
flag_2_gifts_tfy number(1),
fall_gift_amount number(10,2),
fall_gift_date varchar2(10),
fall_gift_alloc varchar2(60),
fall_gift_alloc_code varchar2(8));
commit;

/****************************************************************** UPDATES STRAIGHT FROM TABLES ***************************************************************/
/***  Entity  ***/
UPDATE temp_dd_ask2   t
SET
(t.prefix,
t.first_name,
t.middle_name,
t.last_name,
t.pers_suffix,
t.prof_suffix,
t.gender_code)
=(SELECT e.prefix,
               e.first_name,
               e.middle_name,
               e.last_name,
               e.pers_suffix,
               e.prof_suffix,
               e.gender_code
   FROM entity  e
WHERE e.id_number = t.id_number);
commit;

/***  Address Good ***/
UPDATE temp_dd_ask2   t
SET
(t.p_street1,
 t.p_street2,
 t.p_street3,
 t.p_city,
 t.p_state_code,
 t.p_zipcode,
 t.p_email_address,
 t.h_phone_area_code,
 t.h_phone_number,
 t.b_phone_area_code,
 t.b_phone_number,
 t.b_company_name_1,
 t.b_company_name_2,
 t.b_business_title,
 t.b_street1,
 t.b_street2,
 t.b_street3,
 t.b_city,
 t.b_state_code,
 t.b_zipcode,
 t.b_email_address)
=(SELECT
    d.p_street1,
    d.p_street2,
    d.p_street3,
    d.p_city,
    d.p_state_code,
    d.p_zipcode,
    d.p_email_address,
    d.h_phone_area_code,
    d.h_phone_number,
    d.b_phone_area_code,
    d.b_phone_number,
    d.b_company_name_1,
    d.b_company_name_2,
    d.b_business_title,
    d.b_street1,
    d.b_street2,
    d.b_street3,
    d.b_city,
    d.b_state_code,
    d.b_zipcode,
    d.b_email_address
    FROM a_dw_address_good d
    WHERE d.id_number = t.id_number);
commit;

/***  Degrees ***/
UPDATE      temp_dd_ask2                  m
   SET      m.descript                 = 
   (SELECT  SUBSTR(d.degrees,1,20)
      FROM  a_dw_degree_count          d
     WHERE  m.id_number                   = d.id_number)
 WHERE      m.record_type_code                    = 'AL';
COMMIT;
/

UPDATE      temp_dd_ask2
   SET      descript        = ' '
 WHERE      descript        IS NULL;
COMMIT;
/
/****************************************************************** Non-Gift UPDATES BASED ON CRITERIA ***************************************************************/
/*** PM ***/
UPDATE temp_dd_ask2   m
        SET m.ass_pref_mail_name =
        (SELECT a.ass_pref_mail_name
             FROM a_dw_assignment_pm  a
          WHERE a.id_number(+) = m.id_number);
COMMIT;

UPDATE temp_dd_ask2
        SET ass_pref_mail_name = ' '
 WHERE ass_pref_mail_name IS NULL;
COMMIT;

UPDATE temp_dd_ask2   m
        SET m.ass_pref_name_sort =
        (SELECT a.ass_pref_name_sort
             FROM a_dw_assignment_pm  a
          WHERE a.id_number(+) = m.id_number);
COMMIT;

UPDATE temp_dd_ask2
        SET ass_pref_name_sort = ' '
 WHERE ass_pref_name_sort IS NULL;
COMMIT;

/*** Spouse ***/
/*** Update Spouse Name For Those Whose Spouse Is Not In Advance ***/
UPDATE      temp_dd_ask2        m
   SET      m.spname         = 
   (SELECT  e.spouse_name
        FROM entity         e
     WHERE e.id_number = m.id_number);
COMMIT;
/

/*** Update Spouse Name For Those Whose Spouse Is In Advance ***/
UPDATE      temp_dd_ask2        m
   SET      m.spname         = 
   (SELECT  e.pref_mail_name
        FROM entity         e
     WHERE e.id_number = m.spouse_id)
 WHERE m.spname <= ' ';
COMMIT;
/

UPDATE temp_dd_ask2
        SET spname = ' '
WHERE spname IS NULL;
commit;

/*** Update Spouse Salutation For Those Whose Spouse Is Not In Advance***/
UPDATE      temp_dd_ask2           m
      SET       m.sp_salutation =
        (SELECT e.spouse_salutation
             FROM entity    e
          WHERE m.id_number = e.id_number);
COMMIT;          

/*** Update Spouse Salutation For Those Whose Spouse Is In Advance ***/
UPDATE      temp_dd_ask2        m
   SET      m.sp_salutation         = 
   (SELECT  e.salutation
        FROM entity         e
     WHERE e.id_number = m.spouse_id)
 WHERE m.sp_salutation <= ' ';
COMMIT;
/
/*** Update Spouse Pref Class Year sp_year ***/
UPDATE  temp_dd_ask2           m
     SET m.sp_year =
        (SELECT e1.pref_class_year
             FROM entity    e1
       WHERE e1.id_number = m.spouse_id
            AND e1.record_status_code = 'A');
COMMIT;         


UPDATE temp_dd_ask2
      SET sp_salutation = ' '
WHERE sp_salutation IS NULL;
COMMIT;

UPDATE temp_dd_ask2
      SET sp_year = 'Non-Alum'
WHERE sp_year IS NULL
        OR sp_year = ' ';
COMMIT;      
/****************************************************************** SET FLAGS ***************************************************************/
/*** Gift to Annual Fund in Fall ***/
update temp_dd_ask2
set flag_mines_fund = 1
where id_number in
    (select id_number from a_dw_pyramid where date_of_record BETWEEN '20090701' AND '20091231' and alloc = '3795');

update temp_dd_ask2
set flag_mines_fund = 0 where flag_mines_fund is null;
commit;

/*** Gift to somewhere other than Annual Fund in Fall ***/
update temp_dd_ask2
set flag_other = 1
where id_number in
    (select id_number from a_dw_pyramid where date_of_record BETWEEN '20090701' AND '20091231' and flag_alumni <> '1' and alloc <> '3795');
commit;

update temp_dd_ask2
set flag_other = 0 where flag_other is null;
commit;

/*** Gift from Fall is in a Holding Account --- Sara needs to see these people (probably 0) ***/
update temp_dd_ask2
set flag_holding_account = 1
where id_number in
    (select id_number from a_dw_pyramid where date_of_record BETWEEN '20090701' and '20091231' and flag_alumni <> '1' and alloc IN ('8888','CORP'));
commit;

update temp_dd_ask2
set flag_holding_account = 0 where flag_holding_account is null;
commit;

/*** 2 Gifts of any kind this fiscal year -- will delete later ***/
update temp_dd_ask2
set flag_2_gifts_tfy = 1
where id_number IN
    (select id_number
       from a_dw_pyramid
     where transaction_type IN ('GF','PP')
        and date_of_record >= '20090701'
        and flag_alumni <> '1'
     group by id_number
     having count(*) > 1);
commit;

update temp_dd_ask2
set flag_2_gifts_tfy = 0 where flag_2_gifts_tfy is null;
commit;

/*** Update Flag Special for BOT, BOD, Faculty/Staff/Emeritus ***/
UPDATE temp_dd_ask2
      SET flag_special = 'Board of Trustees'
 WHERE id_number IN
    (SELECT id_number
        FROM committee
        WHERE committee_code = 'BOT'
         AND committee_status_code = 'A');
         
UPDATE temp_dd_ask2
      SET flag_special = 'Board of Governers'
 WHERE id_number IN
    (SELECT id_number
        FROM committee
        WHERE committee_code = 'FBOG'
         AND committee_status_code = 'A');         
         
UPDATE temp_dd_ask2
      SET flag_special = 'Foundation Board of Directors'
 WHERE id_number IN
    (SELECT id_number
        FROM committee
        WHERE committee_code = 'FBOD'
         AND committee_status_code = 'A');           

UPDATE temp_dd_ask2
      SET flag_special = 'Alumni Association Board of Directors'
 WHERE id_number IN
    (SELECT id_number
        FROM committee
        WHERE committee_code = 'AABOD'
         AND committee_status_code = 'A');

UPDATE temp_dd_ask2
      SET flag_special = 'CSM Employee '||b_company_name_1
WHERE id_number IN  
    (select id_number
    from a_dw_jobs
    where employer_id_number IN ('0000019431','0000020910','0000034805')
    and job_status_code = 'C'
    and employ_relat_code = 'PE');
    
UPDATE temp_dd_ask2
      SET flag_special = ' ' 
WHERE flag_special IS NULL;
COMMIT; 
/****************************************************************** GIFT UPDATES BASED ON CRITERIA ***************************************************************/
/*********************************************************/
/********************************************* Fall Gifts ***/
/*********************************************************/
update temp_dd_ask2  t1
set t1.fall_gift_alloc = 
    (select max(decode(p.alloc,'3795','3795','ERROR') )
       from a_dw_pyramid  p
     where p.id_number = t1.id_number
        and p.date_of_record BETWEEN '20090701' AND '20091231'
        and p.flag_alumni <> '1'
        and p.transaction_type IN ('GF','PP'))
where flag_mines_fund = 1;
commit;

/*** Update Other Gift Allocations ***/
update temp_dd_ask2  t1
set t1.fall_gift_alloc = 
    (select max(p.alloc)
       from a_dw_pyramid  p
     where p.id_number = t1.id_number
        and p.date_of_record BETWEEN '20090701' AND '20091231'
        and p.flag_alumni <> '1'
         and p.transaction_type IN ('GF','PP'))
where flag_other = 1;
commit;

update temp_dd_ask2
set fall_gift_alloc_code = fall_gift_alloc;
commit;

update temp_dd_ask2  t1
    set t1.fall_gift_alloc =
    (select t2.short_name from allocation t2 where t1.fall_gift_alloc = t2.allocation_code);
commit;

/*** Update date of gift ***/
UPDATE temp_dd_ask2 t1
   SET t1.fall_gift_date =
    (select max(p.date_of_record)
       from a_dw_pyramid  p
    where t1.id_number = p.id_number
        and p.flag_alumni <> '1'
        and p.transaction_type IN ('GF','PP')
        and p.alloc = t1.fall_gift_alloc_code);
commit;

/*** Add dollar amounts for gift ***/
UPDATE temp_dd_ask2   t1
       SET t1.fall_gift_amount =
        (SELECT sum(p.associated_amount + p.associated_amount_joint)
             FROM a_dw_pyramid  p
          WHERE p.id_number = t1.id_number
               AND p.alloc = t1.fall_gift_alloc_code
               AND p.date_of_record = t1.fall_gift_date);
commit;
/*********************************************************/
/*****************************************Largest Gifts ****/
/*********************************************************/
/*** Set Largest Gift ***/
UPDATE temp_dd_ask2            m
   SET m.largest_gift = 
    (select distinct max(p.associated_amount)
       from a_dw_pyramid    p
      where p.id_number = m.id_number
        and flag_alumni = 0);
COMMIT;
/

/*** Update Nulls ***/
UPDATE temp_dd_ask2        m
   SET m.largest_gift = 0
 WHERE m.largest_gift IS NULL;
COMMIT;
/


/*** Set Largest Gift Allocation ***/
/*** if they have 2 largest gifts that are the same amount, it picks the most recent ***/
update temp_dd_ask2    m
   set largest_gift_allocation =
(select distinct max(p.alloc)
from a_dw_pyramid p
where p.id_number = m.id_number
and p.flag_alumni    = 0
and p.date_of_record =
    (select distinct max(p2.date_of_record)
       from a_dw_pyramid    p2
      where p2.id_number = m.id_number
        and p2.associated_amount =
            (select distinct max(p3.associated_amount)
               from a_dw_pyramid    p3
              where p3.id_number = m.id_number)));
COMMIT;
/

/*** Set Largest Gift Date ***/
UPDATE temp_dd_ask2                    m
   SET m.largest_gift_date          =
   (SELECT to_char(to_date(max(p.date_of_record),'YYYYMMDD'),'MM/DD/YYYY')
      FROM a_dw_pyramid             p
     WHERE p.id_number              = m.id_number
     and receipt in
        (select max(b.receipt)
        from a_dw_pyramid b
        where b.flag_alumni = 0
        and b.id_number = p.id_number
        group by b.id_number, b.receipt
        having max(associated_amount) =
            (select max(associated_amount)
            from a_dw_pyramid c
            where c.flag_alumni = 0
            And b.id_number = c.id_number)));
COMMIT;
/

/*** Update Nulls ***/
UPDATE temp_dd_ask2    m
   SET m.largest_gift_date = ' '
 WHERE m.largest_gift_date IS NULL;
COMMIT;
/

/*** Update Allocation to name ***/
UPDATE temp_dd_ask2    m
   SET m.largest_gift_allocation =
    (SELECT a.short_name
       FROM allocation  a
      WHERE m.largest_gift_allocation = a.allocation_code);
COMMIT;
/

/*** Remove Nulls ***/
UPDATE temp_dd_ask2    m
   SET largest_gift_allocation  = ' '
 WHERE largest_gift_allocation IS NULL;
COMMIT;
/
/*********************************************************/
/*****************************************Last Pledges ****/
/*********************************************************/
/*** Set Last Pledge Amount ***/
UPDATE temp_dd_ask2    m
   SET m.last_pledge =
   (SELECT max(p.commitment_amount)
      FROM a_dw_pyramid     p
     WHERE p.id_number = m.id_number
       AND p.transaction_type = 'P'
       AND p.date_of_record =
        (SELECT MAX(p2.date_of_record)
           FROM a_dw_pyramid    p2
          WHERE p.id_number = p2.id_number
            AND p2.transaction_type = 'P'));
COMMIT;
/

/*** Update Nulls ***/
UPDATE temp_dd_ask2    m
   SET m.last_pledge = 0
 WHERE m.last_pledge IS NULL;
COMMIT;
/

/*** Last Pledge Date ***/
UPDATE temp_dd_ask2 m
   SET m.last_pledge_date = 
   (SELECT to_char(to_date(max(p.date_of_record),'YYYYMMDD'),'MM/DD/YYYY')
      FROM a_dw_pyramid p
     WHERE m.id_number = p.id_number
       AND p.transaction_type = 'P'
       AND p.flag_alumni = 0);
COMMIT;
/

/*** Update Nulls ***/
UPDATE temp_dd_ask2    m
   SET m.last_pledge_date = ' '
 WHERE m.last_pledge_date IS NULL;
COMMIT;
/

/*** Letter Sal Needs To Be Pulled From Entity To Avoid Molly Sal -- always want first name ***/
UPDATE temp_dd_ask2    m
      SET m.letter_sal = 
        (SELECT e.salutation
             FROM entity    e
          WHERE e.id_number = m.id_number);
COMMIT;        

/*** Set Salutation ***/
UPDATE       temp_dd_ask2                              a
   SET       a.salutation                           =
   (SELECT   SUBSTR(e.prefix||' '||e.last_name,1,25)
      FROM   entity                                 e
     WHERE   a.id_number                               = e.id_number);
COMMIT;
/

/*** Set Mail Sal to Joint Mail Sal for Married Coupled ***/
UPDATE      temp_dd_ask2       m
      SET       m.letter_sal =
            (SELECT m2.letter_sal||' and '||m2.sp_salutation
                 FROM temp_dd_ask2   m2
             WHERE m.id_number = m2.id_number)            
WHERE m.sp_salutation > ' '
    AND m.gender_code = 'M';
COMMIT;                  

UPDATE      temp_dd_ask2       m
      SET       m.letter_sal =
            (SELECT m2.sp_salutation||' and '||m2.letter_sal
                 FROM temp_dd_ask2   m2
             WHERE m.id_number = m2.id_number)            
WHERE m.sp_salutation > ' '
    AND m.gender_code = 'F';
COMMIT;    

/*** Delete SpouseID From those where both spouses (no joint) are getting called so they aren't linked in Moonfire ***/
UPDATE temp_dd_ask2
SET spouse_id = ' '
WHERE id_number IN
(select id_number
    FROM temp_dd_ask2
WHERE id_number IN
    (select spouse_id FROM temp_dd_ask2)      
    and id_number IN
    (select id_number
        from entity
      where jnt_mailings_ind = 'N'));
COMMIT;
/      


/****************************************************************** DELETE PEOPLE  ***************************************************************/
/*** Deletes those who didn't make a pledge payment or gift in the fall ***/
delete from temp_dd_ask2
where fall_gift_date is null;
commit;

/*** Per Rosie, do not call if they gave to both Mines Fund and another gift ***/
delete from temp_dd_ask2
where flag_other = 1 and flag_mines_fund = 1;
commit;

/*** delete people who already made an additional gift since january 1 ***/
delete from temp_dd_ask2
where id_number IN
    (select id_number
        from a_dw_pyramid
      where flag_alumni <> '1'
        and date_of_record >= '20100101');
commit;

/*** Delete DO NOT PHONE people and DO NOT SOLICIT people ***/
delete from temp_dd_ask2
where id_number in
    (select id_number from mailing_list where mail_list_code IN ('DNS','DNP'));
commit;

/*** Delete if a pledge was made this year is still outstanding ***/
delete from temp_dd_ask2  t1
where t1.id_number IN
    (select id_number from a_dw_pledge_os where date_of_record >= '20090701'
         and prim_pledge_amount_os > 0);
commit;

/*** Delete PC FY10 ***/
delete from temp_dd_ask2
where id_number IN
    (select id_number from a_dw_gift_clubs where pc_cfy = 1);
commit;

/*** Delete if they made a gift in FY10 but after Jan 1 ***/
delete from temp_dd_ask2
where flag_other is null and flag_mines_fund is null;
commit;

/*** Delete where they made 2 gifts this year ***/
delete from temp_dd_ask2 
where flag_2_gifts_tfy = 1;
commit;

/*** Delete Foreign ***/
delete from temp_dd_ask2
where id_number IN
    (select id_number from a_dw_address_good where p_flag_foreign = '1');
commit;

delete from temp_dd_ask2
where id_number IN
    (select id_number from a_dw_address_good where h_flag_foreign = '1');
commit;

--select * from temp_dd_ask2