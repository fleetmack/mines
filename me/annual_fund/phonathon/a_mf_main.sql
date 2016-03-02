/*********************************************************/
/*********************************************************/
/*** Create File For Import of Prospects Into Moonfire ***/
/*********************************************************/
/*********************************************************/

/*** Drop Table ***/
DROP TABLE      a_mf_main;
COMMIT;
/

/*** Create Main Table ***/
CREATE TABLE               a_mf_main
   (hostid                 VARCHAR2(11)   NOT NULL,   
   spouseid                VARCHAR2(11)   NULL,   
   pname                   VARCHAR2(45)   NULL,
   prefix                  VARCHAR2(30)    NULL,
   first_name              VARCHAR2(30)   NULL,
   middle_name             VARCHAR2(30)   NULL,
   last_name               VARCHAR2(30)   NULL,
   pers_suffix             VARCHAR2(20)    NULL,
   prof_suffix             VARCHAR2(20)    NULL,
   pref_class_year         VARCHAR(4)     NULL,
   relator                 VARCHAR2(8)    NULL,    
   spname                  VARCHAR2(45)   NULL,    
   salutation              VARCHAR2(25)   NULL,   
   address1                VARCHAR2(30)   NULL,   
   address2                VARCHAR2(30)   NULL,
   address3                VARCHAR2(30)   NULL,
   cityline                VARCHAR2(45)   NULL, 
   countrycod              VARCHAR2(4)    NULL,
   p_email_address         VARCHAR2(60)   NULL, 
   phone1                  VARCHAR2(13)   NULL,
   phone1_type             VARCHAR(1)     NULL,
   phone1_area_code        VARCHAR2(3)    NULL,
   phone1_prefix           VARCHAR2(3)    NULL,
   phone1_number           VARCHAR2(4)    NULL,
   phone2                  VARCHAR2(13)   NULL,
   phone2_type             VARCHAR2(1)    NULL,
   phone2_area_code        VARCHAR2(3)    NULL,
   phone2_prefix           VARCHAR2(3)    NULL,
   phone2_number           VARCHAR2(4)    NULL,
   last_gift               NUMBER(10,2)   NULL,
   last_gift_date          VARCHAR2(10)   NULL,
   last_gift_allocation    VARCHAR2(50)   NULL,
   last_gift_club          VARCHAR2(30)   NULL,
   largest_gift            NUMBER(10,2)   NULL,
   largest_gift_date       VARCHAR(10)    NULL,
   largest_gift_allocation VARCHAR(50)    NULL,
   last_pledge             NUMBER(10,2)   NULL,
   last_pledge_date        VARCHAR(10)    NULL,
   jobsconame              VARCHAR2(50)   NULL,   
   jobstitle               VARCHAR2(50)   NULL,   
   hostmemo                VARCHAR2(254)  NULL,  
   appoint                 VARCHAR2(8)    NULL,    
   amount1                 NUMBER(8,2)    NULL,  
   amount2                 NUMBER(16,2)   NULL,
   amount3                 NUMBER(8,2)    NULL,
   amount4                 NUMBER(8,2)    NULL,
   code1a                  VARCHAR2(8)    NULL,    
   code1b                  VARCHAR2(8)    NULL,    
   code1c                  VARCHAR2(8)    NULL,    
   code2a                  VARCHAR2(8)    NULL,    
   code2b                  VARCHAR2(8)    NULL,    
   code2c                  VARCHAR2(8)    NULL,    
   code3                   VARCHAR2(8)    NULL,    
   code4                   VARCHAR2(8)    NULL,    
   code5                   VARCHAR2(8)    NULL,    
   code6                   VARCHAR2(8)    NULL,     
   code7                   VARCHAR2(8)    NULL,       
   code8                   VARCHAR2(8)    NULL,    
   code9                   VARCHAR2(8)    NULL,    
   code10                  VARCHAR2(8)    NULL,    
   code11                  VARCHAR2(8)    NULL,    
   date1                   VARCHAR2(8)    NULL,    
   date2                   VARCHAR2(8)    NULL,
   a_segment               VARCHAR2(16)   NULL,
   descript                VARCHAR2(20)   NULL,
   flag_dns                VARCHAR2(1)    NULL,
   ass_pref_name           VARCHAR2(60)   NULL,
   mail_mail_name          VARCHAR2(60)   NULL,
   mail_sal                VARCHAR2(80)   NULL,
   p_addr_type_code        CHAR(1)        NULL,
   p_care_of               VARCHAR2(45)   NULL,
   p_company_name_1        VARCHAR2(60)   NULL,
   p_company_name_2        VARCHAR2(60)   NULL,
   p_business_title        VARCHAR2(35)   NULL,
   p_street1               VARCHAR2(40)   NULL,
   p_street2               VARCHAR2(40)   NULL,
   p_street3               VARCHAR2(40)   NULL,
   p_cityline              VARCHAR2(60)   NULL,
   p_foreign_cityzip       VARCHAR2(40)   NULL,
   p_country_desc          VARCHAR2(40)   NULL,
   a_comb_seg              VARCHAR2(60)   NULL,
   flag_volunteer          NUMBER(1)      NULL,
   flag_prospect           NUMBER(1)      NULL,
   class_chair             VARCHAR2(60)   NULL,
   class_goal              VARCHAR2(10)   NULL,
   class_reunion           VARCHAR2(4)    NULL,
   flag_gift_cfy           NUMBER(1)      NULL,
   city                    VARCHAR2(30)   NULL,
   state_code              VARCHAR2(2)    NULL,
   zipcode                 VARCHAR2(10)   NULL,   
   zip5                    VARCHAR2(5)    NULL,
   zip4                    VARCHAR2(4)    NULL,
   b_company_name_1        VARCHAR2(60)   NULL,
   b_company_name_2        VARCHAR2(60)   NULL,
   b_business_title        VARCHAR2(60)   NULL,
   b_street1               VARCHAR2(30)   NULL,
   b_street2               VARCHAR2(30)   NULL,
   b_street3               VARCHAR2(30)   NULL,
   b_city                  VARCHAR2(45)   NULL,
   b_state_code            VARCHAR2(2)    NULL,
   b_zip5                  VARCHAR2(5)    NULL,
   b_zip4                  VARCHAR2(4)    NULL,
   b_email_address         VARCHAR2(60)   NULL,
   b_phone_area_code       VARCHAR2(3)    NULL,
   b_phone_prefix          VARCHAR2(3)    NULL,
   b_phone_number          VARCHAR2(4)    NULL);
COMMIT;
/

/*** Insert Info from Main Mail File ***/
INSERT INTO   a_mf_main (hostid,
                        spouseid,
                        pname,
                        hostmemo,
                        appoint,
                        code1a,
                        code1b,
                        code1c,
                        code2a,
                        code2b,
                        code2c,
                        code3,
                        code4,
                        code5,
                        code6,
                        code7,
                        code8,
                        code9,
                        code10,
                        code11,
                        date1,
                        amount1,
                        amount2,
                        a_segment,                 
                        flag_dns,
                        ass_pref_name,
                        mail_mail_name,
                        mail_sal,
                        p_addr_type_code,
                        p_care_of,
                        p_company_name_1,
                        p_company_name_2,
                        p_business_title,
                        p_street1,
                        p_street2,
                        p_street3,
                        p_cityline,
                        p_foreign_cityzip,
                        p_country_desc,
                        city,
                        state_code,
                        zipcode)
   (SELECT              id_number,
                        NVL(spouse_id,' '),
                        SUBSTR(pref_mail_name,1,45),
                        ' ',
                        ' ',
                        ' ',
                        ' ',
                        ' ',
                        ' ',
                        ' ',
                        ' ',
                        pref_class_year,
                        SUBSTR(record_type_desc,4,8),
                        ' ',
                        ' ',
                        ' ',
                        ' ',
                        ' ',
                        ' ',
                        ' ',
                        ' ',
                        a_ask,
                        pfy_giving,
                        a_segment,                     
                        flag_dns,
                        ass_pref_mail_name,
                        mail_mail_name,
                        salutation,
                        p_addr_type_code,
                        p_care_of,
                        p_company_name_1,
                        p_company_name_2,
                        p_business_title,
                        p_street1,
                        p_street2,
                        p_street3,
                        p_cityline,
                        p_foreign_cityzip,
                        p_country_desc,
                        p_city,
                        p_state_code,
                        p_zipcode
   FROM    a_aga_3
   WHERE   p_country_code        IN('USA',' ')
    AND    flag_fac_staff_curr   = 0
    AND    flag_dnp              = 0
    AND    flag_omit_from_mail   = 0
    AND    flag_gift_cfy         = 0
    AND    flag_del_spouse2      = 0);
COMMIT;
/

/*** Create Indexes on Table ***/
CREATE INDEX ADVANCE.a_mf_main_hostid ON ADVANCE.a_mf_main(hostid);
COMMIT;
/

/*** Update Main and Business Address With Home Address Info From Address Good ***/
UPDATE        a_mf_main                           m
   SET        (m.address1,   
              m.address2,
              m.address3,
              m.cityline,
              m.countrycod,    
              m.jobsconame,   
              m.jobstitle,
              m.city,
              m.state_code,
              m.zipcode,
              m.b_company_name_1,
              m.b_company_name_2,
              m.b_business_title,
              m.b_street1,
              m.b_street2,
              m.b_street3,
              m.b_city,
              m.b_state_code,
              m.b_zip5,
              m.b_zip4,
              m.b_email_address,
              m.b_phone_area_code,
              m.b_phone_prefix,
              m.b_phone_number)                        =
   (SELECT    SUBSTR(a.h_street1,1,30),
              SUBSTR(a.h_street2,1,30),   
              SUBSTR(a.h_street3,1,30),
              SUBSTR(a.h_cityline,1,45),    
              SUBSTR(a.h_country_code,1,4),
              SUBSTR(a.h_company_name_1,1,50),
              SUBSTR(a.h_business_title,1,50),
              a.h_city,
              a.h_state_code,
              a.h_zipcode,
              a.b_company_name_1,
              a.b_company_name_2,
              a.b_business_title,
              substr(a.b_street1,1,30),
              substr(a.b_street2,1,30),
              substr(a.b_street3,1,30),
              substr(a.b_city,1,45),
              a.b_state_code,
              substr(a.b_zipcode,1,5),
              substr(a.b_zipcode,7,4),
              substr(a.b_email_address,1,60),
              a.b_phone_area_code,
              substr(a.b_phone_number,1,3),
              substr(a.b_phone_number,4,4)
      FROM    a_dw_address_good                   a
     WHERE    m.hostid                            = a.id_number);
COMMIT;
/

/*** Update Main Address With Business Information Where No Home Address 
UPDATE        a_mf_main                           m
   SET        (m.address1,   
              m.address2,
              m.address3,
              m.cityline,
              m.countrycod,    
              m.jobsconame,   
              m.jobstitle,
              m.city,
              m.state_code,
              m.zipcode)                        =
   (SELECT    SUBSTR(a.b_street1,1,30),
              SUBSTR(a.b_street2,1,30),   
              SUBSTR(a.b_street3,1,30),
              SUBSTR(a.b_cityline,1,45),    
              SUBSTR(a.b_country_code,1,4),
              SUBSTR(a.b_company_name_1,1,50),
              SUBSTR(a.b_business_title,1,50),
              a.b_city,
              a.b_state_code,
              a.b_zipcode
      FROM    a_dw_address_good                   a
     WHERE    m.hostid                            = a.id_number)
     WHERE    m.address1                          = ' ';
COMMIT;
/

/*** Update Prefix ***/
UPDATE      a_mf_main       m
   SET      m.prefix        =
   (SELECT  n.prefix
      FROM  name            n
     WHERE n.name_type_code = '00' 
       AND m.hostid = n.id_number);
COMMIT;
/

/*** Update First Name ***/
UPDATE      a_mf_main       m
   SET      m.first_name    =
   (SELECT  n.first_name
      FROM  name            n
     WHERE n.name_type_code = '00' 
       AND m.hostid = n.id_number);
COMMIT;
/

/*** Update Middle Name ***/
UPDATE      a_mf_main       m
   SET      m.middle_name   =
   (SELECT  n.middle_name
      FROM  name            n
     WHERE n.name_type_code = '00' 
       AND m.hostid = n.id_number);
COMMIT;
/

/*** Update Last Name ***/
UPDATE      a_mf_main       m
   SET      m.last_name     =
   (SELECT  n.last_name
      FROM  name            n
     WHERE n.name_type_code = '00' 
       AND m.hostid = n.id_number);
COMMIT;
/

/*** Update Personal Suffix ***/
UPDATE      a_mf_main       m
   SET      m.pers_suffix   =
   (SELECT  n.pers_suffix
      FROM  name            n
     WHERE n.name_type_code = '00' 
       AND m.hostid = n.id_number);
COMMIT;
/

/*** Update Professional Suffix ***/
UPDATE      a_mf_main       m
   SET      m.prof_suffix   =
   (SELECT  n.prof_suffix
      FROM  name            n
     WHERE n.name_type_code = '00' 
       AND m.hostid = n.id_number);
COMMIT;
/

/*** Update Spouse Name ***/
UPDATE      a_mf_main        m
   SET      m.spname         = 
   (SELECT  e.pref_mail_name
      FROM  entity           e
     WHERE  m.spouseid       = e.id_number);
COMMIT;
/

/*** Update Relator Field Where Spouse ID exists ***/
UPDATE    a_mf_main
   SET    relator    = 'Spouse'
   WHERE  spouseid   > ' ';
COMMIT;
/

/*** Update Email Address ***/
UPDATE      a_mf_main                               m
   SET      m.p_email_address                       =
   (SELECT  p_email_address
      FROM  a_aga_3                                 a
     WHERE  m.hostid                                = a.id_number);
COMMIT;
/

/*** Update Nulls ***/
UPDATE      a_mf_main                               m
   SET      m.p_email_address                       = ' '
 WHERE      m.p_email_address                       IS NULL;
COMMIT;
/

/*** Update Pref Class Year ***/
UPDATE      a_mf_main                               m
   SET      m.pref_class_year                       =
   (SELECT  a.pref_class_year       
      FROM  a_dw_address_good                       a
     WHERE  m.hostid = a.id_number);
COMMIT;
/

/*** Update Nulls ***/
UPDATE       a_mf_main                              m
   SET       m.pref_class_year                        = ' '
 WHERE       m.pref_class_year                        IS NULL;
COMMIT;
/

/*** Update Phone 1 ***/
UPDATE       a_mf_main                               m
   SET       m.phone1                                =
   (SELECT   a.h_phone_area_code||a.h_phone_number
      FROM   a_dw_address_good                       a
     WHERE   m.hostid                                = a.id_number
       AND   a.h_phone_status                          NOT IN('I','P','X'));
COMMIT;
/

/*** Update Nulls ***/
UPDATE       a_mf_main
   SET       phone1    = '  '
   WHERE     phone1    IS NULL;
COMMIT;
/

/*** Update Phone 2 ***/
UPDATE       a_mf_main                               m
   SET       m.phone2                                =
   (SELECT   a.b_phone_area_code||a.b_phone_number
      FROM   a_dw_address_good                       a
     WHERE   m.hostid                                = a.id_number
       AND   a.b_phone_status                          NOT IN('I','P','X'));
COMMIT;
/

/*** Update Nulls ***/
UPDATE       a_mf_main
   SET       phone2           = '  '
   WHERE     phone2           IS NULL;
COMMIT;
/

/*** Delete Where No Phone Number ***/
DELETE FROM  a_mf_main
      WHERE  phone1    = '  '
        AND  phone2    = '  ';
COMMIT;
/

/*** Split Zip into two ranges ***/
UPDATE a_mf_main        m
   SET zip5             = substr(zipcode,1,5);
COMMIT;
/

UPDATE a_mf_main        m
   SET zip4             = substr(zipcode,7,4);
COMMIT;
/

/*** Update Nulls ***/
UPDATE a_mf_main        m
   SET zip5 = ' '
 WHERE zip5 IS NULL;
COMMIT;
/

UPDATE a_mf_main        m
   SET zip4 = ' '
 WHERE zip4 IS NULL;
COMMIT;
/

UPDATE a_mf_main        m
   SET b_zip5 = ' '
 WHERE b_zip5 IS NULL;
COMMIT;
/

UPDATE a_mf_main        m
   SET b_zip4 = ' '
 WHERE b_zip4 IS NULL;
COMMIT;
/

UPDATE a_mf_main        m
   SET b_phone_number = ' '
 WHERE b_phone_number IS NULL;
COMMIT;
/

/*** Set Last Gift ***/
/*** Added 9-3-02 ***/
update a_mf_main m
set  m.last_gift =  
(select distinct max(p.associated_amount)
  from a_dw_pyramid     p
  where p.flag_alumni = 0
    and p.id_number = m.hostid
    and p.date_of_record = 
    (select max(p2.date_of_record)
    from a_dw_pyramid p2
    where p.id_number = p2.id_number
      and p2.flag_alumni = 0
      and p2.id_number IN
        (select hostid from a_mf_main)));
COMMIT;
/

/*** Update Nulls ***/
UPDATE       a_mf_main
   SET       last_gift    = 0
   WHERE     last_gift    IS NULL;
COMMIT;
/

/*** Set Last Gift Date***/
/*** added 9-02-03 ***/
update a_mf_main m
set  m.last_gift_date =  
(select to_char(to_date(max(date_of_record),'YYYYMMDD'),'MM/DD/YYYY')
  from a_dw_pyramid p
  where p.id_number = m.hostid
    and flag_alumni = 0);
COMMIT;
/



/*** Update Nulls ***/
UPDATE       a_mf_main
   SET       last_gift_date    = ' '
   WHERE     last_gift_date    IS NULL;
COMMIT;
/


/*** Set Last Gift Allocation ***/
/*** added 9-2-03 ***/
UPDATE a_mf_main m
   SET m.last_gift_allocation =
      (select distinct max(p.alloc)
         from a_dw_pyramid  p
        where p.id_number = m.hostid
          and p.flag_alumni    = 0
          and p.date_of_record =
            (select max(p2.date_of_record)
               from a_dw_pyramid    p2
              where p2.id_number = m.hostid
              and flag_alumni = 0));
COMMIT;
/

/*** Update Allocation to name ***/
UPDATE a_mf_main    m
   SET m.last_gift_allocation =
    (SELECT a.short_name
       FROM allocation  a
      WHERE m.last_gift_allocation = a.allocation_code);
COMMIT;
/

/*** Update Nulls ***/
UPDATE a_mf_main
   SET last_gift_allocation = ' '
 WHERE last_gift_allocation IS NULL;
COMMIT;
/

/*** Set Last Gift Club ***/
/*** Need to add***/

/*** Update Nulls ***/
UPDATE a_mf_main            m
   SET m.last_gift_club     = ' '
 WHERE m.last_gift_club     IS NULL;
COMMIT;
/


/*** Set Largest Gift ***/
UPDATE a_mf_main            m
   SET m.largest_gift = 
    (select distinct max(p.associated_amount)
       from a_dw_pyramid    p
      where p.id_number = m.hostid
        and flag_alumni = 0);
COMMIT;
/

/*** Update Nulls ***/
UPDATE a_mf_main        m
   SET m.largest_gift = 0
 WHERE m.largest_gift IS NULL;
COMMIT;
/


/*** Set Largest Gift Allocation ***/
/*** if they have 2 largest gifts that are the same amount, it picks the most recent ***/
update a_mf_main    m
   set largest_gift_allocation =
(select distinct max(p.alloc)
from a_dw_pyramid p
where p.id_number = m.hostid
and p.flag_alumni    = 0
and p.date_of_record =
    (select distinct max(p2.date_of_record)
       from a_dw_pyramid    p2
      where p2.id_number = m.hostid
        and p2.associated_amount =
            (select distinct max(p3.associated_amount)
               from a_dw_pyramid    p3
              where p3.id_number = m.hostid)));
COMMIT;
/

/*** Set Largest Gift Date ***/
UPDATE a_mf_main                    m
   SET m.largest_gift_date          =
   (SELECT to_char(to_date(max(p.date_of_record),'YYYYMMDD'),'MM/DD/YYYY')
      FROM a_dw_pyramid             p
     WHERE p.id_number              = m.hostid
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
UPDATE a_mf_main    m
   SET m.largest_gift_date = ' '
 WHERE m.largest_gift_date IS NULL;
COMMIT;
/

/*** Update Allocation to name ***/
UPDATE a_mf_main    m
   SET m.largest_gift_allocation =
    (SELECT a.short_name
       FROM allocation  a
      WHERE m.largest_gift_allocation = a.allocation_code);
COMMIT;
/

/*** Remove Nulls ***/
UPDATE a_mf_main    m
   SET largest_gift_allocation  = ' '
 WHERE largest_gift_allocation IS NULL;
COMMIT;
/


/*** Set Last Pledge Amount 
/*** added 9-02-03***/
UPDATE a_mf_main    m
   SET m.last_pledge =
   (SELECT max(p.commitment_amount)
      FROM a_dw_pyramid     p
     WHERE p.id_number = m.hostid
       AND p.transaction_type = 'P'
       AND p.date_of_record =
        (SELECT MAX(p2.date_of_record)
           FROM a_dw_pyramid    p2
          WHERE p.id_number = p2.id_number
            AND p2.transaction_type = 'P'));
COMMIT;
/


/*** Update Nulls ***/
UPDATE a_mf_main    m
   SET m.last_pledge = 0
 WHERE m.last_pledge IS NULL;
COMMIT;
/


/*** Last Pledge Date ***/
UPDATE a_mf_main m
   SET m.last_pledge_date = 
   (SELECT to_char(to_date(max(p.date_of_record),'YYYYMMDD'),'MM/DD/YYYY')
      FROM a_dw_pyramid p
     WHERE m.hostid = p.id_number
       AND p.transaction_type = 'P'
       AND p.flag_alumni = 0);
COMMIT;
/

/*** Update Nulls ***/
UPDATE a_mf_main    m
   SET m.last_pledge_date = ' '
 WHERE m.last_pledge_date IS NULL;
COMMIT;
/

/*** Set Salutation ***/
UPDATE       a_mf_main                              a
   SET       a.salutation                           =
   (SELECT   SUBSTR(e.prefix||' '||e.last_name,1,25)
      FROM   entity                                 e
     WHERE   a.hostid                               = e.id_number);
COMMIT;
/

/*** Set Match Co ***/
UPDATE       a_mf_main                 a
   SET       a.code1a                  = 'Match Co'
   WHERE     a.hostid                  IN 
   (SELECT   j.id_number
     FROM    a_dw_jobs                 j
    WHERE    j.matching_status_ind     = 'Y'
      AND    j.employ_relat_code       IN('PE','CE')
      AND    j.job_status_code         = 'C');
COMMIT;
/

/**************************/
/*** Use Business Phone ***/
/**************************/
/*** Get code from home or business phone number ***/
UPDATE       a_mf_main          m
   SET       m.code1c           = 'ubfn'
   WHERE     m.hostid           IN
   (SELECT   a.id_number
      FROM   a_dw_address_good  a
     WHERE   (a.h_phone_status  = 'B'
        OR   a.b_phone_status   = 'B'));
COMMIT;
/

UPDATE      a_mf_main
   SET      phone1     = ' '
   WHERE    code1c     = 'ubfn';
COMMIT;
/

/**********************/
/*** Use Home Phone ***/
/**********************/
/*** Get code from home or business phone number ***/
UPDATE       a_mf_main          m
   SET       m.code1b           = 'uhfn'
   WHERE     m.hostid           IN
   (SELECT   a.id_number
      FROM   a_dw_address_good  a
     WHERE   (a.h_phone_status  = 'H'
        OR   a.b_phone_status   = 'H'));
COMMIT;
/

UPDATE      a_mf_main
   SET      phone2     = ' '
   WHERE    code1b     = 'uhfn';
COMMIT;
/

/************************/
/*** Call Before Five ***/
/************************/
/*** Get code from home or business phone number ***/
UPDATE       a_mf_main          m
   SET       m.code1c           = 'cbfp'
   WHERE     m.hostid           IN
   (SELECT   a.id_number
      FROM   a_dw_address_good  a
     WHERE   (a.h_phone_status  = 'D'
        OR   a.b_phone_status   = 'D'));
COMMIT;
/

UPDATE      a_mf_main
   SET      phone2     = phone1
   WHERE    code1c     = 'cbfp'
   AND      phone1     > ' ';
COMMIT;
/

UPDATE      a_mf_main
   SET      phone1     = ' '
   WHERE    code1c     = 'cbfp';
COMMIT;
/

/***********************/
/*** Call After Five ***/
/***********************/
/*** Get code from home or business phone number ***/
UPDATE       a_mf_main          m
   SET       m.code1b           = 'cafp'
   WHERE     m.hostid           IN
   (SELECT   a.id_number
      FROM   a_dw_address_good  a
     WHERE   (a.h_phone_status  = 'C'
        OR   a.b_phone_status   = 'C'));
COMMIT;
/

UPDATE      a_mf_main
   SET      phone1     = phone2
   WHERE    code1b     = 'cafp'
     AND    phone2     > ' ';
COMMIT;
/

UPDATE      a_mf_main
   SET      phone2     = ' '
   WHERE    code1b     = 'cafp';
COMMIT;
/

/*** Set Phone1 Type to Day for everyone ***/
UPDATE      a_mf_main                  m
   SET      m.phone1_type              = 'D';
COMMIT;
/

/*** Set Phone1 Type to night for those with no current Phone1 ***/
UPDATE     a_mf_main                    m
   SET     m.phone1_type                = 'N'
 WHERE     phone1                       = ' '
    OR     phone1                       = '  ';


/*** Move Phone 2 to phone 1 where Phone1 doesn't exist ***/
UPDATE     a_mf_main                    m
   SET     m.phone1                     = m.phone2
 WHERE     m.phone1                       = ' '
    OR     m.phone1                       = '  ';
COMMIT;
/

/*** Delete Phone2 Where We Just moved to Phone 1 ***/
UPDATE      a_mf_main                   m
   SET      m.phone2                    = ' '
 WHERE      m.phone1                    = m.phone2;
COMMIT;
/

/*** Set Type of Phone2 to Night for all ***/
UPDATE      a_mf_main                   m
   SET      m.phone2_type             = 'N';
COMMIT;
/

/*** Update Phone2 type where Phone2 doesn't exist ***/
UPDATE      a_mf_main                   m
   SET      m.phone2_type               = ' '
 WHERE      phone2                      = ' '
    OR      phone2                      = '  ';
COMMIT;
/

/*** Update phone1_area_code ***/
/*** added 9-02-03 ***/
UPDATE       a_mf_main                              
   SET       phone1_area_code   =substr(phone1,1,3);
COMMIT;
/

/*** Update phone1_prefix ***/
/*** added 9-02-03 ***/
UPDATE       a_mf_main                              
   SET       phone1_prefix      = substr(phone1,4,3);
COMMIT;
/

/*** Update phone1_number ***/
/*** added 9-02-03 ***/
UPDATE       a_mf_main                              
   SET       phone1_number =substr(phone1,7,4);
COMMIT;
/

/*** Update phone2_area_code ***/
/*** added 9-02-03 ***/
UPDATE       a_mf_main                              
   SET       phone2_area_code   =substr(phone2,1,3);
COMMIT;
/

/*** Update phone2_prefix ***/
/*** added 9-02-03 ***/
UPDATE       a_mf_main                              
   SET       phone2_prefix      = substr(phone2,4,3);
COMMIT;
/

/*** Update phone2_number ***/
/*** added 9-02-03 ***/
UPDATE       a_mf_main                              
   SET       phone2_number =substr(phone2,7,4);
COMMIT;
/

/*** Update Nulls ***/
UPDATE       a_mf_main
   SET       phone1_area_code    = '  '
   WHERE     phone1_area_code    IS NULL;
COMMIT;
/

UPDATE       a_mf_main
   SET       phone1_prefix    = '  '
   WHERE     phone1_prefix    IS NULL;
COMMIT;
/

UPDATE       a_mf_main
   SET       phone1_number    = '  '
   WHERE     phone1_number    IS NULL;
COMMIT;
/

UPDATE       a_mf_main
   SET       phone2_area_code    = '  '
   WHERE     phone2_area_code    IS NULL;
COMMIT;
/

UPDATE       a_mf_main
   SET       phone2_prefix    = '  '
   WHERE     phone2_prefix    IS NULL;
COMMIT;
/

UPDATE       a_mf_main
   SET       phone2_number    = '  '
   WHERE     phone2_number    IS NULL;
COMMIT;
/

/*** Delete where Phone1 Prefix Blank ***/
DELETE FROM a_mf_main
 WHERE phone1_prefix = ' ';
COMMIT;
/

/*** Delete where Phone1 Prefix Blank ***/
DELETE FROM a_mf_main
 WHERE phone1_prefix = '  ';
COMMIT;
/

/*** Delete where Phone1 Prefix Blank ***/
DELETE FROM a_mf_main
 WHERE phone1_prefix = '   ';
COMMIT;
/


/*** Degrees ***/
UPDATE      a_mf_main                  m
   SET      m.descript                 = 
   (SELECT  SUBSTR(d.degrees,1,20)
      FROM  a_dw_degree_count          d
     WHERE  m.hostid                   = d.id_number)
 WHERE      m.code4                    = 'Alumni';
COMMIT;
/

UPDATE      a_mf_main
   SET      descript        = ' '
 WHERE      descript        IS NULL;
COMMIT;
/

/*** Last Gift Date ***/
UPDATE     a_mf_main             m
   SET     m.date2               = 
   (SELECT MAX(p.date_of_record)
      FROM a_dw_pyramid          p
     WHERE m.hostid              = p.id_number
       AND p.flag_alumni         = 0);
COMMIT;
/

/*************************************/
/*** Format Combined Segment Field ***/
/*************************************/
/*** Update Combined Segment Field ***/
UPDATE     a_mf_main    g
   SET     g.a_comb_seg = 
   (SELECT m.a_comb_seg
      FROM a_aga_3      m
     WHERE m.id_number  = g.hostid);
COMMIT;
/

/*** Set flag_gift_cfy ***/
UPDATE a_mf_main
   SET flag_gift_cfy = 0;
COMMIT;
/

/*** Remove Nulls ***/
UPDATE    a_mf_main
   SET    relator   = ' '
   WHERE  relator   IS NULL;
COMMIT;
/

UPDATE    a_mf_main
   SET    spname   = ' '
   WHERE  spname   IS NULL;
COMMIT;
/

UPDATE    a_mf_main
   SET    date2   = ' '
   WHERE  date2   IS NULL;
COMMIT;
/


/*** Update Amount 3 - which is Ask Amount 2 ***/
/*** Null for now ***/
UPDATE      a_mf_main
   SET      amount3         = 0;
COMMIT;
/

/*** Update Amount 4 - which is Ask Amount 3 ***/
/*** Null for now ***/
UPDATE      a_mf_main
   SET      amount4         = 0;
COMMIT;
/

/*****************************/
/*****************************/
/*** Second and Third Asks ***/
/*****************************/
/*****************************/
/*** $7,500 and above ***/
UPDATE      a_mf_main
   SET      amount3     = 5000,
            amount4     = 2500
 WHERE      amount1     >= 7500;
COMMIT;
/

/*** $3,500 - $7,500 ***/
UPDATE      a_mf_main
   SET      amount3     = 2500,
            amount4     = 1000
 WHERE      amount1     BETWEEN 3500 and 7499.99;
COMMIT;
/

/*** $1,200 - $3,500 ***/
UPDATE      a_mf_main
   SET      amount3     = 1000,
            amount4     = 500
 WHERE      amount1     BETWEEN 1200 and 3499.99;
COMMIT;
/ 

/*** $700 - $1,200 ***/
UPDATE      a_mf_main
   SET      amount3     = 500,
            amount4     = 250
 WHERE      amount1     BETWEEN 700 and 1199.99;
COMMIT;
/

/*** $400 - $700 ***/
UPDATE      a_mf_main
   SET      amount3     = 250,
            amount4     = 100
 WHERE      amount1     BETWEEN 400 and 699.99;
COMMIT;
/

/*** $200 - $400 ***/
UPDATE      a_mf_main
   SET      amount3     = 100,
            amount4     = 50
 WHERE      amount1     BETWEEN 200 and 399.99;
COMMIT;
/

/*** $75 - $200 ***/
UPDATE      a_mf_main
   SET      amount3     = 50,
            amount4     = 25
 WHERE      amount1     BETWEEN 75 and 199.99;
COMMIT;
/

/*** $1 - $75 ***/
UPDATE      a_mf_main
   SET      amount3     = 25,
            amount4     = 15
 WHERE      amount1     BETWEEN 1 and 74.99;
COMMIT;
/

/**********************************************/
/*** Remove Volunteer's And Their Prospects ***/
/**********************************************/

/*** Update Volunteer's Prospect Flag ***/
/*** Shouldn't Be Solicited So Delete 
UPDATE     a_mf_main        m
   SET     flag_prospect    = 1
 WHERE     m.hostid         IN  
   (SELECT a.id_number
      FROM a_dw_assignment  a
     WHERE a.ass_type       NOT IN ('T','PP','PS','PT')
       AND a.ass_active_ind = 'Y');
COMMIT;
/
***/
UPDATE    a_mf_main
   SET    flag_prospect = 0
 WHERE    flag_prospect IS NULL;
COMMIT;
/

/*** Update Volunteer Flag ***/
/*** Shouldn't Be Solicited So Delete ***/
UPDATE          a_mf_main                   m
   SET          flag_volunteer              = 1
 WHERE          m.hostid                    IN  
   (SELECT      a.id_number
      FROM      committee                   a
     WHERE      a.committee_status_code     = 'A'
       AND      a.committee_code            IN 
       (SELECT  committee_code
          FROM  advance.tms_committee_table 
         WHERE  status_code                 = 'A'
           AND  committee_group_code        IN ('DEV','PC','TR')
           AND  committee_code              <> 'S2S'));
COMMIT;
/

UPDATE    a_mf_main
   SET    flag_volunteer = 0
 WHERE    flag_volunteer IS NULL;
COMMIT;
/

/*** Delete Volunteers and Prospects From File ***/
DELETE FROM a_mf_main
      WHERE flag_volunteer = 1
         OR flag_prospect  = 1;
COMMIT;
/

/*******************************/
/*** Add Reunion Information ***/
/*******************************/
/*** Add Class Chair to File ***/
UPDATE  a_mf_main
   SET  class_chair  = DECODE (code3, '1940','Harry Conger',           
                                      '1945','Delwyn Low',
                                      '1950','Larry Barrett',
                                      '1955','Dean Laudeman',
                                      '1960','Richard Egan',
                                      '1965','Allen Randle',
                                      '1970','George Off',
                                      '1975','Harvey Klingensmith',
                                      '1980','Julie Gibbs',
                                      '1985','Lanai Wolfe',
                                      '1990',' ',
                                      '1995','Scott Dickson',
                                      '2000',' ',      
                                             ' ')
 WHERE  code4         = 'Alumni';
COMMIT;
/

UPDATE  a_mf_main
   SET  class_chair  = ' '
 WHERE  class_chair  IS NULL;
COMMIT;
/

/*** Add Class Goal to File ***/
UPDATE  a_mf_main
   SET  class_goal   = DECODE (code3, '1940','$12,000',
                                      '1945','$2,000',
                                      '1950','$35,000',
                                      '1955','$40,000',
                                      '1960','$25,000',
                                      '1965','$35,000',
                                      '1970','$50,000',
                                      '1975','$25,000',
                                      '1980','$15,000',
                                      '1985','$15,000',
                                      '1990','$5,000',
                                      '1995','$5,000',
                                      '2000','$2,000',
                                             ' ')
 WHERE  code4         = 'Alumni';
COMMIT;
/

UPDATE  a_mf_main
   SET  class_goal  = ' '
 WHERE  class_goal  IS NULL;
COMMIT;
/

/*** Add Class Reunion to File ***/
UPDATE  a_mf_main
   SET  class_reunion = DECODE (code3, '1940','65th',
                                       '1945','60th',
                                       '1950','55th',
                                       '1955','50th',
                                       '1960','45th',
                                       '1965','40th',
                                       '1970','35th',
                                       '1975','30th',
                                       '1980','25th',
                                       '1985','20th',
                                       '1990','15th',
                                       '1995','10th',
                                              ' ')
 WHERE  code4         = 'Alumni';
COMMIT;
/

UPDATE  a_mf_main
   SET  class_reunion  = ' '
 WHERE  class_reunion  IS NULL;
COMMIT;
/


/*** Update Flag for Persons in Regional Zipcodes ***/
UPDATE      a_mf_main               m
   SET      code9                   = 
   (SELECT  'D'
      FROM  a_dw_regional_zips      r
     WHERE  SUBSTR(m.zipcode,1,5)   BETWEEN r.zip_start AND r.zip_end
       AND  r.active                = 1);
COMMIT;
/

UPDATE      a_mf_main               m
   SET      code9                   = ' '
 WHERE      code9                   IS NULL;
COMMIT;
/

/*** Move Mail Mail Name to Pname on Married Couples ***/
UPDATE      a_mf_main
   SET      pname       = SUBSTR(mail_mail_name,1,45),
            salutation  = SUBSTR(mail_sal,1,25)
   WHERE    spouseid    > ' ';
COMMIT;
/

/*******************************************************************/
/*** Need to grant these to role if user is able to access table ***/
/*******************************************************************/
GRANT ALTER  ON a_mf_main  TO ADVROLE;
/
GRANT DELETE ON a_mf_main  TO ADVROLE;
/
GRANT INSERT ON a_mf_main  TO ADVROLE;
/
GRANT SELECT ON a_mf_main  TO ADVROLE;
/
GRANT UPDATE ON a_mf_main  TO ADVROLE;
/

ANALYZE TABLE ADVANCE.a_mf_main COMPUTE STATISTICS;
/

COMMIT;
/

EXIT;
/

