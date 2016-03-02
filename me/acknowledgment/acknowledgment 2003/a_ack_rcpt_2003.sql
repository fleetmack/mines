/***********************************************************/
/***********************************************************/
/*** Creates a Table to Generate Acknowledgement Letters ***/
/***********************************************************/
/***********************************************************/

/**********************************************/
/*** Make sure you are logged in as ADVANCE ***/
/*** for this to work correctly since all   ***/
/*** rights need to be assigned to ADVROLE  ***/
/**********************************************/

/*** Update Runtimes ***/
INSERT INTO ADVANCE.a_dw_runtimes
   VALUES
      ('Start','Create a_ack_rcpt table',TO_CHAR(SYSDATE, 'YYYYMMDD:HH:MI:SS'), SYSDATE);
COMMIT; 
/

/****************************************************/
/****************************************************/
/**** Create a Table to Hold Gift Information ****/
/****************************************************/
/****************************************************/
DROP TABLE   ADVANCE.a_ack_rcpt;
COMMIT;
/

CREATE TABLE ADVANCE.a_ack_rcpt
   (
   id_number                   VARCHAR2(10)  NOT NULL,
   receipt                     VARCHAR2(10)  NOT NULL,
   batch_number                VARCHAR2(10)  NULL,
   batch_type                  VARCHAR2(1)   NULL,
   batch_type_desc             VARCHAR2(40)  NULL,
   operator_name               VARCHAR2(32)  NULL,
   sequence                    NUMBER(6)     NOT NULL,
   date_of_record              VARCHAR2(8)   NOT NULL,
   dater                       VARCHAR2(30)  NULL,
   gift                        VARCHAR2(30)  NULL,
   associated_amount_cfy       NUMBER(14,2)  NOT NULL,
   associated_amount_cfy_match NUMBER(14,2)  NULL,
   associated_amount_cfy_claim NUMBER(14,2)  NULL,
   associated_code             VARCHAR2(1)   NOT NULL,
   appeal_code                 VARCHAR2(5)   NULL,
   transaction_type            VARCHAR2(2)   NOT NULL, 
   transaction_type_desc       VARCHAR2(15)  NULL, 
   prim_pledge_original_amount NUMBER(14,2)  NULL,
   pledge                      VARCHAR2(30)  NULL,
   prim_pledge_amount_paid     NUMBER(14,2)  NULL,
   prim_pledge_amount_os       NUMBER(14,2)  NULL,
   os                          VARCHAR2(30)  NULL,
   alloc                       VARCHAR2(16)  NULL,
   alloc_account               VARCHAR2(30)  NULL,
   alloc_desc                  VARCHAR2(160) NULL,
   alloc_dept_code             VARCHAR2(7)   NULL,
   alloc_dept_desc             VARCHAR2(40)  NULL,
   alloc_administrator_id      VARCHAR2(10)  NULL,
   alloc_administrator_name    VARCHAR2(60)  NULL,
   flag_deferred               NUMBER(1)     NULL,
   flag_memorial               NUMBER(1)     NULL,
   flag_reunion_cfy            NUMBER(1)     NULL,
   flag_z_gift                 NUMBER(1)     NULL,
   flag_young_alum             NUMBER(1)     NULL,
   flag_parent                 NUMBER(1)     NULL,
   flag_faculty_staff          NUMBER(1)     NULL,
   flag_pc                     NUMBER(1)     NULL,
   faculty_staff_status        VARCHAR2(20)  NULL,
   flag_payroll_deduction      NUMBER(1)     NULL,
   flag_joint                  NUMBER(1)     NULL,
   flag_honor                  NUMBER(1)     NULL,
   flag_behalf                 NUMBER(1)     NULL,
   rcpt_behalf_by              VARCHAR2(120) NULL,
   rcpt_pc_pledge              VARCHAR2(160) NULL, 
   behalf_by                   VARCHAR2(60)  NULL,
   bequest_hisher              VARCHAR2(3)   NULL,
   bequest_himher              VARCHAR2(3)   NULL,
   flag_anonymous              VARCHAR2(9)   NULL,
   flag_received_letter        VARCHAR2(60)  NULL,
   cfy_giving                  NUMBER(14,2)  NULL,
   cfy_commitment              NUMBER(14,2)  NULL,
   p_care_of                   VARCHAR2(45)  NULL,
   p_company_name_1            VARCHAR2(60)  NULL,
   p_business_title            VARCHAR2(60)  NULL,
   p_street1                   VARCHAR2(40)  NULL,
   p_street2                   VARCHAR2(40)  NULL,
   p_street3                   VARCHAR2(40)  NULL,
   p_cityline                  VARCHAR2(60)  NULL,
   p_foreign_cityzip           VARCHAR2(40)  NULL,
   p_country_code              VARCHAR2(5)   NULL,
   p_country_desc              VARCHAR2(40)  NULL,
   p_flag_foreign              NUMBER(1)     NULL,
   match_co_flag               NUMBER(1)     NULL,
   match_form_flag             NUMBER(1)     NULL,
   pd_amount                   NUMBER(16,2)  NULL,
   pd_start                    VARCHAR2(20)  NULL,
   pd_end                      VARCHAR2(20)  NULL,
   pc_pfy                      NUMBER(1)     NULL,
   person_or_org               CHAR(1)       NULL,
   record_type_code            VARCHAR2(2)   NULL,
   record_type_desc            VARCHAR2(40)  NULL, 
   record_status_code          CHAR(1)       NULL,
   pref_class_year             VARCHAR2(4)   NULL,
   salutation                  VARCHAR2(80)  NULL,
   pref_mail_name              VARCHAR2(60)  NULL,
   pref_name_sort              VARCHAR2(60)  NULL,
   manager_pref_name           VARCHAR2(200) NULL,
   ack_segment                 VARCHAR2(30)  NULL,
   society                     VARCHAR2(60)  NULL,
   signer                      VARCHAR2(10)   NULL,
   ack_letter1                 VARCHAR2(4000)NULL,
   ack_ps                      VARCHAR2(310) NULL,
   rcpt_line_1                 VARCHAR2(500) NULL);
COMMIT;
/

/***********************************/
/***********************************/
/*** Load Initial ID's Into File ***/
/***********************************/
/***********************************/

/*** Picking All Gifts Processed in the Last 60 Days from a_dw_gift_cfy***/
INSERT INTO   a_ack_rcpt (id_number,
                        receipt,
                        sequence,
                        date_of_record,
                        associated_amount_cfy,
                        associated_amount_cfy_match,
                        associated_amount_cfy_claim,
                        associated_code,
                        appeal_code,
                        transaction_type,
                        transaction_type_desc,
                        prim_pledge_original_amount,
                        prim_pledge_amount_paid,
                        prim_pledge_amount_os,
                        alloc,
                        alloc_account,
                        alloc_desc,
                        alloc_dept_code,
                        alloc_dept_desc,
                        alloc_administrator_id,
                        alloc_administrator_name,
                        flag_deferred,
                        flag_memorial,
                        flag_reunion_cfy,
                        flag_z_gift,
                        flag_young_alum,
                        flag_parent,
                        flag_faculty_staff,
                        
                        faculty_staff_status,
                        pc_pfy,
                        person_or_org,
                        record_type_code,
                        record_type_desc,
                        record_status_code,
                        pref_class_year,
                        pref_mail_name,
                        pref_name_sort)
   (SELECT              id_number,
                        receipt,
                        sequence,
                        date_of_record,
                        associated_amount_cfy,
                        associated_amount_cfy_match,
                        associated_amount_cfy_claim,
                        associated_code,
                        appeal_code,
                        transaction_type,
                        transaction_type_desc,
                        prim_pledge_original_amount,
                        prim_pledge_amount_paid,
                        prim_pledge_amount_os,
                        alloc,
                        alloc_account,
                        alloc_desc,
                        alloc_dept_code,
                        alloc_dept_desc,
                        alloc_administrator_id,
                        alloc_administrator_name,
                        flag_deferred,
                        flag_memorial,
                        flag_reunion_cfy,
                        flag_z_gift,
                        flag_young_alum,
                        flag_parent,
                        flag_faculty_staff,
                        
                        faculty_staff_status,
                        0,
                        person_or_org,
                        record_type_code,
                        record_type_desc,
                        record_status_code,
                        pref_class_year,
                        pref_mail_name,
                        pref_name_sort
   FROM    a_dw_gift_cfy                dw
   WHERE   dw.date_of_record            > (to_char(sysdate-60,'YYYYMMDD'))
     AND   dw.flag_alumni               = 0);
COMMIT;
/

/**********************************************************/
/**********************************************************/
/*** Add Back in Behalf Names from a_dw_gift_cfy_behalf ***/
/**********************************************************/
/**********************************************************/
INSERT INTO   a_ack_rcpt (id_number,
                        receipt,
                        sequence,
                        date_of_record,
                        associated_amount_cfy,
                        associated_amount_cfy_match,
                        associated_amount_cfy_claim,
                        associated_code,
                        appeal_code,
                        transaction_type,
                        transaction_type_desc,
                        prim_pledge_original_amount,
                        prim_pledge_amount_paid,
                        prim_pledge_amount_os,
                        alloc,
                        alloc_account,
                        alloc_desc,
                        alloc_dept_code,
                        alloc_dept_desc,
                        alloc_administrator_id,
                        alloc_administrator_name,
                        flag_deferred,
                        flag_memorial,
                        flag_reunion_cfy,
                        flag_z_gift,
                        flag_young_alum,
                        flag_parent,
                        flag_faculty_staff,
                    
                        faculty_staff_status,
                        pc_pfy,
                        person_or_org,
                        record_type_code,
                        record_type_desc,
                        record_status_code,
                        pref_class_year,
                        pref_mail_name,
                        pref_name_sort)
   (SELECT              b.id_number,
                        b.receipt,
                        b.sequence,
                        b.date_of_record,
                        b.associated_amount_cfy,
                        b.associated_amount_cfy_match,
                        b.associated_amount_cfy_claim,
                        b.associated_code,
                        b.appeal_code,
                        b.transaction_type,
                        b.transaction_type_desc,
                        b.prim_pledge_original_amount,
                        b.prim_pledge_amount_paid,
                        b.prim_pledge_amount_os,
                        b.alloc,
                        b.alloc_account,
                        b.alloc_desc,
                        b.alloc_dept_code,
                        b.alloc_dept_desc,
                        b.alloc_administrator_id,
                        b.alloc_administrator_name,
                        b.flag_deferred,
                        b.flag_memorial,
                        b.flag_reunion_cfy,
                        b.flag_z_gift,
                        b.flag_young_alum,
                        b.flag_parent,
                        b.flag_faculty_staff,
                      
                        b.faculty_staff_status,
                        0,
                        b.person_or_org,
                        b.record_type_code,
                        b.record_type_desc,
                        b.record_status_code,
                        b.pref_class_year,
                        b.pref_mail_name,
                        b.pref_name_sort
   FROM    a_dw_gift_cfy_behalf                b,
           a_ack_rcpt                          a
   WHERE   b.receipt                           = a.receipt);
COMMIT;
/

/***********************/
/***********************/
/***  Update Address ***/
/***********************/
/***********************/
/*** Update Ack file with Preferred Address ***/
UPDATE      a_ack_rcpt            m
   SET      (m.p_care_of,
            m.p_company_name_1,
            m.p_business_title,
            m.p_street1,
            m.p_street2,
            m.p_street3,
            m.p_cityline,
            m.p_foreign_cityzip,
            m.p_country_code,
            m.p_country_desc,
            m.p_flag_foreign)     = 
   (SELECT  t.p_care_of,
            t.p_company_name_1,
            t.p_business_title,
            t.p_street1,
            t.p_street2,
            t.p_street3,
            t.p_cityline,
            t.p_foreign_cityzip,
            t.p_country_code,
            t.p_country_desc,
            t.p_flag_foreign
      FROM  a_dw_address_good      t
     WHERE  t.id_number  = m.id_number);
COMMIT;
/

/*** Update Fields Where No Address Exist on File ***/
UPDATE        a_ack_rcpt            
   SET        p_care_of             = ' ',
              p_company_name_1      = ' ',
              p_business_title      = ' ',
              p_street1             = '** No Good Preferred Address on File **',
              p_street2             = ' ',
              p_street3             = ' ',
              p_cityline            = ' ',
              p_foreign_cityzip     = ' ',
              p_country_code        = ' ',
              p_country_desc        = ' ',
              p_flag_foreign        = 0
    WHERE     p_street1             IS NULL;
COMMIT;
/

/**********************************************************/
/**********************************************************/
/***  Update Batch Number, Operator Name and Batch Type ***/
/**********************************************************/
/**********************************************************/

/*** Primary Gift***/
UPDATE     a_ack_rcpt                  a
   SET     a.batch_number              =
   (SELECT pg.prim_gift_batch_number
     FROM  primary_gift                pg
    WHERE  a.receipt                   = pg.prim_gift_receipt_number)
    WHERE  a.transaction_type          IN('GF','BQ','EP','PY','MC','PP');
COMMIT;
/

/*** Primary Pledge ***/
UPDATE     a_ack_rcpt                  a
   SET     a.batch_number              =
   (SELECT pp.prim_pledge_batch_number
     FROM  primary_pledge              pp
    WHERE  a.receipt                   = pp.prim_pledge_number)
    WHERE  a.transaction_type          IN('P');
COMMIT;
/

/*** Matching Gift ***/
UPDATE     a_ack_rcpt                  a
   SET     a.batch_number              =
   (SELECT mg.match_gift_batch_number
     FROM  matching_gift               mg
    WHERE  a.receipt                   = mg.match_gift_receipt_number)
    WHERE  a.transaction_type          IN('MG');
COMMIT;
/

/*** Batch Code Type ***/
UPDATE     a_ack_rcpt                  a
   SET     a.batch_type                =
   (SELECT bc.bc_batch_type_code
     FROM  batch_control               bc
    WHERE  a.batch_number              = bc.bc_batch_number);
COMMIT;
/

/*** Batch Code Type Descriptor ***/
UPDATE      a_ack_rcpt          a 
   SET      a.batch_type_desc   =
   (SELECT  tms.short_desc
      FROM  tms_batch_type      tms
     WHERE  tms.batch_type      = a.batch_type);
COMMIT;
/

/*** Operator Name ***/
UPDATE       a_ack_rcpt        a
   SET       a.operator_name   = 
   (SELECT   b.operator_name
      FROM   batch_control     b
     WHERE   a.batch_number    = b.bc_batch_number);
COMMIT;
/

/************************************************************/
/************************************************************/
/***  Update Allocation Description with Long Description ***/
/************************************************************/
/************************************************************/
UPDATE      a_ack_rcpt         m
   SET      m.alloc_desc       = 
   (SELECT  a.long_name||' '||a.long_name2 
      FROM  allocation         a
     WHERE  a.allocation_code  = m.alloc);
COMMIT;
/

/***********************************/
/***********************************/
/*** Set Date Format for Letters ***/
/***********************************/
/***********************************/
UPDATE   a_ack_rcpt
   SET   dater = DECODE(SUBSTR(date_of_record,5,2),'01','Jan. ',
                                                   '02','Feb. ',
                                                   '03','March ',
                                                   '04','April ',
                                                   '05','May ',
                                                   '06','June ',
                                                   '07','July ',
                                                   '08','Aug. ',
                                                   '09','Sept. ',
                                                   '10','Oct. ',
                                                   '11','Nov. ',
                                                   '12','Dec. ');
COMMIT;
/

UPDATE   a_ack_rcpt
   SET   dater = dater || DECODE(SUBSTR(date_of_record,7,2),'01','1, ',
                                                            '02','2, ',
                                                            '03','3, ',
                                                            '04','4, ',
                                                            '05','5, ',
                                                            '06','6, ',
                                                            '07','7, ',
                                                            '08','8, ',
                                                            '09','9, ',
                                                            SUBSTR(date_of_record,7,2)||', ');
COMMIT;
/

UPDATE   a_ack_rcpt
   SET   dater = dater || SUBSTR(date_of_record,1,4);
COMMIT;
/

/**********************************************/
/**********************************************/
/*** Update Salutation and Pref Name Fields ***/
/**********************************************/
/**********************************************/
/*** Put in Salutation from Primary Name ***/
UPDATE      a_ack_rcpt          m
   SET      m.salutation        =
   (SELECT  e.salutation  
      FROM  entity              e
     WHERE  e.id_number         = m.id_number);
COMMIT;
/

/***      If Joint Salutation Exists, Put It In      ***/
/*** Spouse ID Exists on System and Indicators = 'Y' ***/
UPDATE       a_ack_rcpt         m
   SET       m.salutation       = 
   (SELECT   e.jnt_salutation
      FROM   entity             e
     WHERE   e.jnt_mailings_ind = 'Y'
       AND   e.jnt_gifts_ind    = 'Y'
       AND   e.id_number        = m.id_number)
   WHERE     m.id_number        IN
   (SELECT   e2.id_number
      FROM   entity             e2
     WHERE   e2.jnt_mailings_ind = 'Y'
       AND   e2.jnt_gifts_ind    = 'Y');
COMMIT;
/

/*** If Joint Salutation Exists, Put It In ***/
/***        No Spouse ID on System         ***/
UPDATE       a_ack_rcpt             m
   SET       m.salutation           = 
   (SELECT   e.jnt_salutation
      FROM   entity                 e
     WHERE   e.marital_status_code  IN ('M','P')
       AND   e.spouse_id_number     = ' '
       AND   m.id_number            = e.id_number)
   WHERE     m.id_number            IN
   (SELECT   e2.id_number
      FROM   entity                 e2
     WHERE   e2.marital_status_code IN ('M','P')
       AND   e2.spouse_id_number     = ' '
       AND   e2.jnt_salutation       > ' ');
COMMIT;
/

/*** Indicate No Salutation ***/
UPDATE      a_ack_rcpt
   SET      salutation          = '** No Salutation on Record **'
   WHERE    salutation          = ' '
     AND    person_or_org       = 'P';
COMMIT;
/

/*** Indicate No Salutation ***/
UPDATE      a_ack_rcpt          a
   SET      a.salutation        = 
   (SELECT  e.first_name
      FROM  entity              e
     WHERE  a.id_number         = e.id_number)
   WHERE    a.transaction_type  = 'BQ';
COMMIT;
/

/***      Update with Joint Pref Name if needed      ***/
/*** Spouse ID Exists on System and Indicators = 'Y' ***/
UPDATE       a_ack_rcpt            m
   SET       m.pref_mail_name      =
   (SELECT   e.pref_jnt_mail_name1||' '||e.pref_jnt_mail_name2    
      FROM   entity                e
     WHERE   e.jnt_mailings_ind    = 'Y'
       AND   e.jnt_gifts_ind       = 'Y'
       AND   m.id_number           = e.id_number)
   WHERE     m.id_number           IN
   (SELECT   e2.id_number
      FROM   entity                e2
     WHERE   e2.jnt_mailings_ind   = 'Y'
       AND   e2.jnt_gifts_ind      = 'Y');
COMMIT;
/

/*** If Joint Name Exists, Put It In ***/
/***     No Spouse ID on System      ***/
UPDATE       a_ack_rcpt             m
   SET       m.pref_mail_name       = 
   (SELECT   e.pref_jnt_mail_name1||' '||e.pref_jnt_mail_name2  
      FROM   entity                 e
     WHERE   e.marital_status_code  IN ('M','P')
       AND   e.spouse_id_number     = ' '
       AND   m.id_number            = e.id_number)
   WHERE     m.id_number            IN
   (SELECT   e2.id_number
      FROM   entity                 e2
     WHERE   e2.marital_status_code IN ('M','P')
       AND   e2.spouse_id_number    = ' '
       AND   e2.pref_jnt_mail_name1 > ' ');
COMMIT;
/

/*** Indicate No Pref Name ***/
UPDATE      a_ack_rcpt
   SET      pref_mail_name          = '** No Name on record for '||id_number
   WHERE    pref_mail_name          = ' '
     AND    person_or_org           = 'P';
COMMIT;
/

/*****************************************/
/*****************************************/
/*** Update Bequest Him/His/Her Fields ***/
/*****************************************/
/*****************************************/
UPDATE      a_ack_rcpt          a
   SET      a.bequest_hisher    =
   (SELECT  DECODE(e.gender_code, 'F', 'her'
                                     , 'his')
      FROM  entity              e
     WHERE  a.id_number         = e.id_number)
   WHERE    a.transaction_type  = 'BQ';
COMMIT;
/

UPDATE      a_ack_rcpt          a
   SET      a.bequest_himher    =
   (SELECT  DECODE(e.gender_code, 'F', 'her'
                                     , 'him')
      FROM  entity              e
     WHERE  a.id_number         = e.id_number)
   WHERE    a.transaction_type  = 'BQ';
COMMIT;
/      

UPDATE      a_ack_rcpt          a
   SET      a.bequest_himher    = ' ',
            a.bequest_hisher    = ' '
   WHERE    a.transaction_type  <> 'BQ';
COMMIT;
/

/********************************************/
/********************************************/
/*** Update Payroll Deduction Pledge Flag ***/
/********************************************/
/********************************************/
UPDATE      a_ack_rcpt                 a
   SET      a.flag_payroll_deduction   = 1
   WHERE    a.receipt                  IN
   (SELECT  p.pledge_pledge_number
      FROM  pledge                     p
     WHERE  p.pledge_pledge_type       = 'PD')
   AND      a.transaction_type         = 'P';
COMMIT;
/

UPDATE      a_ack_rcpt                 a
   SET      a.flag_payroll_deduction   = 2
 WHERE      a.flag_payroll_deduction   IS NULL
   AND      a.receipt                  IN
   (SELECT  g.gift_receipt_number
      FROM  gift                       g
     WHERE  g.gift_transaction_type    = 'PY');
COMMIT;
/

UPDATE      a_ack_rcpt
   SET      flag_payroll_deduction     = 0
   WHERE    flag_payroll_deduction     IS NULL;
COMMIT;
/

/************************************/
/************************************/
/*** Update Matching Company Flag ***/
/************************************/
/************************************/
UPDATE      a_ack_rcpt             m
   SET      m.match_co_flag        = 1
   WHERE    m.id_number           IN( 
     SELECT j.id_number
     FROM   a_dw_jobs             j
     WHERE  m.id_number           = j.id_number
     AND    j.job_status_code     IN('C','R','A')
     AND    j.matching_status_ind = 'Y');
COMMIT;
/

UPDATE      a_ack_rcpt            m
   SET      m.match_co_flag       = 0
   WHERE    m.match_co_flag       IS NULL;
COMMIT;
/

/******************************************/
/******************************************/
/*** Update Matching Form Received Flag ***/
/******************************************/
/******************************************/
/*** From Claim File ***/
UPDATE      a_ack_rcpt                    m
   SET      m.match_form_flag             = 1
   WHERE    m.transaction_type            IN ('GF','BQ','EP','PY','MC','PP')
     AND    m.receipt                     IN( 
     SELECT mc.claim_gift_receipt_number
     FROM   matching_claim                mc
     WHERE  m.receipt                     = mc.claim_gift_receipt_number
     AND    mc.claim_form_received        = 'Y');
COMMIT;
/

/*** From Matched File ***/
UPDATE      a_ack_rcpt                    m
   SET      m.match_form_flag             = 1
   WHERE    m.transaction_type            IN ('GF','BQ','EP','PY','MC','PP')
     AND    m.receipt                     IN( 
     SELECT mg.match_gift_matched_receipt
     FROM   matching_gift                 mg
     WHERE  m.receipt                     = mg.match_gift_matched_receipt);
COMMIT;
/

/*** Update Nulls ***/
UPDATE      a_ack_rcpt            m
   SET      m.match_form_flag     = 0
   WHERE    m.match_form_flag     IS NULL;
COMMIT;
/

/**************************************/
/**************************************/
/*** Update PC Previous Fiscal Year ***/
/**************************************/
/**************************************/
UPDATE      a_ack_rcpt
   SET      pc_pfy          = 1
   WHERE    id_number       IN
   (SELECT  g.id_number
      FROM  a_dw_gift_clubs g
     WHERE  g.pc_pfy        = 1);
COMMIT;
/



/**************************/
/**************************/
/*** Update Joint Flag  ***/
/**************************/
/**************************/
/*** Update Pledges ***/
UPDATE    a_ack_rcpt                   m
   SET    m.flag_joint                 = 1
   WHERE  m.transaction_type           IN ('P')
     AND  m.receipt                    IN(
   SELECT p.pledge_pledge_number
    FROM  pledge                       p
   WHERE  p.pledge_associated_code     = 'J');
COMMIT;
/

/*** Update Gifts and Payments ***/
UPDATE    a_ack_rcpt                   m
   SET    m.flag_joint                 = 1
   WHERE  m.transaction_type           IN ('PP','GF','BQ','EP','GI','PY')
     AND  m.receipt                    IN(
   SELECT g.gift_receipt_number
    FROM  gift                         g
   WHERE  g.gift_associated_code       = 'J');
COMMIT;
/

/*** Update Nulls ***/
UPDATE  a_ack_rcpt
   SET  flag_joint   = 0
 WHERE  flag_joint   IS NULL;
COMMIT;
/


/*******************************************/
/*******************************************/
/*** Update Flags so Same on Joint Gifts ***/
/*******************************************/
/*******************************************/
/*** Reunion Flag ***/
UPDATE        a_ack_rcpt            a
   SET        a.flag_reunion_cfy    = 
   (SELECT    MAX(flag_reunion_cfy)
      FROM    a_ack_rcpt            b
     WHERE    a.receipt             = b.receipt)
     WHERE    a.flag_joint          = 1;
COMMIT;
/

/*** Young Alumni Flag ***/
UPDATE        a_ack_rcpt           a
   SET        a.flag_young_alum    = 
   (SELECT    MAX(flag_young_alum)
      FROM    a_ack_rcpt           b
     WHERE    a.receipt            = b.receipt)
     WHERE    a.flag_joint         = 1;
COMMIT;
/

/*** Parent Flag ***/
UPDATE        a_ack_rcpt           a
   SET        a.flag_parent        = 
   (SELECT    MAX(flag_parent)
      FROM    a_ack_rcpt           b
     WHERE    a.receipt            = b.receipt)
     WHERE    a.flag_joint         = 1;
COMMIT;
/

/*** Faculty Staff Flag ***/
UPDATE        a_ack_rcpt              a
   SET        a.flag_faculty_staff    = 
   (SELECT    MAX(flag_faculty_staff)
      FROM    a_ack_rcpt              b
     WHERE    a.receipt               = b.receipt)
     WHERE    a.flag_joint            = 1;
COMMIT;
/







/*** Payroll Deduction Flag ***/
UPDATE        a_ack_rcpt                  a
   SET        a.flag_payroll_deduction    = 
   (SELECT    MAX(flag_payroll_deduction)
      FROM    a_ack_rcpt                  b
     WHERE    a.receipt                   = b.receipt)
     WHERE    a.flag_joint                = 1;
COMMIT;
/

/*** Matching Gift Company Flag ***/
UPDATE        a_ack_rcpt           a
   SET        a.match_co_flag      = 
   (SELECT    MAX(match_co_flag)
      FROM    a_ack_rcpt           b
     WHERE    a.receipt            = b.receipt)
     WHERE    a.flag_joint         = 1;
COMMIT;
/

/*** Matching Gift Form Flag ***/
UPDATE        a_ack_rcpt           a
   SET        a.match_form_flag    = 
   (SELECT    MAX(match_form_flag)
      FROM    a_ack_rcpt           b
     WHERE    a.receipt            = b.receipt)
     WHERE    a.flag_joint         = 1;
COMMIT;
/

/*** Set Pref Year to Highest on Young Alumni ***/
UPDATE        a_ack_rcpt           a
   SET        a.pref_class_year    = 
   (SELECT    MAX(pref_class_year)
      FROM    a_ack_rcpt           b
     WHERE    a.receipt            = b.receipt)
     WHERE    a.flag_joint         = 1
       AND    a.flag_young_alum    = 1;
COMMIT;
/

/*****************************************************/
/*****************************************************/
/*** Update Pledge Information on Pledge Payments  ***/
/*****************************************************/
/*****************************************************/
/*** Create Temp Table to Hold Original Pledge Information ***/
DROP TABLE   ADVANCE.a_ack_rcpt_pledge;
COMMIT;
/

CREATE TABLE ADVANCE.a_ack_rcpt_pledge
   (id_number                  VARCHAR2(10)  NOT NULL,
   receipt                     VARCHAR2(10)  NOT NULL,
   pledge_receipt              VARCHAR2(10)  NULL,
   prim_pledge_original_amount NUMBER(14,2)  NULL,
   prim_pledge_amount_paid     NUMBER(14,2)  NULL,
   prim_pledge_amount_os       NUMBER(14,2)  NULL);

INSERT INTO   a_ack_rcpt_pledge     (id_number, receipt)
    (SELECT   DISTINCT id_number, 
              receipt
       FROM   a_ack_rcpt                m
       WHERE  m.transaction_type        IN('PP')
          OR  m.flag_payroll_deduction  = 2);
COMMIT;
/

/*** Update Pledge Receipt Number from Primary Gift ***/
UPDATE       a_ack_rcpt_pledge               p
   SET       p.pledge_receipt                =
   (SELECT   pg.prim_gift_pledge_number
      FROM   primary_gift                    pg
     WHERE   pg.prim_gift_receipt_number     = p.receipt);
COMMIT;
/

/*** Update Pledge Amounts ***/
UPDATE       a_ack_rcpt_pledge               p
   SET       (p.prim_pledge_original_amount  ,
             p.prim_pledge_amount_paid       ) =
   (SELECT   pp.prim_pledge_amount  ,
             pp.prim_pledge_amount_paid
      FROM   primary_pledge                  pp
     WHERE   pp.prim_pledge_number           = p.pledge_receipt);
COMMIT;
/

UPDATE      a_ack_rcpt_pledge               
   SET      prim_pledge_amount_os            = prim_pledge_original_amount - prim_pledge_amount_paid;
COMMIT;
/

/*** Update Ack_Main Table with Pledge Information ***/
UPDATE       a_ack_rcpt                     m 
   SET       (m.prim_pledge_original_amount ,
             m.prim_pledge_amount_paid      ,
             m.prim_pledge_amount_os)       =
   (SELECT   p.prim_pledge_original_amount  ,
             p.prim_pledge_amount_paid      ,
             p.prim_pledge_amount_os
      FROM   a_ack_rcpt_pledge              p
     WHERE   p.id_number                    = m.id_number
       AND   p.receipt                      = m.receipt)
     WHERE   m.transaction_type             IN('PP')
        OR   m.flag_payroll_deduction       = 2;
COMMIT;
/

/******************************************/
/******************************************/
/*** Update Current Fiscal Year Giving  ***/
/******************************************/
/******************************************/
/*** Current Fiscal Year Cash ***/
UPDATE      a_ack_rcpt               m
   SET      m.cfy_giving             =
   (SELECT  SUM(p.total_jnt_cash)
      FROM  a_dw_pyramid_cfy         p
     WHERE  p.id_number              = m.id_number
   GROUP BY p.id_number);
COMMIT;
/

/*** Current Fiscal Year Commitment ***/
UPDATE      a_ack_rcpt                  m
   SET      m.cfy_commitment            =
   (SELECT  SUM(p.total_jnt_commitment)
      FROM  a_dw_pyramid_cfy            p
     WHERE  p.id_number                 = m.id_number
   GROUP BY p.id_number);
COMMIT;
/

/*** Set Null Equal to Zero where cfy_giving Is Null ***/
UPDATE     a_ack_rcpt
   SET     cfy_giving     = 0
   WHERE   cfy_giving     IS NULL;

UPDATE     a_ack_rcpt
   SET     cfy_commitment     = 0
   WHERE   cfy_commitment     IS NULL;
   

/*************************************************/
/*************************************************/
/*** Update Associated Amounts for Joint Gifts ***/
/*************************************************/
/*************************************************/
/*** Associated Amount ***/

UPDATE      a_ack_rcpt                     m 
   SET      (m.associated_amount_cfy       ,
            m.associated_amount_cfy_match  ,
            m.associated_amount_cfy_claim) = 
   (SELECT  j.associated_amount            , 
            j.associated_amount_match      ,
            j.associated_amount_claim      
      FROM  a_dw_joint                     j
     WHERE  j.receipt                      = m.receipt)
     WHERE  m.flag_joint                   = 1;
COMMIT;
/

/*** Pledge Amount OS from Joint File ***/
UPDATE      a_ack_rcpt                     m 
   SET      m.prim_pledge_amount_os        = 
   (SELECT  j.prim_pledge_amount_os
      FROM  a_dw_joint                     j
     WHERE  j.receipt                      = m.receipt)
     WHERE  m.flag_joint                   = 1
       AND  m.transaction_type             = 'P';
COMMIT;
/

UPDATE      a_ack_rcpt                         m  
   SET      m.prim_pledge_original_amount      = 
   (SELECT  p.pledge_associated_credit_amt
      FROM  pledge                             p
     WHERE  p.pledge_pledge_number             = m.receipt
       AND  p.pledge_sequence                  = m.sequence)
     WHERE  m.flag_joint                       = 1
       AND  m.transaction_type                 = 'P';
COMMIT;
/

UPDATE      a_ack_rcpt
   SET      prim_pledge_amount_paid       = 
            (prim_pledge_original_amount  -
            prim_pledge_amount_os)
   WHERE    flag_joint                    = 1
     AND    transaction_type            = 'P';
COMMIT;
/

/**************************/
/**************************/
/*** Delete Joint Gifts ***/
/**************************/
/**************************/
DELETE FROM    a_ack_rcpt
      WHERE    associated_code = 'J';
COMMIT;
/

/***********************************/
/***********************************/
/*** Update Honor Flag and Name  ***/
/***********************************/
/***********************************/
/*** Update Honor Flag ***/
UPDATE    a_ack_rcpt                   m
   SET    m.flag_honor                 = 1
   WHERE  m.transaction_type           IN ('PP','GF','P')
     AND  m.receipt                    IN(
   SELECT g.gift_receipt_number
    FROM  gift                         g
   WHERE  g.gift_associated_code       IN('H','M'));
COMMIT;
/

/*** Update Nulls ***/
UPDATE  a_ack_rcpt
   SET  flag_honor   = 0
 WHERE  flag_honor   IS NULL;
COMMIT;
/


/*** Create Temp Table to Hold Honor Name ***/
DROP TABLE   ADVANCE.a_ack_rcpt_honor;
COMMIT;
/

CREATE TABLE ADVANCE.a_ack_rcpt_honor
   (donor_id_number            VARCHAR2(10)  NULL,
   honor_id_number_1           VARCHAR2(10)  NULL,
   honor_id_number_2           VARCHAR2(10)  NULL,
   honor_id_number_3           VARCHAR2(10)  NULL,
   honor_id_number_4           VARCHAR2(10)  NULL,
   honor_id_number_5           VARCHAR2(10)  NULL,
   receipt                     VARCHAR2(10)  NOT NULL,
   gift_associated_code        VARCHAR2(1)   NOT NULL,
   honor_pref_name             VARCHAR2(350) NULL,
   honor_salutation            VARCHAR2(200) NULL,
   honor_gender_code           VARCHAR2(1)   NULL,
   honor_gender_his_hers       VARCHAR2(5)   NULL,
   honor_gender_he_she         VARCHAR2(8)   NULL,
   honor_record_type_code      VARCHAR2(2)   NULL,
   honor_first                 VARCHAR2(100) NULL,
   honor_last                  VARCHAR2(100) NULL,
   total_honored               NUMBER(1)     NULL,
   start_sequence              NUMBER(1)     NULL);

INSERT INTO   a_ack_rcpt_honor       (receipt, gift_associated_code)
    (SELECT   g.gift_receipt_number  ,
              g.gift_associated_code 
       FROM   gift                   g
       WHERE  g.gift_associated_code = 'P'
         AND  g.gift_receipt_number  IN(
     SELECT   a.receipt
       FROM   a_ack_rcpt             a
       WHERE  a.flag_honor           = 1));
COMMIT;
/

/*** Get Starting Sequence ***/
UPDATE        a_ack_rcpt_honor       t
   SET        t.start_sequence       =
   (SELECT    MIN(g.gift_sequence)          
      FROM    gift                   g
     WHERE    t.receipt              = g.gift_receipt_number
       AND    g.gift_associated_code = 'M');
COMMIT;
/

/*** Get Total Honored ***/
UPDATE       a_ack_rcpt_honor        t
   SET       t.total_honored         = 
   (SELECT   COUNT(g.gift_donor_id)
      FROM    gift                   g
     WHERE    t.receipt              = g.gift_receipt_number
       AND    g.gift_associated_code = 'M');
COMMIT;
/

/*** Insert Honor IDs ***/
UPDATE     a_ack_rcpt_honor        t
   SET     honor_id_number_1       =
   (SELECT g.gift_donor_id
      FROM gift                    g
     WHERE t.receipt               = g.gift_receipt_number
       AND g.gift_sequence         = t.start_sequence);
COMMIT;
/

UPDATE     a_ack_rcpt_honor        t
   SET     honor_id_number_2       =
   (SELECT g.gift_donor_id
      FROM gift                    g
     WHERE t.receipt               = g.gift_receipt_number
       AND g.gift_sequence         = (t.start_sequence+1)
       AND t.total_honored         = 2);
COMMIT;
/

UPDATE     a_ack_rcpt_honor        t
   SET     honor_id_number_3       =
   (SELECT g.gift_donor_id
      FROM gift                    g
     WHERE t.receipt               = g.gift_receipt_number
       AND g.gift_sequence         = (t.start_sequence+2)
       AND t.total_honored         = 3);
COMMIT;
/

UPDATE     a_ack_rcpt_honor        t
   SET     honor_id_number_4       =
   (SELECT g.gift_donor_id
      FROM gift                    g
     WHERE t.receipt               = g.gift_receipt_number
       AND g.gift_sequence         = (t.start_sequence+3)
       AND t.total_honored         = 4);
COMMIT;
/

UPDATE     a_ack_rcpt_honor        t
   SET     honor_id_number_5       =
   (SELECT g.gift_donor_id
      FROM gift                    g
     WHERE t.receipt               = g.gift_receipt_number
       AND g.gift_sequence         = (t.start_sequence+4)
       AND t.total_honored         = 5);
COMMIT;
/

/*** Update ID_number of Donor ***/
UPDATE       a_ack_rcpt_honor      t
   SET       t.donor_id_number     =
   (SELECT   a.id_number  
     FROM    a_ack_rcpt            a
     WHERE   t.receipt             = a.receipt
       AND   a.associated_code     = 'P'
       AND   a.transaction_type    NOT IN ('MG','MC'));
COMMIT;
/

/*** Update Name Fields for Honored Person ***/
UPDATE       a_ack_rcpt_honor              t
   SET       (t.honor_pref_name            ,
             t.honor_salutation            ,
             t.honor_gender_code           ,
             t.honor_record_type_code      ,
             t.honor_first                 ,
             t.honor_last)                 = 
   (SELECT   RTRIM(e.pref_mail_name,' [D]'),
             RTRIM(e.salutation)           ,
             e.gender_code                 ,
             e.record_type_code            ,
             e.first_name                  ,
             e.last_name                   
      FROM   entity                        e
     WHERE   e.id_number                   = t.honor_id_number_1);
COMMIT;
/

UPDATE       a_ack_rcpt_honor                                           t
   SET       (t.honor_pref_name                                         ,
             t.honor_salutation                                         ,
             t.honor_first                                              ,
             t.honor_last)                                              = 
   (SELECT   t.honor_pref_name||', '||RTRIM(e.pref_mail_name,' [D]')    ,
             t.honor_salutation||', '||RTRIM(e.salutation)              ,
             t.honor_first||', '||e.first_name                          ,
             t.honor_last||', '||e.last_name                   
      FROM   entity                                                     e
     WHERE   e.id_number                                                = t.honor_id_number_5)
     WHERE   t.total_honored                                            = 5;
COMMIT;
/

UPDATE       a_ack_rcpt_honor                                           t
   SET       (t.honor_pref_name                                         ,
             t.honor_salutation                                         ,
             t.honor_first                                              ,
             t.honor_last)                                              = 
   (SELECT   t.honor_pref_name||', '||RTRIM(e.pref_mail_name,' [D]')    ,
             t.honor_salutation||', '||RTRIM(e.salutation)              ,
             t.honor_first||', '||e.first_name                          ,
             t.honor_last||', '||e.last_name                   
      FROM   entity                                                     e
     WHERE   e.id_number                                                = t.honor_id_number_4)
     WHERE   t.total_honored                                            = 4;
COMMIT;
/

UPDATE       a_ack_rcpt_honor                                           t
   SET       (t.honor_pref_name                                         ,
             t.honor_salutation                                         ,
             t.honor_first                                              ,
             t.honor_last)                                              = 
   (SELECT   t.honor_pref_name||', '||RTRIM(e.pref_mail_name,' [D]')    ,
             t.honor_salutation||', '||RTRIM(e.salutation)              , 
             t.honor_first||', '||e.first_name                          ,
             t.honor_last||', '||e.last_name                   
      FROM   entity                                                     e
     WHERE   e.id_number                                                = t.honor_id_number_3)
     WHERE   t.total_honored                                            = 3;
COMMIT;
/

UPDATE       a_ack_rcpt_honor                                           t
   SET       (t.honor_pref_name                                         ,
             t.honor_first                                              ,
             t.honor_salutation                                         ,
             t.honor_last)                                              = 
   (SELECT   t.honor_pref_name||' and '||RTRIM(e.pref_mail_name,' [D]') ,
             t.honor_salutation||'and '||RTRIM(e.salutation)            ,
             t.honor_first||', '||e.first_name                          ,
             t.honor_last||' and '||e.last_name                   
      FROM   entity                                                     e
     WHERE   e.id_number                                                = t.honor_id_number_2)
     WHERE   t.total_honored                                            = 2;
COMMIT;
/

/*** Update He/She His/Her Fields ***/
UPDATE       a_ack_rcpt_honor          t
   SET       t.honor_gender_he_she     = 'he is'
   WHERE     t.honor_gender_code       = 'M';
COMMIT;
/

UPDATE       a_ack_rcpt_honor          t
   SET       t.honor_gender_he_she     = 'she is'
   WHERE     t.honor_gender_code       = 'F';
COMMIT;
/

UPDATE       a_ack_rcpt_honor
   SET       honor_gender_he_she      = 'they are'
   WHERE     total_honored            > 1;
COMMIT;
/

UPDATE       a_ack_rcpt_honor          t
   SET       t.honor_gender_his_hers   = 'his'
   WHERE     t.honor_gender_code       = 'M';
COMMIT;
/

UPDATE       a_ack_rcpt_honor          t
   SET       t.honor_gender_his_hers   = 'hers'
   WHERE     t.honor_gender_code       = 'F';
COMMIT;
/

UPDATE       a_ack_rcpt_honor          t
   SET       t.honor_gender_his_hers   = 'their'
   WHERE     total_honored             > 1;
COMMIT;
/

UPDATE       a_ack_rcpt_honor
   SET       honor_salutation = honor_first
   WHERE     honor_salutation IS NULL;
COMMIT;
/

/************************************/
/************************************/
/*** Update Behalf Flag and Name  ***/
/************************************/
/************************************/
/*** Update Behalf Flag ***/
UPDATE    a_ack_rcpt                   m
   SET    m.flag_behalf                = 1
   WHERE  m.transaction_type           IN ('PP','GF','P')
     AND  m.receipt                    IN(
   SELECT g.gift_receipt_number
    FROM  gift                         g
   WHERE  g.gift_associated_code       = 'B');
COMMIT;
/

/*** Update Nulls ***/
UPDATE  a_ack_rcpt
   SET  flag_behalf   = 0
 WHERE  flag_behalf   IS NULL;
COMMIT;
/

/*** Put in Name of Behalf By Entity ***/
/*** Receipt***/
UPDATE       a_ack_rcpt                  a
   SET       a.rcpt_behalf_by            = 
   (SELECT   'Gift given on your behalf by '||(b.pref_mail_name)
      FROM   a_ack_rcpt                  b 
      WHERE  a.receipt                   = b.receipt
        AND  b.sequence                  = 1
        AND  b.transaction_type          NOT IN ('MC','MG'))
   WHERE     a.flag_behalf               = 1
     AND     a.sequence                  <> 1;
COMMIT;
/

UPDATE     a_ack_rcpt
   SET     rcpt_behalf_by   = ' '
   WHERE   rcpt_behalf_by   IS NULL;
COMMIT;
/



/*** Letter ***/
UPDATE       a_ack_rcpt                  a
   SET       a.behalf_by                 = 
   (SELECT   (b.pref_mail_name)
      FROM   a_ack_rcpt                  b 
      WHERE  a.receipt                   = b.receipt
        AND  b.sequence                  = 1
        AND  b.transaction_type          NOT IN ('MC','MG'))
   WHERE     a.flag_behalf               = 1
     AND     a.sequence                  <> 1;
COMMIT;
/

UPDATE     a_ack_rcpt
   SET     behalf_by   = ' '
   WHERE   behalf_by   IS NULL;
COMMIT;
/

/******************************************************************/
/******************************************************************/
/*** Create Table to Hold Payroll Deduction Pledge Payment Info ***/
/******************************************************************/
/******************************************************************/
DROP TABLE   a_ack_rcpt_pd_sched;
COMMIT;
/

CREATE TABLE   a_ack_rcpt_pd_sched       AS
      SELECT   receipt,
               associated_amount_cfy,
               0                         AS payment_number,
               0                         AS payment_amount,
               '*****  UNKNOWN  *****'   AS start_date,
               '*****  UNKNOWN  *****'   AS end_date
        FROM   a_ack_rcpt
       WHERE   flag_payroll_deduction  = 1;
COMMIT;
/

/*** Find Number of Payments ***/
UPDATE      a_ack_rcpt_pd_sched                   t
   SET      t.payment_number                      =
   (SELECT  COUNT(p.payment_schedule_pledge_nbr)
     FROM   payment_schedule                      p
    WHERE   t.receipt                             = p.payment_schedule_pledge_nbr);
COMMIT;
/

/*** Assume Equal Payment Amounts ***/
UPDATE      a_ack_rcpt_pd_sched
   SET      payment_amount             = ROUND(associated_amount_cfy/payment_number,2);
COMMIT;
/

/*** Start Date ***/
UPDATE      a_ack_rcpt_pd_sched                              t
   SET      t.start_date                                     =
   (SELECT  DECODE(SUBSTR(MIN(p.payment_schedule_date),5,2), '01','January, ',
                                                             '02','February, ',
                                                             '03','March, ',
                                                             '04','April, ',
                                                             '05','May, ',
                                                             '06','June, ',
                                                             '07','July, ',
                                                             '08','August, ',
                                                             '09','September, ',
                                                             '10','October, ',
                                                             '11','November, ',
                                                             '12','December, ')||SUBSTR(MIN(p.payment_schedule_date),1,4)
     FROM   payment_schedule                                 p
    WHERE   t.receipt                                        = p.payment_schedule_pledge_nbr);
COMMIT;
/

/*** End Date ***/
UPDATE      a_ack_rcpt_pd_sched                              t
   SET      t.end_date                                       =
   (SELECT  DECODE(SUBSTR(MAX(p.payment_schedule_date),5,2), '01','January, ',
                                                             '02','February, ',
                                                             '03','March, ',
                                                             '04','April, ',
                                                             '05','May, ',
                                                             '06','June, ',
                                                             '07','July, ',
                                                             '08','August, ',
                                                             '09','September, ',
                                                             '10','October, ',
                                                             '11','November, ',
                                                             '12','December, ')||SUBSTR(MAX(p.payment_schedule_date),1,4)
     FROM   payment_schedule                                 p
    WHERE   t.receipt                                        = p.payment_schedule_pledge_nbr);
COMMIT;
/

/************************/
/*** Update Main File ***/
/************************/
/*** Update Amount ***/
UPDATE       a_ack_rcpt            a
   SET       a.pd_amount           = 
   (SELECT   t.payment_amount
      FROM   a_ack_rcpt_pd_sched   t
     WHERE   t.receipt             = a.receipt)
   WHERE     flag_payroll_deduction    = 1;
COMMIT;
/

UPDATE       a_ack_rcpt            
   SET       pd_amount           = 0
WHERE        pd_amount           IS NULL;
COMMIT;
/

/*** Update Start Date ***/
UPDATE       a_ack_rcpt   a
   SET       a.pd_start                = 
   (SELECT   SUBSTR(t.start_date,1,20)
      FROM   a_ack_rcpt_pd_sched       t
     WHERE   t.receipt                 = a.receipt)
   WHERE     flag_payroll_deduction    = 1;
COMMIT;
/

UPDATE       a_ack_rcpt            
   SET       pd_start           = ' '
WHERE        pd_start           IS NULL;
COMMIT;
/

/*** Update End Date ***/
UPDATE       a_ack_rcpt   a
   SET       a.pd_end                = 
   (SELECT   SUBSTR(t.end_date,1,20)
      FROM   a_ack_rcpt_pd_sched     t
     WHERE   t.receipt               = a.receipt)
   WHERE     flag_payroll_deduction  = 1;
COMMIT;
/

UPDATE       a_ack_rcpt            
   SET       pd_end           = ' '
WHERE        pd_end           IS NULL;
COMMIT;
/

/****************************/
/****************************/
/*** Get Prospect Manager ***/
/****************************/
/****************************/
UPDATE      a_ack_rcpt                 m
   SET      m.manager_pref_name        = 
   (SELECT  'Please route to '||
            MAX(a.ass_pref_mail_name)||
            ' for review.'
      FROM  a_dw_assignment            a
     WHERE  a.id_number                = m.id_number
       AND  a.ass_type                 IN ('PP','PS','PT'));
COMMIT;
/

UPDATE a_ack_rcpt
   SET manager_pref_name      = ' '
 WHERE manager_pref_name      = 'Please route to  for review.';
COMMIT;
/

/************************************/
/************************************/
/*** Make Text Fields For Numbers ***/
/************************************/
/************************************/
/*** Gifts - If pledge, leave Blank ***/
UPDATE   a_ack_rcpt
   SET   gift       = DECODE(transaction_type,
                      'P', ' ',
                      LTRIM(TO_CHAR(associated_amount_cfy,'$99,999,999,999.99'),' '));
COMMIT;
/

/*** Pledge - If no pledge, leave blank ***/
UPDATE   a_ack_rcpt
   SET   pledge     = DECODE(prim_pledge_original_amount, 
                      0, ' ',
                      LTRIM(TO_CHAR(prim_pledge_original_amount,'$99,999,999,999.99'),' '));
COMMIT;
/

/*** Amount Oustanding - If no pledge, leave blank ***/
UPDATE   a_ack_rcpt
   SET   os         = DECODE(prim_pledge_original_amount, 
                      0, ' ',
                      DECODE(prim_pledge_amount_os,
                      0, '$0.00',
                      LTRIM(TO_CHAR(prim_pledge_amount_os,'$99,999,999,999.99'),' ')));
COMMIT;
/

/********************************/
/********************************/
/*** Set VP as signer for all ***/
/********************************/
/********************************/
UPDATE   a_ack_rcpt
   SET   signer      = 'VP';
COMMIT;
/

/******************************/
/******************************/
/*** Select Segment for VP  ***/
/******************************/
/******************************/
/*** Corporation  ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'Corporate'
  WHERE    person_or_org                ='O'
    AND    ack_segment                  IS NULL;
COMMIT;
/

/***Campus Non-PC Gift***/
UPDATE      a_ack_rcpt
   SET      ack_segment                 = 'Campus Standard',
            signer                      = 'Pres'
  WHERE     flag_faculty_staff          = 1
    AND     faculty_staff_status        = 'Current'
    AND     cfy_commitment                    < 1000;
COMMIT;
/

/*** Memorial Letters ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'Honor'
  WHERE    flag_honor                   = 1
    AND    ack_segment                  IS NULL;
COMMIT;
/

/*** Bequests ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'Bequest'
  WHERE    transaction_type             = 'BQ'
    AND    ack_segment                  IS NULL;
COMMIT;
/

/*** Payroll Deduction Pledge ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'Payroll Pledge'
  WHERE    flag_payroll_deduction       = 1
    AND    ack_segment                  IS NULL;
COMMIT;
/

/*** Payroll Deduction Payment ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'Payroll Payment'
  WHERE    flag_payroll_deduction       = 2
    AND    ack_segment                  IS NULL;
COMMIT;
/





/*** PC Pledges ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'Receipt'
  WHERE    transaction_type             = 'P'
    AND    ack_segment                  IS NULL
    AND    (cfy_commitment              >= 1000
     OR    id_number                    IN
      (SELECT a.id_number
         FROM a_ack_rcpt                a,
              a_dw_young_alum           y
        WHERE a.record_type_code        = 'AL'
          AND a.cfy_commitment          BETWEEN y.pc_gift_level AND y.pc_gift_level_top
          AND a.pref_class_year         = y.year));
COMMIT;
/



/*** No Letter For Pledges Below PC ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'Pledge Below PC - No Rcpt'
  WHERE    transaction_type             = 'P'
    AND    ack_segment                  IS NULL;
COMMIT;
/

/*** Receipt ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'Receipt'
  WHERE    ack_segment                  IS NULL;
COMMIT;
/

/*****************************/
/*****************************/
/*** Create Receipt Fields ***/
/*****************************/
/*****************************/
UPDATE   a_ack_rcpt
   SET   rcpt_line_1 = RTRIM(dater,' ')||
                       CHR(9)||
                       RTRIM(gift,' ')||
                       CHR(9)||
                       RTRIM(pledge,' ')||
                       CHR(9)||
                       RTRIM(os,' ')
   WHERE ack_segment = 'Receipt';
COMMIT;
/

UPDATE   a_ack_rcpt
   SET   rcpt_line_1 = ' '
   WHERE rcpt_line_1 IS NULL;
COMMIT;
/
   
/**************************************************/
/**************************************************/
/*** Double up PC Straight Gifts and PC Pledges ***/
/******** Don't Include Payroll Deduction *********/
/**************************************************/
/**************************************************/
/*** PC ***/
INSERT INTO    a_ack_rcpt
               (id_number,
               receipt,
               batch_number,
               batch_type,
               batch_type_desc,
               operator_name,
               sequence,
               date_of_record,
               dater,
               gift,
               associated_amount_cfy,
               associated_amount_cfy_match,
               associated_amount_cfy_claim,
               associated_code,
               appeal_code,
               transaction_type,            
               transaction_type_desc,       
               prim_pledge_original_amount, 
               pledge,
               prim_pledge_amount_paid,
               prim_pledge_amount_os,
               os,
               alloc,      
               alloc_account,
               alloc_desc,
               alloc_dept_code,
               alloc_dept_desc,
               alloc_administrator_id,
               alloc_administrator_name,
               flag_deferred,
               flag_memorial,               
               flag_reunion_cfy,
               flag_z_gift,
               flag_young_alum,
               flag_parent,
               flag_faculty_staff,
               flag_pc,
               faculty_staff_status,
               flag_payroll_deduction,
               flag_joint,
               flag_honor,
               flag_behalf,
               rcpt_behalf_by,
               rcpt_pc_pledge,
               behalf_by,
               bequest_hisher,
               bequest_himher,
               flag_anonymous,
               cfy_giving,
               cfy_commitment,
               p_care_of,
               p_company_name_1,
               p_business_title,
               p_street1,
               p_street2,
               p_street3,
               p_cityline,
               p_foreign_cityzip,
               p_country_code,
               p_country_desc,
               p_flag_foreign,
               match_co_flag,
               match_form_flag,
               pd_amount,
               pd_start,
               pd_end,
               pc_pfy,
               person_or_org,
               record_type_code,
               record_type_desc,
               record_status_code,
               pref_class_year,
               salutation,
               pref_mail_name,
               pref_name_sort,
               manager_pref_name,
               ack_segment,
               society,
               signer,
               ack_ps,
               rcpt_line_1)
    (SELECT    a.id_number,
               a.receipt,
               a.batch_number,
               a.batch_type,
               a.batch_type_desc,
               a.operator_name,
               a.sequence,
               a.date_of_record,
               a.dater,
               a.gift,
               a.associated_amount_cfy,
               a.associated_amount_cfy_match,
               a.associated_amount_cfy_claim,
               a.associated_code,
               a.appeal_code,
               a.transaction_type,            
               a.transaction_type_desc,       
               a.prim_pledge_original_amount,
               a.pledge,
               a.prim_pledge_amount_paid,
               a.prim_pledge_amount_os,
               a.os,
               a.alloc,      
               a.alloc_account,
               a.alloc_desc,
               a.alloc_dept_code,
               a.alloc_dept_desc,
               a.alloc_administrator_id,
               a.alloc_administrator_name,
               a.flag_deferred,
               a.flag_memorial,               
               a.flag_reunion_cfy,
               a.flag_z_gift,
               a.flag_young_alum,
               a.flag_parent,
               a.flag_faculty_staff,
               a.flag_pc,
               a.faculty_staff_status,
               a.flag_payroll_deduction,
               a.flag_joint,
               a.flag_honor,
               a.flag_behalf,
               a.rcpt_behalf_by,
               a.rcpt_pc_pledge,
               a.behalf_by,
               a.bequest_hisher,
               a.bequest_himher,
               a.flag_anonymous,
               a.cfy_giving,
               a.cfy_commitment,
               a.p_care_of,
               a.p_company_name_1,
               a.p_business_title,
               a.p_street1,
               a.p_street2,
               a.p_street3,
               a.p_cityline,
               a.p_foreign_cityzip,
               a.p_country_code,
               a.p_country_desc,
               a.p_flag_foreign,
               a.match_co_flag,
               a.match_form_flag,
               a.pd_amount,
               a.pd_start,
               a.pd_end,
               a.pc_pfy,
               a.person_or_org,
               a.record_type_code,
               a.record_type_desc,
               a.record_status_code,
               a.pref_class_year,
               a.salutation,
               a.pref_mail_name,
               a.pref_name_sort,
               a.manager_pref_name,
               'No Segment',
               a.society,
               'Pres',
               ' ',
               ' '
    FROM       a_ack_rcpt                   a
    WHERE      a.person_or_org              = 'P'
      AND      a.transaction_type           IN('GF','BQ','P')
      AND      a.cfy_commitment             >= 1000
      AND      a.flag_payroll_deduction     = 0);
COMMIT;
/

/*** Young PC ***/
INSERT INTO    a_ack_rcpt
               (id_number,
               receipt,
               batch_number,
               batch_type,
               batch_type_desc,
               operator_name,
               sequence,
               date_of_record,
               dater,
               gift,
               associated_amount_cfy,
               associated_amount_cfy_match,
               associated_amount_cfy_claim,
               associated_code,
               appeal_code,
               transaction_type,            
               transaction_type_desc,       
               prim_pledge_original_amount, 
               pledge,
               prim_pledge_amount_paid,
               prim_pledge_amount_os,
               os,
               alloc,      
               alloc_account,
               alloc_desc,
               alloc_dept_code,
               alloc_dept_desc,
               alloc_administrator_id,
               alloc_administrator_name,
               flag_deferred,
               flag_memorial,               
               flag_reunion_cfy,
               flag_z_gift,
               flag_young_alum,
               flag_parent,
               flag_faculty_staff,
               flag_pc,
               faculty_staff_status,
               flag_payroll_deduction,
               flag_joint,
               flag_honor,
               flag_behalf,
               rcpt_behalf_by,
               rcpt_pc_pledge,
               behalf_by,
               bequest_hisher,
               bequest_himher,
               flag_anonymous,
               cfy_giving,
               cfy_commitment,
               p_care_of,
               p_company_name_1,
               p_business_title,
               p_street1,
               p_street2,
               p_street3,
               p_cityline,
               p_foreign_cityzip,
               p_country_code,
               p_country_desc,
               p_flag_foreign,
               match_co_flag,
               match_form_flag,
               pd_amount,
               pd_start,
               pd_end,
               pc_pfy,
               person_or_org,
               record_type_code,
               record_type_desc,
               record_status_code,
               pref_class_year,
               salutation,
               pref_mail_name,
               pref_name_sort,
               manager_pref_name,
               ack_segment,
               society,
               signer,
               ack_ps,
               rcpt_line_1)
    (SELECT    a.id_number,
               a.receipt,
               a.batch_number,
               a.batch_type,
               a.batch_type_desc,
               a.operator_name,
               a.sequence,
               a.date_of_record,
               a.dater,
               a.gift,
               a.associated_amount_cfy,
               a.associated_amount_cfy_match,
               a.associated_amount_cfy_claim,
               a.associated_code,
               a.appeal_code,
               a.transaction_type,            
               a.transaction_type_desc,       
               a.prim_pledge_original_amount,
               a.pledge,
               a.prim_pledge_amount_paid,
               a.prim_pledge_amount_os,
               a.os,
               a.alloc,      
               a.alloc_account,
               a.alloc_desc,
               a.alloc_dept_code,
               a.alloc_dept_desc,
               a.alloc_administrator_id,
               a.alloc_administrator_name,
               a.flag_deferred,
               a.flag_memorial,               
               a.flag_reunion_cfy,
               a.flag_z_gift,
               a.flag_young_alum,
               a.flag_parent,
               a.flag_faculty_staff,
               a.flag_pc,
               a.faculty_staff_status,
               a.flag_payroll_deduction,
               a.flag_joint,
               a.flag_honor,
               a.flag_behalf,
               a.rcpt_behalf_by,
               a.rcpt_pc_pledge,
               a.behalf_by,
               a.bequest_hisher,
               a.bequest_himher,
               a.flag_anonymous,
               a.cfy_giving,
               a.cfy_commitment,
               a.p_care_of,
               a.p_company_name_1,
               a.p_business_title,
               a.p_street1,
               a.p_street2,
               a.p_street3,
               a.p_cityline,
               a.p_foreign_cityzip,
               a.p_country_code,
               a.p_country_desc,
               a.p_flag_foreign,
               a.match_co_flag,
               a.match_form_flag,
               a.pd_amount,
               a.pd_start,
               a.pd_end,
               a.pc_pfy,
               a.person_or_org,
               a.record_type_code,
               a.record_type_desc,
               a.record_status_code,
               a.pref_class_year,
               a.salutation,
               a.pref_mail_name,
               a.pref_name_sort,
               a.manager_pref_name,
               'No Segment',
               a.society,
               'Pres',
               ' ',
               ' '
    FROM       a_ack_rcpt                   a,
               a_dw_young_alum              y
    WHERE      a.transaction_type           IN('GF','BQ','P')
      AND      a.cfy_commitment             BETWEEN y.pc_gift_level AND y.pc_gift_level_top
      AND      a.pref_class_year            = y.year
      AND      a.record_type_code           ='AL'
      AND      a.flag_payroll_deduction     = 0);
COMMIT;
/

/*** PC - Original Pledge < $1,000 ***/
INSERT INTO    a_ack_rcpt
               (id_number,
               receipt,
               batch_number,
               batch_type,
               batch_type_desc,
               operator_name,
               sequence,
               date_of_record,
               dater,
               gift,
               associated_amount_cfy,
               associated_amount_cfy_match,
               associated_amount_cfy_claim,
               associated_code,
               appeal_code,
               transaction_type,            
               transaction_type_desc,       
               prim_pledge_original_amount, 
               pledge,
               prim_pledge_amount_paid,
               prim_pledge_amount_os,
               os,
               alloc,      
               alloc_account,
               alloc_desc,
               alloc_dept_code,
               alloc_dept_desc,
               alloc_administrator_id,
               alloc_administrator_name,
               flag_deferred,
               flag_memorial,               
               flag_reunion_cfy,
               flag_z_gift,
               flag_young_alum,
               flag_parent,
               flag_faculty_staff,
               flag_pc,
               faculty_staff_status,
               flag_payroll_deduction,
               flag_joint,
               flag_honor,
               flag_behalf,
               rcpt_behalf_by,
               rcpt_pc_pledge,
               behalf_by,
               bequest_hisher,
               bequest_himher,
               flag_anonymous,
               cfy_giving,
               cfy_commitment,
               p_care_of,
               p_company_name_1,
               p_business_title,
               p_street1,
               p_street2,
               p_street3,
               p_cityline,
               p_foreign_cityzip,
               p_country_code,
               p_country_desc,
               p_flag_foreign,
               match_co_flag,
               match_form_flag,
               pd_amount,
               pd_start,
               pd_end,
               pc_pfy,
               person_or_org,
               record_type_code,
               record_type_desc,
               record_status_code,
               pref_class_year,
               salutation,
               pref_mail_name,
               pref_name_sort,
               manager_pref_name,
               ack_segment,
               society,
               signer,
               ack_ps,
               rcpt_line_1)
    (SELECT    a.id_number,
               a.receipt,
               a.batch_number,
               a.batch_type,
               a.batch_type_desc,
               a.operator_name,
               a.sequence,
               a.date_of_record,
               a.dater,
               a.gift,
               a.associated_amount_cfy,
               a.associated_amount_cfy_match,
               a.associated_amount_cfy_claim,
               a.associated_code,
               a.appeal_code,
               a.transaction_type,            
               a.transaction_type_desc,       
               a.prim_pledge_original_amount,
               a.pledge,
               a.prim_pledge_amount_paid,
               a.prim_pledge_amount_os,
               a.os,
               a.alloc,      
               a.alloc_account,
               a.alloc_desc,
               a.alloc_dept_code,
               a.alloc_dept_desc,
               a.alloc_administrator_id,
               a.alloc_administrator_name,
               a.flag_deferred,
               a.flag_memorial,               
               a.flag_reunion_cfy,
               a.flag_z_gift,
               a.flag_young_alum,
               a.flag_parent,
               a.flag_faculty_staff,
               a.flag_pc,
               a.faculty_staff_status,
               a.flag_payroll_deduction,
               a.flag_joint,
               a.flag_honor,
               a.flag_behalf,
               a.rcpt_behalf_by,
               a.rcpt_pc_pledge,
               a.behalf_by,
               a.bequest_hisher,
               a.bequest_himher,
               a.flag_anonymous,
               a.cfy_giving,
               a.cfy_commitment,
               a.p_care_of,
               a.p_company_name_1,
               a.p_business_title,
               a.p_street1,
               a.p_street2,
               a.p_street3,
               a.p_cityline,
               a.p_foreign_cityzip,
               a.p_country_code,
               a.p_country_desc,
               a.p_flag_foreign,
               a.match_co_flag,
               a.match_form_flag,
               a.pd_amount,
               a.pd_start,
               a.pd_end,
               a.pc_pfy,
               a.person_or_org,
               a.record_type_code,
               a.record_type_desc,
               a.record_status_code,
               a.pref_class_year,
               a.salutation,
               a.pref_mail_name,
               a.pref_name_sort,
               a.manager_pref_name,
               'No Segment',
               a.society,
               'Pres',
               ' ',
               ' '
    FROM       a_ack_rcpt                    a
    WHERE      a.person_or_org               = 'P'
      AND      a.transaction_type            IN('PP')
      AND      a.cfy_commitment              >= 1000
      AND      a.prim_pledge_original_amount < 1000
      AND      a.flag_payroll_deduction      = 0);
COMMIT;
/

/**************************************************/
/**************************************************/
/*** Triple up Gugg Straight Gifts ****************/
/******** Don't Include Payroll Deduction *********/
/**************************************************/
/**************************************************/
/*** Gugg ***/
INSERT INTO    a_ack_rcpt
               (id_number,
               receipt,
               batch_number,
               batch_type,
               batch_type_desc,
               operator_name,
               sequence,
               date_of_record,
               dater,
               gift,
               associated_amount_cfy,
               associated_amount_cfy_match,
               associated_amount_cfy_claim,
               associated_code,
               appeal_code,
               transaction_type,            
               transaction_type_desc,       
               prim_pledge_original_amount, 
               pledge,
               prim_pledge_amount_paid,
               prim_pledge_amount_os,
               os,
               alloc,      
               alloc_account,
               alloc_desc,
               alloc_dept_code,
               alloc_dept_desc,
               alloc_administrator_id,
               alloc_administrator_name,
               flag_deferred,
               flag_memorial,               
               flag_reunion_cfy,
               flag_z_gift,
               flag_young_alum,
               flag_parent,
               flag_faculty_staff,
               flag_pc,
               faculty_staff_status,
               flag_payroll_deduction,
               flag_joint,
               flag_honor,
               flag_behalf,
               rcpt_behalf_by,
               rcpt_pc_pledge,
               behalf_by,
               bequest_hisher,
               bequest_himher,
               flag_anonymous,
               cfy_giving,
               cfy_commitment,
               p_care_of,
               p_company_name_1,
               p_business_title,
               p_street1,
               p_street2,
               p_street3,
               p_cityline,
               p_foreign_cityzip,
               p_country_code,
               p_country_desc,
               p_flag_foreign,
               match_co_flag,
               match_form_flag,
               pd_amount,
               pd_start,
               pd_end,
               pc_pfy,
               person_or_org,
               record_type_code,
               record_type_desc,
               record_status_code,
               pref_class_year,
               salutation,
               pref_mail_name,
               pref_name_sort,
               manager_pref_name,
               ack_segment,
               society,
               signer,
               ack_ps,
               rcpt_line_1)
    (SELECT    a.id_number,
               a.receipt,
               a.batch_number,
               a.batch_type,
               a.batch_type_desc,
               a.operator_name,
               a.sequence,
               a.date_of_record,
               a.dater,
               a.gift,
               a.associated_amount_cfy,
               a.associated_amount_cfy_match,
               a.associated_amount_cfy_claim,
               a.associated_code,
               a.appeal_code,
               a.transaction_type,            
               a.transaction_type_desc,       
               a.prim_pledge_original_amount,
               a.pledge,
               a.prim_pledge_amount_paid,
               a.prim_pledge_amount_os,
               a.os,
               a.alloc,      
               a.alloc_account,
               a.alloc_desc,
               a.alloc_dept_code,
               a.alloc_dept_desc,
               a.alloc_administrator_id,
               a.alloc_administrator_name,
               a.flag_deferred,
               a.flag_memorial,               
               a.flag_reunion_cfy,
               a.flag_z_gift,
               a.flag_young_alum,
               a.flag_parent,
               a.flag_faculty_staff,
               a.flag_pc,
               a.faculty_staff_status,
               a.flag_payroll_deduction,
               a.flag_joint,
               a.flag_honor,
               a.flag_behalf,
               a.rcpt_behalf_by,
               a.rcpt_pc_pledge,
               a.behalf_by,
               a.bequest_hisher,
               a.bequest_himher,
               a.flag_anonymous,
               a.cfy_giving,
               a.cfy_commitment,
               a.p_care_of,
               a.p_company_name_1,
               a.p_business_title,
               a.p_street1,
               a.p_street2,
               a.p_street3,
               a.p_cityline,
               a.p_foreign_cityzip,
               a.p_country_code,
               a.p_country_desc,
               a.p_flag_foreign,
               a.match_co_flag,
               a.match_form_flag,
               a.pd_amount,
               a.pd_start,
               a.pd_end,
               a.pc_pfy,
               a.person_or_org,
               a.record_type_code,
               a.record_type_desc,
               a.record_status_code,
               a.pref_class_year,
               a.salutation,
               a.pref_mail_name,
               a.pref_name_sort,
               a.manager_pref_name,
               'No Segment',
               a.society,
               'VP Gugg',
               ' ',
               ' '
    FROM       a_ack_rcpt                   a
    WHERE      a.person_or_org              = 'P'
      AND      a.transaction_type           IN('GF')
      AND      a.cfy_giving                 >= 25000
      AND      a.associated_amount_cfy      >= 25000
      AND      a.flag_payroll_deduction     = 0
      AND      a.signer                     = 'VP');
COMMIT;
/

/**************************/
/**************************/
/*** Update PC Flag *******/
/**************************/
/**************************/

/*** PC Flag ***/
UPDATE          a_ack_rcpt
   SET          flag_pc         = 0
   WHERE        flag_pc         IS NULL;
COMMIT;
/


/*** PC Flag ***/
UPDATE        a_ack_rcpt                         
   SET        flag_pc                 =  1
    WHERE      cfy_commitment           >= 1000
    OR    id_number                    IN
      (SELECT id_number
         FROM a_ack_rcpt                a,
              a_dw_young_alum           y
        WHERE a.record_type_code        = 'AL'
          AND a.cfy_commitment          BETWEEN y.pc_gift_level AND y.pc_gift_level_top
          AND a.pref_class_year         = y.year);
COMMIT;
/

/***********************************/
/***********************************/
/*** Select Segment for PC Gifts ***/
/***********************************/
/***********************************/
/**** Bequests ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'PC Bequest'
  WHERE    transaction_type             = 'BQ'
    AND    ack_segment                  = 'No Segment';
COMMIT;
/

/**** Memorial PC ***/
UPDATE      a_ack_rcpt
   SET      ack_segment                 = 'Memorial PC',
            signer                      = 'Pres'
   WHERE    cfy_commitment                 >= 1000
     AND    ack_segment                 = 'Honor';
COMMIT;
/

/**** Guggenheim ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'Gugg'
  WHERE    cfy_commitment               >= 25000
    AND    ack_segment                  = 'No Segment';
COMMIT;
/

/**** Final Pledge Payment PC ****/
UPDATE     a_ack_rcpt      
   SET     ack_segment                  = 'Pledge Payment PC',
           signer                       = 'Pres'     
 WHERE     ack_segment                  = 'Receipt'
   AND     transaction_type             = 'PP'
   AND     cfy_commitment               >= 1000
   AND     (cfy_giving                  >= 1000
            OR prim_pledge_amount_os    = 0);
COMMIT;
/

/**** Athletic PC ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'Athletic PC'
  WHERE    flag_faculty_staff           <> 1
    AND    alloc_dept_code              = 'PA'
    AND    ack_segment                  = 'No Segment';
COMMIT;
/

/**** Parent PC ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'Parent PC'
  WHERE    flag_parent                  = 1
    AND    ack_segment                  = 'No Segment';
COMMIT;
/

/**** Campus PC ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'Campus PC'
  WHERE    flag_faculty_staff           = 1
    AND    faculty_staff_status         = 'Current'
    AND    ack_segment                  = 'No Segment';
COMMIT;
/

/**** Standard PC ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'PC'
  WHERE    ack_segment                  = 'No Segment';
COMMIT;
/




/*******************************/
/*******************************/
/*** Select Society PC Gifts ***/
/*******************************/
/*******************************/
UPDATE      a_ack_rcpt
   SET      society                      = 'George M. Randall'
   WHERE    flag_pc                      = 1
     AND    cfy_commitment               < 2500;
COMMIT;
/

UPDATE      a_ack_rcpt
   SET      society                      = 'George M. Randall'
   WHERE    flag_pc                      = 1
     AND    cfy_commitment               BETWEEN 1000 AND 2499.99;
COMMIT;
/
   
UPDATE      a_ack_rcpt
   SET      society                      = 'Francis M. Van Tuyl'
   WHERE    flag_pc                      = 1
     AND    cfy_commitment               BETWEEN 2500 AND 9999.99
     AND    society                      IS NULL;
COMMIT;
/

UPDATE      a_ack_rcpt
   SET      society                      = 'Winfield S. Stratton'
   WHERE    flag_pc                      = 1
     AND    cfy_commitment               BETWEEN 10000 AND 24999.99
     AND    society                      IS NULL;
COMMIT;
/

UPDATE      a_ack_rcpt
   SET      society                      = 'Simon Guggenheim'
   WHERE     flag_pc                    =  1
     AND   cfy_commitment               >= 25000
     AND    society                      IS NULL;
COMMIT;
/



UPDATE      a_ack_rcpt
   SET      society          = ' '
   WHERE    society          IS NULL;
COMMIT;
/

/***Put in PC level in PC Pledge receipt***/
UPDATE a_ack_rcpt                       a
   SET a.rcpt_pc_pledge                 ='If payments are completed by June 30th, 2003, you will be recognized at the '||
   (a.society)||
   ' level of the President'||
   CHR(39)||
    's Council.  '
 WHERE       a.transaction_type           = 'P'
   AND       a.cfy_commitment             >= 1000;
COMMIT;
/

UPDATE     a_ack_rcpt
   SET     rcpt_pc_pledge   = ' '
   WHERE   rcpt_pc_pledge   IS NULL;
COMMIT;
/
/*****************************/
/*****************************/
/*** Update Anonymous Flag ***/
/*****************************/
/*****************************/
UPDATE    a_ack_rcpt                   m
   SET    m.flag_anonymous             = 'ANONYMOUS'
   WHERE  m.id_number IN(
   SELECT ml.id_number
    FROM  mailing_list                 ml
   WHERE  ml.mail_list_code            = 'ANON');
COMMIT;
/

UPDATE    a_ack_rcpt                   m
   SET    m.flag_anonymous             = 'ANONYMOUS'
   WHERE  m.id_number IN(
   SELECT g.gift_donor_id
    FROM  gift                         g
   WHERE  g.gift_associated_anonymous  <> ' ');
COMMIT;
/

UPDATE   a_ack_rcpt                 
   SET   flag_anonymous             = ' '
   WHERE flag_anonymous             IS NULL;
COMMIT;
/



/****************************/
/****************************/
/*** Received Letter Flag ***/
/****************************/
/****************************/
UPDATE      a_ack_rcpt
   SET      flag_received_letter    = 'Possibly already received letter this fiscal year'
   WHERE    cfy_commitment          - (associated_amount_cfy
                                    + associated_amount_cfy_match 
                                    + associated_amount_cfy_claim) >= 1000;

UPDATE      a_ack_rcpt
   SET      flag_received_letter    = ' '
   WHERE    flag_received_letter    IS NULL;
COMMIT;
/

/*******************/
/*******************/
/*** Populate PS ***/
/*******************/
/*******************/
UPDATE   a_ack_rcpt
   SET   ack_ps      = 'You can now make your gift online at https://www.alumnifriends.mines.edu/forms/pledge/pledge.htm'
   WHERE signer      = 'VP'
     AND ack_segment = 'Receipt';
COMMIT;
/

UPDATE a_ack_rcpt
   SET ack_ps      = ' '
 WHERE ack_ps      IS NULL;
COMMIT;
/

/******************************************************/
/******************************************************/
/*** Populate Letter Field where Segment is Receipt ***/
/******************************************************/
/******************************************************/
UPDATE a_ack_rcpt
   SET ack_letter1 = 'No Letter for Receipts'
 WHERE ack_segment = 'Receipt';
COMMIT;
/

/***********************************************/
/***********************************************/
/*** Populate Letter Field For All Corporate ***/
/***********************************************/
/***********************************************/
UPDATE a_ack_rcpt
   SET ack_letter1   = 'No Letter for Corporate'
 WHERE person_or_org = 'O';
COMMIT;
/

/*******************************/
/*** Create Indexes on Table ***/
/*******************************/
CREATE INDEX ADVANCE.a_ack_rcpt_id_number ON ADVANCE.a_ack_rcpt(id_number);
COMMIT;
/

ANALYZE TABLE ADVANCE.a_ack_rcpt COMPUTE STATISTICS;

/*******************************************************************/
/*** Need to grant these to role if user is able to access table ***/
/*******************************************************************/
GRANT ALTER  ON a_ack_rcpt TO ADVROLE;
/
GRANT DELETE ON a_ack_rcpt TO ADVROLE;
/
GRANT INSERT ON a_ack_rcpt TO ADVROLE;
/
GRANT SELECT ON a_ack_rcpt TO ADVROLE;
/
GRANT UPDATE ON a_ack_rcpt TO ADVROLE;
/

GRANT ALTER  ON a_ack_rcpt_honor TO ADVROLE;
/
GRANT DELETE ON a_ack_rcpt_honor TO ADVROLE;
/
GRANT INSERT ON a_ack_rcpt_honor TO ADVROLE;
/
GRANT SELECT ON a_ack_rcpt_honor TO ADVROLE;
/
GRANT UPDATE ON a_ack_rcpt_honor TO ADVROLE;
/

/*** Update Runtimes ***/
INSERT INTO ADVANCE.a_dw_runtimes
   VALUES
      ('Finish','Create a_ack_rcpt table',TO_CHAR(SYSDATE, 'YYYYMMDD:HH:MI:SS'), SYSDATE);

COMMIT;
/

EXIT;
