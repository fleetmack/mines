/*************************************/
/*************************************/
/*** Creates Mail and Report Lists ***/
/*************************************/
/*************************************/

/*************************************************************/
/************* Needs Editing Based on Request ****************/
/*** Create File of ID's that will be used in this mailing ***/
/*************************************************************/
/*************************************************************/
DROP TABLE    a_std_rcptn_1;
COMMIT;
/

/*** Create Table and Insert ID's ***/
CREATE TABLE a_std_rcptn_1          AS
(--BOG
select id_number
  from committee
 where committee_code IN ('FBOG','FBOGA','FBOGD','FBOGE','FBOGG','FBOGN')
   and committee_status_code IN ('A')
UNION
--BOT
select id_number
  from committee
 where committee_code = 'BOT'
   and committee_status_code = 'A'
UNION
--CO and WY alumni rated $100k and up with affinity ratings of 1 or 2
select  dwag.id_number
               from a_dw_affinity dwa,
                    a_dw_address_good dwag,
                    a_dw_demop_prof  dp
              where dwag.id_number = dwa.id_number
                and dp.id_number = dwag.id_number
                and substr(donor_continuum,1,1) IN ('1','2')
                and dwag.record_type_code = 'AL'
                and dwag.p_state_code IN ('CO','WY')
                and dp.rp_mgc_value >= 100000
UNION
--MCS (CO and WY alumni only)
select id_number
  from a_dw_gift_clubs
  where record_type_code = 'AL'
    and (flag_cs_notif = 1 or flag_cs = 1)
    and id_number IN
        (select id_number
           from a_dw_address_good
          where p_state_code IN ('CO','WY'))
UNION
--Guggenheim (CO and WY alumni only)
--PC (Investing member) $10k and up FY11 and/or 12 (CO and WY alumni only)
SELECT id_number 
       FROM a_dw_gift_clubs
      WHERE (joint_total_cfy >= 10000 OR joint_total_pfy >= 10000)
        AND record_type_code = 'AL'
        AND id_number IN
            (SELECT id_number from a_dw_address_good where p_state_code IN ('CO','WY'))
UNION            
--CSMAA Board President (John Howe)
select id_number
  from entity
 where id_number = '0000012657'        
UNION
--Make sure those who RSVP'd earlier are still included
select id_number
  from entity
 where id_number IN ('0000012890','0000028979')
UNION
--First Tuesday
select id_number
  from mailing_list
 where mail_list_code = 'FTUEG'
UNION
--Plus entities listed below
SELECT id_number
  FROM entity
 WHERE id_number IN
('0000037837','0000006352','0000004876','0000023219','0000060110','0000020309','0000054799','0000029669','0000022366','0000022716','0000022556','0000013294','0000010547','0000024519','0000043706','0000054331','0000019975','0000021322','0000054660','0000022593','0000028978','0000026508','0000010880','0000036994','0000037523','0000010762','0000017680','0000011669','0000043244','0000032372','0000054803','0000033022','0000026508','0000043706','0000043707','0000022593','0000054331','0000043710','0000050053','0000054647','0000054801','0000043711','0000023490','0000043715','0000033658','0000029462','0000033798','0000012100','0000037488','0000023219','0000037510','0000043280','0000009873','0000039170','0000037499','0000029669','0000039842','0000022728','0000037850','0000029769','0000019975','0000011282','0000041437','0000037524','0000037941','0000011470','0000006929','0000037520','0000043266','0000010547','0000012890','0000037527','0000010808','0000047710','0000037538','0000037945','0000047716','0000005509','0000037955','0000037838','0000037944','0000043261','0000010865','0000012568','0000034950','0000036994','0000037537','0000037502','0000037599','0000057369','0000050187','0000039171','0000053358','0000022557','0000011249','0000012875','0000038641','0000053897','0000051131','0000054665','0000035069','0000016544','0000015132','0000035737','0000060121','0000060122','0000005509','0000007900','0000010808','0000011061',
'0000011251','0000011425','0000012394','0000015132','0000043679','0000040537','0000019919','0000020026','0000012742','0000006607','0000060440','0000003402','0000004900','0000035737','0000037510','0000054790','0000054791','0000060437','0000054795','0000060442','0000041069','0000054796','0000060445','0000060447','0000032372','0000011849','0000060448','0000054797','0000011470','0000054799','0000054800','0000060449','0000054801','0000060450','0000054802','0000060446','0000060444','0000040305','0000060443','0000060441','0000054804','0000035436')
MINUS
--do not include
select id_number
  from entity
 where id_number IN
    ('0000015391','0000003553','0000004222')
);
COMMIT;
/

/*** Remove Dups by Inserting into file 2 ***/
DROP TABLE    a_std_rcptn_2;
COMMIT;
/

CREATE TABLE  a_std_rcptn_2                    AS
     SELECT   DISTINCT a.id_number
       FROM   a_std_rcptn_1                    a;
COMMIT;
/

/*******************************************************/
/*********** Needs Editing Based on Request ************/
/*** Set Flags for Inclusion/Exlusions of Final List ***/
/*******************************************************/
/*******************************************************/
DECLARE
   x_not_active   VARCHAR2(1) := 'T';  -- Exclude if record isn't active
   x_deceased     VARCHAR2(1) := 'T';  -- Exclude Deceased
   x_dns          VARCHAR2(1) := 'F';  -- Exclude Do Not Solicit
   x_dnp          VARCHAR2(1) := 'F';  -- Exclude Do Not Phone
   x_dni          VARCHAR2(1) := 'T';  -- Exclude Do Not Invite
   x_omit         VARCHAR2(1) := 'T';  -- Exclude Omit from Mailings
   x_no_address   VARCHAR2(1) := 'T';  -- Exclude if no address
   x_pref_address VARCHAR2(1) := 'T';  -- Exclude if no good preferred address
   x_foreign      VARCHAR2(1) := 'F';  -- Exclude All Foreign
   x_domestic     VARCHAR2(1) := 'F';  -- Exclude All Domestic
   x_foreign_can  VARCHAR2(1) := 'F';  -- Exclude All Foreign Except Canada
   x_pref_phone   VARCHAR2(1) := 'F';  -- Exclude People without a preferred phone number   
   x_no_phone     VARCHAR2(1) := 'F';  -- Exlcude People with no phone numbers
   x_gift_cfy     VARCHAR2(1) := 'F';  -- Exclude Current Fiscal Year Givers
   x_mem_only     VARCHAR2(1) := 'F';  -- Exclude Memorial Only Givers
   x_mem_only_nw  VARCHAR2(1) := 'F';  -- Exclude Non Widow Memorial Only Givers
   x_parent       VARCHAR2(1) := 'F';  -- Exclude Parents
   x_minec        VARCHAR2(1) := 'F';  -- Exclude Min Ec Graduate Degree Only Graduates
   x_reun         VARCHAR2(1) := 'F';  -- Exclude Reunion 
   x_yalum        VARCHAR2(1) := 'F';  -- Exclude Young Alumni
   x_grad_only    VARCHAR2(1) := 'F';  -- Exclude Graduate Degree only Holders
   x_corpconc     VARCHAR2(1) := 'F';  -- Exclude Current Corporate Contacts (Non Alumni)
   x_corpconf     VARCHAR2(1) := 'F';  -- Exclude Former Corporate Contacts (Non Alumni)
   x_matchcontc   VARCHAR2(1) := 'F';  -- Exclude Current Matching Gift Contacts (Non Alumni)
   x_matchcontf   VARCHAR2(1) := 'F';  -- Exclude Former Matching Gift Contacts (Non Alumni)
   x_empcurr      VARCHAR2(1) := 'F';  -- Exclude Current Employees
   x_empprev      VARCHAR2(1) := 'F';  -- Exclude Former Employees   
   x_empprevna    VARCHAR2(1) := 'F';  -- Exclude Former Non Alumni Employees 
   x_indonly      VARCHAR2(1) := 'T';  -- Remove Corporations, Foundations, and Organizations
   

BEGIN
   /*** Not an Active Record ***/
   DELETE FROM      a_std_rcptn_2               a
         WHERE      x_not_active          = 'T'
           AND      a.id_number           NOT IN 
       (SELECT      e.id_number
          FROM      entity                e
         WHERE      e.record_status_code  = 'A');
          
   /*** No Address at all ***/
   DELETE FROM      a_std_rcptn_2               a
         WHERE      x_no_address          = 'T'
           AND      a.id_number           NOT IN 
       (SELECT      dw.id_number
          FROM      a_dw_address_good     dw);

   /*** Delete if Deceased ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_deceased            = 'T'
           AND   a.id_number           IN 
       (SELECT   e.id_number
          FROM   entity                e
         WHERE   e.record_status_code  = 'D');
          
   /*** Delete if Coded Do Not Solicit ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_dns                 = 'T'
           AND   a.id_number           IN 
       (SELECT   ml.id_number
          FROM   mailing_list          ml
         WHERE   ml.mail_list_code     = 'DNS');

   /*** Delete if Coded Do Not Phone ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_dnp                 = 'T'
           AND   a.id_number           IN 
       (SELECT   ml.id_number
          FROM   mailing_list          ml
         WHERE   ml.mail_list_code     = 'DNP');

   /*** Delete if Coded Do Not Invite ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_dni                 = 'T'
           AND   a.id_number           IN 
       (SELECT   ml.id_number
          FROM   mailing_list          ml
         WHERE   ml.mail_list_code     = 'DNI');

   /*** Delete if Coded Omit from Mailings ***/
   DELETE FROM   a_std_rcptn_2                  a
         WHERE   x_omit                   = 'T'
           AND   a.id_number              IN 
       (SELECT   ml.id_number
          FROM   mailing_list             ml
         WHERE   ml.mail_list_code        = 'DNM');

   /*** Delete if No Good Preferred Address ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_pref_address        = 'T'
           AND   a.id_number           IN 
       (SELECT   dw.id_number
          FROM   a_dw_address_good     dw
         WHERE   dw.p_count            = 0);
   
   /*** Delete if No Good Preferred Address ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_pref_address        = 'T'
           AND   a.id_number           IN 
       (SELECT   dw.id_number
          FROM   a_dw_address_good     dw
         WHERE   dw.p_count            = 1
           AND   dw.p_zipcode          = ' '
           AND   dw.p_country_desc     = ' ');
   
   /*** Delete if Foreign ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_foreign             = 'T'
           AND   a.id_number           IN 
       (SELECT   dw.id_number
          FROM   a_dw_address_good     dw
         WHERE   dw.p_flag_foreign     = 1);

   /*** Delete if Domestic ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_domestic            = 'T'
           AND   a.id_number           IN 
       (SELECT   dw.id_number
          FROM   a_dw_address_good     dw
         WHERE   dw.p_flag_foreign     <> 1);

   /*** Delete if Foreign except Canada***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_foreign_can         = 'T'
           AND   a.id_number           IN 
       (SELECT   dw.id_number
          FROM   a_dw_address_good     dw
         WHERE   dw.p_flag_foreign     = 1
           AND   dw.p_country_code     <> 'CD');

   /*** Delete if No Preferred Phone Number ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_pref_phone          = 'T'
           AND   a.id_number           IN 
       (SELECT   dw.id_number
          FROM   a_dw_address_good     dw
         WHERE   dw.p_phone_formatted  = ' ');

   /*** Delete if No Home or Business Phone Numbers ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_no_phone            = 'T'
           AND   a.id_number           IN 
       (SELECT   dw.id_number
          FROM   a_dw_address_good     dw
         WHERE   dw.h_phone_formatted  = ' '
           AND   dw.b_phone_formatted  = ' ');

   /*** Exclude CFY Givers ***/
   DELETE FROM   a_std_rcptn_2                    a
         WHERE   x_gift_cfy                 = 'T'
           AND   a.id_number                IN
       (SELECT   cfy.id_number
          FROM   a_dw_pyramid_cfy           cfy);
   
   /***Exclude Memorial Only Givers ***/
   DELETE FROM   a_std_rcptn_2              a
         WHERE   x_mem_only           ='T'
           AND   a.id_number          IN
       (SELECT   m.id_number          
          FROM   a_dw_mem_only        m
         WHERE   m.record_type_code   <> 'AL');

   /***Exclude Non Widow Memorial Only Givers ***/
   DELETE FROM   a_std_rcptn_2              a
         WHERE   x_mem_only_nw        ='T'
           AND   a.id_number          IN
       (SELECT   m.id_number          
          FROM   a_dw_mem_only        m
         WHERE   m.record_type_code   <> 'AL')
           AND   a.id_number          NOT IN
       (SELECT   w.id_number
          FROM   entity_record_type   w
         WHERE   w.record_type_code   = 'WI');

   /*** Delete if Parent ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_parent              = 'T'
           AND   a.id_number           IN 
       (SELECT   e.id_number
          FROM   entity                e
         WHERE   e.record_type_code    IN ('PA','PP','PX'));

   /*** Delete if Only Degree is Graduate Level MinEc Degree ***/
   DELETE FROM   a_std_rcptn_2               c
         WHERE   x_minec               = 'T'
           AND   c.id_number           IN 
       (SELECT   a.id_number
          FROM   a_dw_degree_count     a     
         WHERE   a.cnt_total           = a.cnt_minec);

   /*** Delete All Reunion ***/
   DELETE FROM   a_std_rcptn_2                a
         WHERE   x_reun                 = 'T'
           AND   a.id_number            IN
       (SELECT   e.id_number
          FROM   entity                 e
         WHERE   e.pref_class_year      NOT IN 
       (SELECT   r.year
          FROM   a_dw_reunion_years_cfy r)
           AND   e.record_type_code     = 'AL');

   /*** Delete All Young Alumni ***/
   DELETE FROM   a_std_rcptn_2                a
         WHERE   x_yalum                = 'T'
           AND   a.id_number            IN
       (SELECT   e.id_number
          FROM   entity                 e
         WHERE   e.pref_class_year      NOT IN 
       (SELECT   y.year
          FROM   a_dw_young_alum        y)
           AND   e.record_type_code     = 'AL');

   /*** Delete Graduate Degree Only Holders ***/
   DELETE FROM   a_std_rcptn_2               c
         WHERE   x_grad_only           = 'T'
           AND   c.id_number           IN 
       (SELECT   a.id_number
          FROM   a_dw_degree_count     a     
         WHERE   a.cnt_total           = a.cnt_grad);

   /*** Delete if Current Non Alumni Corporate Contact (from Relationship) ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_corpconc            = 'T'
           AND   a.id_number           IN 
       (SELECT   r.id_number
          FROM   relationship          r,
                 entity                e
         WHERE   r.relation_type_code  IN ('1I','I1')
           AND   e.record_type_code    <> 'AL'
           AND   r.id_number           = e.id_number);

   /*** Delete if Current Non Alumni Corporate Contact (from Org Contact) ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_corpconc            = 'T'
           AND   a.id_number           IN 
       (SELECT   c.contact_id_number
          FROM   contact               c,
                 entity                e
         WHERE   c.contact_code        IN ('CC')
           AND   e.record_type_code    <> 'AL'
           AND   c.contact_id_number  = e.id_number);

   /*** Delete if Former Non Alumni Corporate Contact ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_corpconf            = 'T'
           AND   a.id_number           IN 
       (SELECT   r.id_number
          FROM   relationship          r,
                 entity                e
         WHERE   r.relation_type_code  IN ('0J','J0')
           AND   e.record_type_code    <> 'AL'
           AND   r.id_number           = e.id_number);

   /*** Delete if Former Non Alumni Corporate Contact ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_corpconf            = 'T'
           AND   a.id_number           IN 
       (SELECT   c.contact_id_number
          FROM   contact               c,
                 entity                e
         WHERE   c.contact_code        IN ('FC')
           AND   e.record_type_code    <> 'AL'
           AND   c.contact_id_number   = e.id_number);

   /*** Delete if Current Non Alumni Matching Gift Contact ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_matchcontc          = 'T'
           AND   a.id_number           IN 
       (SELECT   r.id_number
          FROM   relationship          r,
                 entity                e
         WHERE   r.relation_type_code  IN ('J7','7J')
           AND   e.record_type_code    <> 'AL'
           AND   r.id_number           = e.id_number);

   /*** Delete if Former Non Alumni Matching Gift Contact ***/
   DELETE FROM   a_std_rcptn_2               a
         WHERE   x_matchcontf          = 'T'
           AND   a.id_number           IN 
       (SELECT   r.id_number
          FROM   relationship          r,
                 entity                e
         WHERE   r.relation_type_code  IN ('C8','8C')
           AND   e.record_type_code    <> 'AL'
           AND   r.id_number           = e.id_number);

   /*** Delete if Current Faculty Staff ***/
   DELETE FROM   a_std_rcptn_2                        a
         WHERE   x_empcurr                      = 'T'
           AND   a.id_number                    IN 
       (SELECT   j.id_number
          FROM   a_dw_faculty_staff_current     j);

   /*** Delete if Former Faculty Staff ***/
   DELETE FROM   a_std_rcptn_2                        a
         WHERE   x_empprev                      = 'T'
           AND   a.id_number                    IN 
       (SELECT   j.id_number
          FROM   a_dw_jobs                      j
         WHERE   j.faculty_staff_status         IN('Previous','Retired'));   
         
   /*** Delete if Former Non Alumni Faculty Staff ***/
   DELETE FROM   a_std_rcptn_2                        a
         WHERE   x_empprevna                    = 'T'
           AND   a.id_number                    IN 
       (SELECT   j.id_number
          FROM   a_dw_jobs                      j,
                 entity                         e
         WHERE   j.faculty_staff_status         IN('Previous','Retired')
           AND   e.record_type_code             <> 'AL'
           AND   j.id_number                    = e.id_number);

   /*** Remove Corporations, Foundations, and Organizations ***/
   DELETE FROM   a_std_rcptn_2                        a
         WHERE   x_indonly                      = 'T'
           AND   a.id_number                    IN 
       (SELECT   e.id_number
          FROM   entity                         e
         WHERE   e.person_or_org                = 'O');
   
END;
/

/****************************/
/****************************/
/***  Create Import File  ***/
/*** Includes Spouse Id's ***/
/****************************/
/****************************/
DROP TABLE a_rcptn_import;
COMMIT;
/

CREATE TABLE a_rcptn_import  AS
     (SELECT id_number
        FROM a_std_rcptn_2);
COMMIT;
/

/************************/
/************************/
/*** Create Mail File ***/
/************************/
DROP TABLE    a_std_rcptn_3;
COMMIT;
/

CREATE TABLE a_std_rcptn_3
   (id_number              VARCHAR2(10)  NOT NULL,
   username                 VARCHAR2(50) NULL,
   person_or_org           CHAR(1)       NULL,
   record_type_code        VARCHAR2(2)   NULL,
   spouse_record_type_code VARCHAR2(2)   NULL,
   flag_spouse_on_list     VARCHAR2(1)   NULL,
   record_type_desc        VARCHAR2(40)  NULL, 
   record_status_code      CHAR(1)       NULL,
   pref_class_year         VARCHAR2(4)   NULL,
   spouse_id               VARCHAR2(10)  NULL,
   pref_mail_name          VARCHAR2(60)  NULL,
   mail_mail_name          VARCHAR2(70)  NULL,
   pref_name_sort          VARCHAR2(60)  NULL,
   marital_status_code     CHAR(1)       NULL,
   jnt_mailings_ind        CHAR(1)       NULL,
   degrees                 VARCHAR2(100) NULL,
   p_addr_type_code        CHAR(1)       NULL,
   p_care_of               VARCHAR2(45)  NULL,
   p_company_name_1        VARCHAR2(60)  NULL,
   p_company_name_2        VARCHAR2(60)  NULL,
   p_business_title        VARCHAR2(60)  NULL,
   p_street1               VARCHAR2(40)  NULL,
   p_street2               VARCHAR2(40)  NULL,
   p_street3               VARCHAR2(40)  NULL,
   p_city                  VARCHAR2(30)  NULL,
   p_state_code            VARCHAR2(3)   NULL,
   p_state_desc            VARCHAR2(40)  NULL,
   p_zipcode               VARCHAR2(10)  NULL,
   p_cityline              VARCHAR2(60)  NULL,
   p_foreign_cityzip       VARCHAR2(40)  NULL,
   p_country_code          VARCHAR2(5)   NULL,
   p_country_desc          VARCHAR2(40)  NULL,
   p_flag_foreign          NUMBER(1)     NULL,
   p_email_address         VARCHAR2(60)  NULL,
   p_phone_status          VARCHAR2(3)   NULL,
   p_phone_area_code       VARCHAR2(3)   NULL,
   p_phone_number          VARCHAR2(7)   NULL,
   p_phone_extension       VARCHAR2(5)   NULL,
   p_phone_formatted       VARCHAR2(40)  NULL,
   p_phone_unlisted_ind    CHAR(1)       NULL,
   p_fax_formatted         VARCHAR2(40)  NULL,
   p_foreign_phone         VARCHAR2(22)  NULL,
   p_foreign_fax           VARCHAR2(22)  NULL,
   b_care_of               VARCHAR2(40)  NULL,
   b_company_name_1        VARCHAR2(80)  NULL,
   b_company_name_2        VARCHAR2(80)  NULL,
   b_business_title        VARCHAR2(80)  NULL,
   b_street1               VARCHAR2(40)  NULL,
   b_street2               VARCHAR2(40)  NULL,
   b_street3               VARCHAR2(40)  NULL,
   b_city                  VARCHAR2(30)  NULL,
   b_state_code            VARCHAR2(3)   NULL,
   b_state_desc            VARCHAR2(40)  NULL,
   b_zipcode               VARCHAR2(10)  NULL,
   b_cityline              VARCHAR2(60)  NULL,
   b_foreign_cityzip       VARCHAR2(40)  NULL,
   b_country_code          VARCHAR2(5)   NULL,
   b_country_desc          VARCHAR2(40)  NULL,
   b_flag_foreign          VARCHAR2(1)   NULL,
   b_email_address         VARCHAR2(60)  NULL,
   b_phone_status          VARCHAR2(3)   NULL,
   b_phone_area_code       VARCHAR2(3)   NULL,
   b_phone_number          VARCHAR2(7)   NULL,
   b_phone_extension       VARCHAR2(5)   NULL,
   b_phone_formatted       VARCHAR2(40)  NULL,
   b_phone_unlisted_ind    CHAR(1)       NULL,
   b_fax_formatted         VARCHAR2(40)  NULL,
   b_foreign_phone         VARCHAR2(40)  NULL,
   b_foreign_fax           VARCHAR2(22)  NULL,
   flag_omit_from_mail     NUMBER(1)     NULL,
   flag_dns                NUMBER(1)     NULL,
   flag_dnp                NUMBER(1)     NULL,
   flag_reunion            NUMBER(1)     NULL,
   flag_ya                 NUMBER(1)     NULL,
   flag_fac_staff_curr     NUMBER(1)     NULL,
   flag_fac_staff_form     NUMBER(1)     NULL,
   flag_del_spouse         NUMBER(1)     NULL,
   ass_pref_mail_name      VARCHAR2(60)  NULL,
   criteria                VARCHAR2(100));
/

INSERT INTO   a_std_rcptn_3        (id_number)
   (SELECT    b.id_number
      FROM    a_std_rcptn_2        b);
COMMIT;
/

/**************/
/**************/
/*** Entity ***/
/**************/
/**************/
UPDATE       a_std_rcptn_3                 dw
   SET      (dw.person_or_org,
             dw.record_type_code,
             dw.record_status_code,
             dw.pref_class_year,
             dw.pref_mail_name,
             dw.pref_name_sort,
             dw.marital_status_code,
             dw.spouse_id,
             dw.jnt_mailings_ind,
             dw.flag_del_spouse) = 
   (SELECT   e.person_or_org,
             e.record_type_code,
             e.record_status_code,
             e.pref_class_year,
             e.pref_mail_name,
             e.pref_name_sort,
             e.marital_status_code,
             e.spouse_id_number,
             e.jnt_mailings_ind,
             0
       FROM  entity                  e 
       WHERE dw.id_number            = e.id_number);
COMMIT;
/

/******** iMods Username ********************/
UPDATE a_std_rcptn_3            pc
SET   pc.username =  NVL(
    (SELECT t.username
         FROM a_temp_imods_usernames t
     WHERE t.id_number = pc.id_number),' ');
COMMIT;

/*********************************************/
/*** Update Entity Record Type Description ***/
/*********************************************/
UPDATE   a_std_rcptn_3                  pc
   SET   pc.record_type_desc      = '1. Alumni'
   WHERE pc.record_type_code      = 'AL';
COMMIT;
/

UPDATE   a_std_rcptn_3                  pc
   SET   pc.record_type_desc      = '2. Friend'
   WHERE pc.record_type_code      IN('FR','FS','PA','PP','PX','ST','GS');
COMMIT;
/

UPDATE   a_std_rcptn_3                  pc
   SET   pc.record_type_desc      = '4. Corporation'
   WHERE pc.record_type_code      IN('CF','CP');
COMMIT;
/

UPDATE   a_std_rcptn_3                  pc
   SET   pc.record_type_desc      = '5. Foundation/other orgs'
   WHERE pc.record_type_code      IN('ES','FD','FO','GV','OO','TR');
COMMIT;
/

/*** Add Spouse Record Type Code ***/
UPDATE  a_std_rcptn_3   b
   SET  b.spouse_record_type_code =
    NVL((SELECT es.record_type_code
       FROM entity e,
            entity es
      WHERE e.id_number = b.id_number
        AND e.spouse_id_number = es.id_number),' ');
COMMIT;
/        

/*** Add Spouse on List flag ***/
UPDATE  a_std_rcptn_3   b
   SET  b.flag_spouse_on_list = '1'
 WHERE  b.spouse_id IN
    (SELECT b2.id_number
       FROM a_std_rcptn_3 b2);
COMMIT;

UPDATE a_std_rcptn_3
   SET flag_spouse_on_list = '0'
 WHERE flag_spouse_on_list IS NULL;
 /

/*** Update with Preferred Mailing Address and Phone Number ***/
UPDATE   a_std_rcptn_3              b
SET      (b.p_addr_type_code,
         b.p_care_of,
         b.p_company_name_1,
         b.p_company_name_2,
         b.p_business_title,
         b.p_street1,
         b.p_street2,
         b.p_street3,
         b.p_city,
         b.p_state_code,
         b.p_state_desc,
         b.p_zipcode,
         b.p_cityline,
         b.p_foreign_cityzip,
         b.p_country_code,
         b.p_country_desc,
         b.p_flag_foreign,
         b.p_email_address,
         b.p_phone_status,
         b.p_phone_area_code,
         b.p_phone_number,
         b.p_phone_extension,
         b.p_phone_formatted,
         b.p_phone_unlisted_ind,
         b.p_fax_formatted,
         b.p_foreign_phone,
         b.p_foreign_fax,
         b_care_of,
         b.b_company_name_1,
         b.b_company_name_2,
         b.b_business_title,
         b.b_street1,
         b.b_street2,
         b.b_street3,
         b.b_city,
         b.b_state_code,
         b.b_state_desc,
         b.b_zipcode,
         b.b_cityline,
         b.b_foreign_cityzip,
         b.b_country_code,
         b.b_country_desc,
         b.b_flag_foreign,
         b.b_email_address,
         b.b_phone_status,
         b.b_phone_area_code,
         b.b_phone_number,
         b.b_phone_extension,
         b.b_phone_formatted,
         b.b_phone_unlisted_ind,
         b.b_fax_formatted,
         b.b_foreign_phone,
         b.b_foreign_fax)         =
 (SELECT a.p_addr_type_code,
         a.p_care_of,
         a.p_company_name_1,
         a.p_company_name_2,
         a.p_business_title,
         a.p_street1,
         a.p_street2,
         a.p_street3,
         a.p_city,
         a.p_state_code,
         a.p_state_desc,
         a.p_zipcode,
         a.p_cityline,
         a.p_foreign_cityzip,
         a.p_country_code,
         a.p_country_desc,
         a.p_flag_foreign,
         a.p_email_address,
         a.p_phone_status,
         a.p_phone_area_code,
         a.p_phone_number,
         a.p_phone_extension,
         a.p_phone_formatted,
         a.p_phone_unlisted_ind,
         a.p_fax_formatted,
         a.p_foreign_phone,
         a.p_foreign_fax,
         a.b_care_of,
         a.b_company_name_1,
         a.b_company_name_2,
         a.b_business_title,
         a.b_street1,
         a.b_street2,
         a.b_street3,
         a.b_city,
         a.b_state_code,
         a.b_state_desc,
         a.b_zipcode,
         a.b_cityline,
         a.b_foreign_cityzip,
         a.b_country_code,
         a.b_country_desc,
         a.b_flag_foreign,
         a.b_email_address,
         a.b_phone_status,
         a.b_phone_area_code,
         a.b_phone_number,
         a.b_phone_extension,
         a.b_phone_formatted,
         a.b_phone_unlisted_ind,
         a.b_fax_formatted,
         a.b_foreign_phone,
         a.b_foreign_fax
    FROM a_dw_address_good        a
   WHERE a.id_number              = b.id_number);
COMMIT;
/

/*** Add their criteria 
UPDATE a_std_rcptn_3  r
   SET r.criteria =
   (SELECT
   (CASE
    WHEN r.id_number IN (select id_number from committee where committee_code IN ('FBOG','FBOGA','FBOGD','FBOGE','FBOGG','FBOGN')and committee_status_code                         IN ('A'))
        THEN 'BOG'
    WHEN r.id_number IN (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A')
        THEN 'BOT'
    WHEN r.id_number IN (SELECT id_number FROM a_dw_demop_prof WHERE p_state_code IN ('CO','WY') AND record_type_code = 'AL' AND rp_mgc_value >= 100000)
        THEN 'CO and WY alumni rated $100k and up'
    WHEN r.id_number IN (select id_number from a_dw_gift_clubs where record_type_code = 'AL'and (flag_cs_notif = 1 or flag_cs = 1)) 
        THEN 'MCS Alumni'
    WHEN r.id_number IN (SELECT id_number FROM a_dw_gift_clubs WHERE (joint_total_cfy >= 10000 OR joint_total_pfy >= 10000) AND record_type_code = 'AL')
        THEN 'PC (Investing member) $10k and up FY11 and/or 12 (alumni only)'
    WHEN r.id_number IN (select id_number from entity where id_number = '0000012657') 
        THEN 'CSMAA Board President'
    WHEN r.id_number IN (select id_number from mailing_list where mail_list_code = 'FTUEG')
        THEN 'First Tuesday'
    WHEN r.id_number IN ('0000037837','0000006352','0000004876','0000023219','0000060110','0000020309','0000054799','0000029669','0000022366','0000022716','0000022556','0000013294',
'0000010547','0000024519','0000043706','0000054331','0000019975','0000021322','0000054660','0000022593','0000028978','0000026508','0000010880','0000036994',
'0000037523','0000010762','0000017680','0000011669','0000043244','0000032372','0000054803','0000033022','0000026508','0000043706','0000043707','0000022593',
'0000054331','0000043710','0000050053','0000054647','0000054801','0000043711','0000023490','0000043715','0000033658','0000029462','0000033798','0000012100',
'0000037488','0000023219','0000037510','0000043280','0000009873','0000039170','0000037499','0000029669','0000039842','0000022728','0000037850','0000029769',
'0000019975','0000011282','0000041437','0000037524','0000037941','0000011470','0000006929','0000037520','0000043266','0000010547','0000012890','0000037527',
'0000010808','0000047710','0000037538','0000037945','0000047716','0000005509','0000037955','0000037838','0000037944','0000043261','0000010865','0000012568',
'0000034950','0000036994','0000037537','0000037502','0000037599','0000057369','0000050187','0000039171','0000053358','0000022557','0000011249','0000012875',
'0000038641','0000053897','0000051131','0000054665','0000035069','0000016544','0000015132','0000035737','0000060121','0000060122')      
        THEN 'Hard-Coded ID'
    END)
    FROM dual);
commit;    
***/

/**************************************************************/
/*** Update Delete Spouse Flag - Not living at same address ***/
/**************************************************************/
UPDATE      a_std_rcptn_3             a
   SET      flag_del_spouse     = 1
   WHERE    a.id_number         IN
   (SELECT  b.id_number
      FROM  a_std_rcptn_3             b
     WHERE  b.jnt_mailings_ind  = 'Y'
       AND  b.spouse_id         > ' ');
COMMIT;
/

/*************************************/
/*************************************/
/*** Mail Mail Name and Salutation ***/
/*************************************/
/*************************************/
UPDATE      a_std_rcptn_3                 s
   SET      s.mail_mail_name        =
   (SELECT  n.comb_mail_name
      FROM  a_dw_names              n         
     WHERE  n.id_number             = s.id_number);
COMMIT;
/
  
/********************/
/********************/
/*** Update Flags ***/
/********************/
/********************/
/*** Omit From Mailings Flag ***/
UPDATE    a_std_rcptn_3                      dw
   SET    dw.flag_omit_from_mail       = 1
   WHERE  dw.id_number                 IN
  (SELECT ml.id_number
    FROM  mailing_list                 ml
   WHERE  ml.mail_list_code            = 'DNM');
COMMIT;
/

/*** Remove Nulls ***/
UPDATE    a_std_rcptn_3
   SET    flag_omit_from_mail      = 0
 WHERE    flag_omit_from_mail      IS NULL;
COMMIT;
/

/*** Do Not Solicit ***/
UPDATE    a_std_rcptn_3                      dw
   SET    dw.flag_dns                  = 1
   WHERE  dw.id_number                 IN
  (SELECT ml.id_number
    FROM  mailing_list                 ml
   WHERE  ml.mail_list_code            = 'DNS');
COMMIT;
/

/*** Remove Nulls ***/
UPDATE    a_std_rcptn_3
   SET    flag_dns      = 0
 WHERE    flag_dns      IS NULL;
COMMIT;
/

/*** Do No Mail ***/
UPDATE    a_std_rcptn_3                      dw
   SET    dw.flag_dnp                  = 1
   WHERE  dw.id_number                 IN
  (SELECT ml.id_number
    FROM  mailing_list                 ml
   WHERE  ml.mail_list_code            = 'DNP');
COMMIT;
/

/*** Remove Nulls ***/
UPDATE    a_std_rcptn_3
   SET    flag_dnp      = 0
 WHERE    flag_dnp      IS NULL;
COMMIT;
/

/*** Reunion ***/
UPDATE    a_std_rcptn_3                      dw
   SET    dw.flag_reunion              = 1
   WHERE  dw.record_type_code          = 'AL'
     AND  dw.pref_class_year           IN
  (SELECT r.year
    FROM  a_dw_reunion_years_cfy       r);
COMMIT;
/

/*** Remove Nulls ***/
UPDATE    a_std_rcptn_3
   SET    flag_reunion      = 0
 WHERE    flag_reunion      IS NULL;
COMMIT;
/

/*** YA ***/
UPDATE    a_std_rcptn_3                      dw
   SET    dw.flag_ya                   = 1
   WHERE  dw.record_type_code          = 'AL'
     AND  dw.pref_class_year           IN
  (SELECT y.year
    FROM  a_dw_young_alum              y);
COMMIT;
/

/*** Remove Nulls ***/
UPDATE    a_std_rcptn_3
   SET    flag_ya      = 0
 WHERE    flag_ya      IS NULL;
COMMIT;
/

/*** Current Faculty Staff ***/
UPDATE    a_std_rcptn_3                      dw
   SET    dw.flag_fac_staff_curr       = 1
   WHERE  dw.id_number                 IN
  (SELECT j.id_number
   FROM   a_dw_faculty_staff_current   j);
COMMIT;
/

/*** Remove Nulls ***/
UPDATE    a_std_rcptn_3
   SET    flag_fac_staff_curr      = 0
 WHERE    flag_fac_staff_curr      IS NULL;
COMMIT;
/

/*** Former Faculty Staff ***/
UPDATE    a_std_rcptn_3                      dw
   SET    dw.flag_fac_staff_form       = 1
   WHERE  dw.id_number                 IN
  (SELECT j.id_number
   FROM   a_dw_jobs                    j
  WHERE   j.faculty_staff_status       IN('Previous','Retired'));
COMMIT;
/

/*** Remove Nulls ***/
UPDATE    a_std_rcptn_3
   SET    flag_fac_staff_form      = 0
 WHERE    flag_fac_staff_form      IS NULL;
COMMIT;
/

/**********************/
/*** Update Degrees ***/
/**********************/
UPDATE  a_std_rcptn_3                 s
   SET  s.degrees               = NVL(
   (SELECT d.degrees
      FROM a_dw_degree_count    d
     WHERE s.id_number          = d.id_number),' ');
COMMIT;
/

/*********************************/
/*** Update Assignment Manager ***/
/*********************************/
UPDATE  a_std_rcptn_3                 s
   SET  s.ass_pref_mail_name    = NVL(
   (SELECT a.ass_pref_mail_name
      FROM a_dw_assignment_pm   a
     WHERE s.id_number          = a.id_number),' ');
COMMIT;
/

/**********************/
/*** Remove Spouses ***/
/**********************/
/*** COMMENTING OUT!!! Per Erica this one will take some manual intervention 
DELETE FROM   a_std_rcptn_3        a
      WHERE   a.id_number    IN
     (SELECT  b.spouse_id
        FROM  a_std_rcptn_3        b)
        AND   a.id_number    IN
    (SELECT   e.id_number
       FROM   entity         e
      WHERE   e.gender_code        = 'F')
        AND   a.flag_del_spouse    = 1;
COMMIT;
/   

/*** Update for sorting no address ***/
UPDATE a_std_rcptn_3
   SET p_zipcode            = ' ',
       p_country_desc       = ' ',
       p_flag_foreign       = 0
 WHERE p_zipcode            IS NULL;
COMMIT;
/

/*** Create Indexes on Table ***/
CREATE INDEX ADVANCE.a_std_rcptn_3_id_number ON ADVANCE.a_std_rcptn_3(id_number);
COMMIT;
/
