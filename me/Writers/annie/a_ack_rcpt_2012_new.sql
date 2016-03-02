/*** Update Runtimes ***/
INSERT INTO ADVANCE.a_dw_runtimes
   VALUES
      ('Start','Create a_ack_rcpt table',TO_CHAR(SYSDATE, 'YYYYMMDD:HH:MI:SS'), SYSDATE);
COMMIT; 

/****************************************************/
/****************************************************/
/**** Create a Table to Hold Gift Information ****/
/****************************************************/
/****************************************************/
TRUNCATE TABLE a_ack_rcpt;
/

/***
drop table advance.a_ack_rcpt;
commit;
/

create TABLE ADVANCE.a_ack_rcpt
   (
   id_number                   VARCHAR2(10)  NOT NULL,
   receipt                     VARCHAR2(10)  NOT NULL,
   receipt_paid                 VARCHAR2(10) NULL,
   transaction_type            VARCHAR2(2)   NOT NULL, 
   transaction_type_desc       VARCHAR2(20)  NULL, 
   ack_gift_sequence            NUMBER(2)  NULL,
   ack_pledge_sequence       NUMBER(2) NULL,
   ack_payroll_pmt_seq          NUMBER(2) NULL,
   pc_gift_xsequence           NUMBER(2)     NULL,
   today_xsequence          NUMBER(2) NULL,
   batch_number                VARCHAR2(10)  NULL,
   batch_type                  VARCHAR2(1)   NULL,
   batch_type_desc             VARCHAR2(40)  NULL,
   operator_name               VARCHAR2(32)  NULL,
   sequence                    NUMBER(6)     NOT NULL,
   date_of_record              VARCHAR2(8)   NOT NULL,
   dater                       VARCHAR2(30)  NULL,
   month_of_record             VARCHAR2(15)  NULL,
   gift                        VARCHAR2(30)  NULL,
   associated_amount_cfy       NUMBER(14,2)  NOT NULL,
   associated_amount_cfy_match NUMBER(14,2)  NULL,
   associated_amount_cfy_claim NUMBER(14,2)  NULL,
   mg_donor_matched_id          VARCHAR2(10) NULL,
   mg_donor_matched_name     VARCHAR2(40)  NULL,
   mg_receipt_matched   VARCHAR2(10) NULL,
   mg_corp_contact_id     VARCHAR2(10) NULL,
   mg_corp_contact_name  VARCHAR2(40) NULL,
   associated_code             VARCHAR2(1)   NOT NULL,
   appeal_code                 VARCHAR2(5)   NULL,
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
   flag_committee              VARCHAR2(5)   NULL,
   flag_multi_year             NUMBER(1)     NULL,
   flag_letter_sequence        NUMBER(1)     NULL,
   flag_deferred               NUMBER(1)     NULL,
   flag_memorial               NUMBER(1)     NULL,
   flag_reunion_cfy            NUMBER(1)     NULL,
   flag_z_gift                 NUMBER(1)     NULL,
   flag_young_alum             NUMBER(1)     NULL,
   cnt_undergrad             NUMBER(1)     NULL,
   flag_parent                 NUMBER(1)     NULL,
   flag_faculty_staff          NUMBER(1)     NULL,
   flag_campus                 NUMBER(1)     NULL,
   campus_role              VARCHAR2(28) NULL,
   flag_pc                     NUMBER(1)     NULL,
   flag_pc_cash             NUMBER(1)    NULL,
   flag_pc_this_gift       NUMBER(1)   NULL,
   flag_first_pc_tfy       NUMBER(1) NULL,
   flag_society_change  NUMBER(1) NULL,
   flag_new_cs_level      NUMBER(1) NULL,
   flag_new_cs_level_this_gift NUMBER(1) NULL,
   flag_securities             NUMBER(1)     NULL,
   flag_payroll_deduction      NUMBER(1)     NULL,
   flag_pmt_w_pledge    NUMBER(1)   NULL,
   flag_joint                  NUMBER(1)     NULL,
   flag_honor                  NUMBER(1)     NULL,
   flag_behalf                 NUMBER(1)     NULL,
   rcpt_behalf_by              VARCHAR2(120) NULL,
   rcpt_pc_pledge              VARCHAR2(160) NULL,
   valuation_date              VARCHAR2(8)   NULL,
   securities_desc             VARCHAR2(255) NULL,
   number_of_shares            NUMBER(6)     NULL,
   valuation_amt               NUMBER(14,2)  NULL,
   value_per_share             NUMBER(18,6)  NULL, 
   behalf_by                   VARCHAR2(60)  NULL,
   bequest_hisher              VARCHAR2(3)   NULL,
   bequest_himher              VARCHAR2(3)   NULL,
   pc_gift_text                 VARCHAR2(10) NULL,
   children_sdc                     VARCHAR2(9) NULL,
   children_hht                 VARCHAR2(5) NULL,
   child_children               VARCHAR2(9) NULL,
   committee_region            VARCHAR2(20)  NULL,
   flag_anonymous              VARCHAR2(9)   NULL,
   flag_received_letter        VARCHAR2(100)  NULL,
   cfy_giving                  NUMBER(14,2)  NULL,
   cfy_giving_ytd           NUMBER(14,2) NULL,
   cfy_commitment_ytd   NUMBER(14,2) NULL,
   cfy_commitment              NUMBER(14,2)  NULL,
   gift_amount_today        NUMBER(14,2) NULL,
   lt_giving_today            NUMBER(14,2) NULL,
   lt_giving_yesterday            NUMBER(14,2) NULL,
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
   p_phone_formatted           VARCHAR2(20)  NULL,
   p_email_address             VARCHAR2(80)  NULL,
   b_care_of                   VARCHAR2(45)  NULL,
   b_company_name_1            VARCHAR2(60)  NULL,
   b_company_name_2            VARCHAR2(60)  NULL,
   b_business_title            VARCHAR2(60)  NULL,
   b_street1                   VARCHAR2(40)  NULL,
   b_street2                   VARCHAR2(40)  NULL,
   b_street3                   VARCHAR2(40)  NULL,
   b_cityline                  VARCHAR2(60)  NULL,
   b_foreign_cityzip           VARCHAR2(40)  NULL,
   b_country_code              VARCHAR2(5)   NULL,
   b_country_desc              VARCHAR2(40)  NULL,
   b_email_address             VARCHAR2(80)  NULL,
   b_flag_foreign              NUMBER(1)     NULL,
   match_co_flag               NUMBER(1)     NULL,
   match_form_flag             NUMBER(1)     NULL,
   pd_amount                   NUMBER(16,2)  NULL,
   pd_start                    VARCHAR2(20)  NULL,
   pd_end                      VARCHAR2(20)  NULL,
   payment_number              NUMBER(2)     NULL,
   payment_number_text   VARCHAR2(10) NULL,
   pc_pfy                      NUMBER(1)     NULL,
   person_or_org               CHAR(1)       NULL,
   record_type_code            VARCHAR2(2)   NULL,
   record_type_desc            VARCHAR2(40)  NULL, 
   record_status_code          CHAR(1)       NULL,
   pref_class_year             VARCHAR2(4)   NULL,
   salutation                  VARCHAR2(80)  NULL,
   molly_sal                   VARCHAR2(80)  NULL,
   pref_mail_name              VARCHAR2(80)  NULL,
   pref_name_sort              VARCHAR2(80)  NULL,
   manager_pref_name           VARCHAR2(200) NULL,
   manager_id_number           VARCHAR2(10)  NULL,
   ack_segment                 VARCHAR2(30)  NULL,
   society                     VARCHAR2(60)  NULL, --based on commitment
   society_now          VARCHAR2(60) NULL,  --based on cash given so far
   signer                      VARCHAR2(10)   NULL,
   ack_letter1                 VARCHAR2(4000)NULL,
   ack_letter2                 VARCHAR2(100) NULL,
   ack_letter3                 VARCHAR2(4000)NULL,
   ack_ps                      VARCHAR2(310) NULL,
   rcpt_line_1                 VARCHAR2(500) NULL,
   pc2_email1                   VARCHAR2(70),
   pc2_email2                   VARCHAR2(70),
   pc2_email3                   VARCHAR2(70),
   pc2_email4                   VARCHAR2(70),
   pc2_email5                   VARCHAR2(70));
COMMIT;
/

/*****************************************************/
/*****************************************************/
/*** Load All ID's of current FY gifts into File ***/
/*****************************************************/
/*****************************************************/
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
                        0,
                        person_or_org,
                        record_type_code,
                        record_type_desc,
                        record_status_code,
                        pref_class_year,
                        pref_mail_name,
                        pref_name_sort
   FROM    a_dw_gift_cfy                dw
   WHERE   dw.year_of_giving          = (select cfy_year from a_dw_fiscal_dates)
     AND   dw.flag_alumni               = 0
     AND   dw.flag_non_monthend   = 0);
COMMIT;
/
/****************************************************************************************************************************************************************************************************************/
/*** Add Back in Behalf Names from a_dw_gift_cfy_behalf ***/
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
   WHERE   b.receipt                           = a.receipt
     AND   a.transaction_type                  <> 'MC');
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
            m.p_flag_foreign,
            m.p_phone_formatted,
            m.p_email_address,
            m.b_care_of,
            m.b_company_name_1,
            m.b_company_name_2,
            m.b_business_title,
            m.b_street1,
            m.b_street2,
            m.b_street3,
            m.b_cityline,
            m.b_foreign_cityzip,
            m.b_country_code,
            m.b_country_desc,
            m.b_email_address,
            m.b_flag_foreign
            )     = 
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
            t.p_flag_foreign,
            t.p_phone_formatted,
            t.p_email_address,    
            t.b_care_of,
            t.b_company_name_1,
            t.b_company_name_2,
            t.b_business_title,
            t.b_street1,
            t.b_street2,
            t.b_street3,
            t.b_cityline,
            t.b_foreign_cityzip,
            t.b_country_code,
            t.b_country_desc,
            t.b_email_address,
            t.b_flag_foreign
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
/***  Update Batch Number, Operator Name and Batch Type, and Receipt Paid ***/
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

/*** His/Her/Their for children ***/
UPDATE  a_ack_rcpt  a
      SET a.children_sdc =
        (select dw.children_sdc
           from a_dw_children_students  dw
         where dw.id_number = a.id_number);
COMMIT;         

UPDATE  a_ack_rcpt  a
      SET a.children_hht =
        (select dw.children_hht
           from a_dw_children_students  dw
         where dw.id_number = a.id_number);
COMMIT;         

UPDATE a_ack_rcpt   a
       SET a.child_children =
        (SELECT dw.child_children
             FROM a_dw_children_students   dw
          WHERE dw.id_number = a.id_number);
COMMIT;          


/*******************************/
/*** Create Indexes on Table ***/
/**************************
CREATE INDEX ADVANCE.a_ack_rcpt_id_number ON ADVANCE.a_ack_rcpt(id_number);
COMMIT;
/

CREATE INDEX ADVANCE.a_ack_rcpt_receipt ON ADVANCE.a_ack_rcpt(receipt);
COMMIT;
/
CREATE INDEX ADVANCE.a_ack_rcpt_batch_number ON ADVANCE.a_ack_rcpt(batch_number);
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

UPDATE  a_ack_rcpt
   SET  month_of_record = DECODE(SUBSTR(date_of_record,5,2),'01','January',
                                                            '02','February',
                                                            '03','March',
                                                            '04','April',
                                                            '05','May',
                                                            '06','June',
                                                            '07','July',
                                                            '08','August',
                                                            '09','September',
                                                            '10','October',
                                                            '11','November',
                                                            '12','December');
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
/*** Put in Salutation from a_dw_names ***/
UPDATE      a_ack_rcpt          a
   SET      (a.pref_mail_name,
            a.salutation,
            a.molly_sal)       = 
   (SELECT  n.mail_mail_name_jnt,
            n.sal_jnt,
            n.molly_sal_jnt
      FROM  a_dw_names          n
     WHERE  a.id_number         = n.id_number)
 WHERE      person_or_org       = 'P'
   AND      record_status_code  = 'A';
COMMIT;
/

UPDATE a_ack_rcpt
   SET pref_mail_name = '*** No Name ***/'
 WHERE pref_mail_name IS NULL;
COMMIT;
/

UPDATE a_ack_rcpt
   SET salutation = '*** No Salutation ***/'
 WHERE salutation IS NULL;
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
/*************************************************/
/****** Lifetime Giving at time of each Gift ************/
/*************************************************/
UPDATE a_ack_rcpt   a
        SET a.lt_giving_today =
    (SELECT sum(p.total_jnt_cash)
        FROM a_dw_pyramid  p
     WHERE p.id_number = a.id_number
          AND p.flag_alumni = 0
          AND p.date_of_record <= a.date_of_record);
COMMIT;

UPDATE a_ack_rcpt   a
        SET a.lt_giving_yesterday =
    (SELECT sum(p.total_jnt_cash)
        FROM a_dw_pyramid  p
     WHERE p.id_number = a.id_number
          AND p.flag_alumni = 0
          AND to_char((to_date(p.date_of_record,'YYYYMMDD')),'YYYYMMDD')  <= to_char((to_date(a.date_of_record,'YYYYMMDD')-1),'YYYYMMDD'));
COMMIT;
/*********************************************************************************************************************************************/
/****************** Update CS Flag *********/
/*** Note: This flag only works one time, after donor gives another gift, this will no longer work ***/
update a_ack_rcpt
     set flag_new_cs_level = 1
where person_or_org = 'P'
and (record_status_code = 'A' or transaction_type = 'BQ')
and  id_number IN
    (select id_number
       from a_dw_lt_giving
     where total >= 100000)
and id_number NOT IN
    (select gift_club_id_number
        from gift_clubs 
      where gift_club_code IN ('CS1','CS2','CS3','CS4','CS5'));

update a_ack_rcpt
     set flag_new_cs_level = 2
where person_or_org = 'P'
and (record_status_code = 'A' or transaction_type = 'BQ')
and id_number IN
    (select id_number
       from a_dw_lt_giving
     where total >= 500000)
and id_number NOT IN
    (select gift_club_id_number
        from gift_clubs 
      where gift_club_code IN ('CS4','CS2','CS3','CS5'));

update a_ack_rcpt
     set flag_new_cs_level = 3
where person_or_org = 'P'
and (record_status_code = 'A' or transaction_type = 'BQ')
and  id_number IN
    (select id_number
       from a_dw_lt_giving
     where total >= 1000000)
and id_number NOT IN
    (select gift_club_id_number
        from gift_clubs 
      where gift_club_code IN ('CS2','CS3','CS5'));

update a_ack_rcpt
     set flag_new_cs_level = 4
where person_or_org = 'P'
and (record_status_code = 'A' or transaction_type = 'BQ')
and id_number IN
    (select id_number
       from a_dw_lt_giving
     where total >= 3000000)
and id_number NOT IN
    (select gift_club_id_number
        from gift_clubs 
      where gift_club_code IN ('CS3','CS5'));

update a_ack_rcpt
     set flag_new_cs_level = 5
where person_or_org = 'P'
and (record_status_code = 'A' or transaction_type = 'BQ')
and  id_number IN
    (select id_number
       from a_dw_lt_giving
     where total >= 5000000)
and id_number NOT IN
    (select gift_club_id_number
        from gift_clubs 
      where gift_club_code = 'CS5');
commit;

update a_ack_rcpt
    set flag_new_cs_level = 0
where flag_new_cs_level is null;
commit;

/*** Flag for this gift:  This flag will show if this was supposed to be generated based on dollars alone.  It will keep forever, unlike the flag_new_cs_level which will only work until the donor gives another gift ***/
/*** Note:  This does not rely on the gift_club_code, only lifetime giving amount ***/
update a_ack_rcpt
set flag_new_cs_level_this_gift = 1
where lt_giving_yesterday < 100000
and     lt_giving_today >= 100000;

update a_ack_rcpt
set flag_new_cs_level_this_gift = 2
where lt_giving_yesterday < 500000
and     lt_giving_today >= 500000;

update a_ack_rcpt
set flag_new_cs_level_this_gift = 3
where lt_giving_yesterday < 1000000
and     lt_giving_today >= 1000000;

update a_ack_rcpt
set flag_new_cs_level_this_gift = 4
where lt_giving_yesterday < 3000000
and     lt_giving_today >= 3000000;

update a_ack_rcpt
set flag_new_cs_level_this_gift = 5
where lt_giving_yesterday < 5000000
and     lt_giving_today >= 5000000;
commit;
/****************************************************************************************************************************************/
/******************************************/
/*******************************************/
/**** Update Volunteer/Committee Flag *****/
/*******************************************/
/*******************************************/
/*** On Both Reunion and PC Committees ***/
UPDATE       a_ack_rcpt             a
   SET       a.flag_committee       = 'Both'
 WHERE       a.id_number            IN
        (SELECT id_number 
           FROM committee
          WHERE committee_code = 'RGP'
            AND committee_status_code = 'A')
   AND       a.id_number            IN
        (SELECT id_number
           FROM committee
          WHERE committee_code LIKE ('PCV%')
            AND committee_status_code = 'A');
COMMIT;
/


/*** Flag if on PC Committee ***/
UPDATE      a_ack_rcpt              a
   SET      a.flag_committee        = 'PC'
 WHERE      a.flag_committee        IS NULL
   AND      a.id_number             IN
        (SELECT id_number
           FROM committee
          WHERE committee_code LIKE ('PCV%')
            AND committee_status_code = 'A');
COMMIT;
/


/*** Flag if on Reunion Committee ***/
UPDATE      a_ack_rcpt              a
   SET      a.flag_committee        = 'Reun'
 WHERE      a.flag_committee        IS NULL
   AND      a.id_number             IN
        (SELECT id_number
           FROM committee
          WHERE committee_code = 'RGP'
            AND committee_status_code = 'A');
COMMIT;
/


/*** Update Nulls ***/
UPDATE a_ack_rcpt
   SET flag_committee = 0
 WHERE flag_committee IS NULL;
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

/*** Set Flag Campus ***/
UPDATE        a_ack_rcpt               a
   SET        a.flag_campus                = '1'
 WHERE        a.flag_faculty_staff         = '1'
   AND        a.id_number IN
        (SELECT g.id_number
           FROM a_dw_gift_cfy       g
          WHERE g.faculty_staff_status = 'Current');
COMMIT;
/

/*** Update Nulls ***/
UPDATE        a_ack_rcpt                a
   SET        a.flag_campus                 = '0'
 WHERE        a.flag_campus                 IS NULL;
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

/*** Update Young Alum Undergrad Degree notifier ***/
UPDATE  a_ack_rcpt a
        SET  a.cnt_undergrad =
        (select d.cnt_undergrad
           from a_dw_degree_count  d
         where d.id_number = a.id_number);
commit;

/********************************************/
/********************************************/
/******** Update Campus Role text *************/
/********************************************/
UPDATE      a_ack_rcpt
       SET        campus_role = 'faculty'
WHERE       flag_campus = '1'
      AND      id_number IN
            (SELECT id_number
                FROM employment
             WHERE employer_id_number = '0000020910'
                  AND job_status_code = 'C'
                  AND employ_relat_code = 'PE');
COMMIT;

UPDATE      a_ack_rcpt
       SET        campus_role = 'administrative faculty'
WHERE       flag_campus = '1'
      AND      id_number IN
            (SELECT id_number
                FROM employment
             WHERE employer_id_number = '0000017894'
                  AND job_status_code = 'C'
                  AND employ_relat_code = 'PE');
COMMIT;

UPDATE      a_ack_rcpt
       SET        campus_role = 'staff'
WHERE       flag_campus = '1'
      AND      id_number IN
            (SELECT id_number
                FROM employment
             WHERE employer_id_number = '0000019431'
                  AND job_status_code = 'C'
                  AND employ_relat_code = 'PE');
COMMIT;

UPDATE      a_ack_rcpt
       SET        campus_role = 'Foundation staff'
WHERE       flag_campus = '1'
      AND      id_number IN
            (SELECT id_number
                FROM employment
             WHERE employer_id_number IN ('0000034805','0000042725')
                  AND job_status_code = 'C'
                  AND employ_relat_code = 'PE');
COMMIT;

UPDATE      a_ack_rcpt
       SET        campus_role = 'Alumni Association staff'
WHERE       flag_campus = '1'
      AND      id_number IN
            (SELECT id_number
                FROM employment
             WHERE employer_id_number = '0000018591'
                  AND job_status_code = 'C'
                  AND employ_relat_code = 'PE');
COMMIT;

UPDATE      a_ack_rcpt
        SET      campus_role = 'faculty'
 WHERE      flag_campus = '1'
      AND      campus_role IS NULL
      AND      id_number IN
        (SELECT id_number
            FROM employment
         WHERE job_status_code = 'C'
               AND employ_relat_code = 'CE'
               AND employer_id_number = '0000020910');
COMMIT;

UPDATE      a_ack_rcpt
        SET      campus_role = 'administrative faculty'
 WHERE      flag_campus = '1'
      AND      campus_role IS NULL
      AND      id_number IN
        (SELECT id_number
            FROM employment
         WHERE job_status_code = 'C'
               AND employ_relat_code = 'CE'
               AND employer_id_number = '0000017894');
COMMIT;

UPDATE      a_ack_rcpt
        SET      campus_role = 'staff'
 WHERE      flag_campus = '1'
      AND      campus_role IS NULL
      AND      id_number IN
        (SELECT id_number
            FROM employment
         WHERE job_status_code = 'C'
               AND employ_relat_code = 'CE'
               AND employer_id_number = '0000019431');
COMMIT;

UPDATE a_ack_rcpt
       SET campus_role = '***FACULTY OR STAFF***'
WHERE campus_role IS NULL
      AND flag_campus = '1';
COMMIT;

/********************************************/
/********************************************/
/******** Update Flag for Securities ********/
/********************************************/
/******* updated 1-10-06 - Bryan Mack *******/
UPDATE          a_ack_rcpt
   SET          flag_securities       = 1
   WHERE        receipt IN
    (SELECT prim_gift_receipt_number
       FROM primary_gift
      WHERE prim_gift_payment_type IN ('I','R','S'));

UPDATE          a_ack_rcpt
   SET          flag_securities       = 0
 WHERE          flag_securities       IS NULL;
COMMIT;
/
/*****************************************************/
/*****************************************************/
/*** Update Pledge Information on Pledge Payments  ***/
/*****************************************************/
/*****************************************************/
/*** Create Temp Table to Hold Original Pledge Information ***/
TRUNCATE TABLE   ADVANCE.a_ack_rcpt_pledge
/
/***
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
***/

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
           AND p.alloc <> 'SIGEP'
   GROUP BY p.id_number);
COMMIT;
/

/*** Current Fiscal Year Commitment ***/
UPDATE      a_ack_rcpt                  m
   SET      m.cfy_commitment            =
   (SELECT  SUM(p.total_jnt_commitment)
      FROM  a_dw_pyramid_cfy            p
     WHERE  p.id_number                 = m.id_number
           AND p.flag_non_monthend <> '1'
--note: don't need flag_alumni <> '1' as those gifts aren't in a_dw_pyramid_cfy to begin with
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

/******************************************/
/******************************************/
/*** Calculate Total Gift Sum For Today ********/
/******************************************/
/******************************************/
drop table gift_total_today;
commit;
/

create table gift_total_today
as
(select id_number, date_of_record, sum(associated_amount_cfy + associated_amount_cfy_match + associated_amount_cfy_claim)  gift_amount_today
from a_ack_rcpt
where transaction_type IN ('PP','GF')
group by id_number, date_of_record);
commit;
/

UPDATE a_ack_rcpt     a
        SET a.gift_amount_today =
        (SELECT t.gift_amount_today
             FROM gift_total_today    t
          WHERE a.date_of_record = t.date_of_record
                AND a.id_number = t.id_number)
WHERE a.transaction_type IN ('PP','GF');
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
/*** Updated 10/27/2010 ... added cnt_undergrad >= 1 to young pc as those with ONLY a grad degree at Mines cannot be Young PC per John/Rosie ***/
UPDATE        a_ack_rcpt                         
   SET       flag_pc                  =  1
    WHERE    cfy_commitment           >= 1000
    OR       id_number                IN
      (SELECT id_number
         FROM a_ack_rcpt                a,
              a_dw_young_alum           y
        WHERE a.record_type_code        = 'AL'
          AND a.cfy_commitment          BETWEEN y.pc_gift_level AND y.pc_gift_level_top
          AND a.pref_class_year         = y.year
          AND a.cnt_undergrad         >= 1);
COMMIT;
/

/*** Receipt Paid (for pledge payments) ***/
UPDATE      a_ack_rcpt                a
   SET      a.receipt_paid              = NVL(
   (SELECT  pg.prim_gift_pledge_number
      FROM  primary_gift                pg
     WHERE  pg.prim_gift_receipt_number = a.receipt),' ');
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
TRUNCATE TABLE   ADVANCE.a_ack_temp_honor;
/

/***
CREATE TABLE ADVANCE.a_ack_temp_honor
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
   ***/

INSERT INTO   a_ack_temp_honor       (receipt, gift_associated_code)
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
UPDATE        a_ack_temp_honor       t
   SET        t.start_sequence       =
   (SELECT    MIN(g.gift_sequence)          
      FROM    gift                   g
     WHERE    t.receipt              = g.gift_receipt_number
       AND    g.gift_associated_code = 'M');
COMMIT;
/

/*** Get Total Honored ***/
UPDATE       a_ack_temp_honor        t
   SET       t.total_honored         = 
   (SELECT   COUNT(g.gift_donor_id)
      FROM    gift                   g
     WHERE    t.receipt              = g.gift_receipt_number
       AND    g.gift_associated_code = 'M');
COMMIT;
/

/*** Insert Honor IDs ***/
UPDATE     a_ack_temp_honor        t
   SET     honor_id_number_1       =
   (SELECT g.gift_donor_id
      FROM gift                    g
     WHERE t.receipt               = g.gift_receipt_number
       AND g.gift_sequence         = t.start_sequence);
COMMIT;
/

UPDATE     a_ack_temp_honor        t
   SET     honor_id_number_2       =
   (SELECT g.gift_donor_id
      FROM gift                    g
     WHERE t.receipt               = g.gift_receipt_number
       AND g.gift_sequence         = (t.start_sequence+1)
       AND t.total_honored         = 2);
COMMIT;
/

UPDATE     a_ack_temp_honor        t
   SET     honor_id_number_3       =
   (SELECT g.gift_donor_id
      FROM gift                    g
     WHERE t.receipt               = g.gift_receipt_number
       AND g.gift_sequence         = (t.start_sequence+2)
       AND t.total_honored         = 3);
COMMIT;
/

UPDATE     a_ack_temp_honor        t
   SET     honor_id_number_4       =
   (SELECT g.gift_donor_id
      FROM gift                    g
     WHERE t.receipt               = g.gift_receipt_number
       AND g.gift_sequence         = (t.start_sequence+3)
       AND t.total_honored         = 4);
COMMIT;
/

UPDATE     a_ack_temp_honor        t
   SET     honor_id_number_5       =
   (SELECT g.gift_donor_id
      FROM gift                    g
     WHERE t.receipt               = g.gift_receipt_number
       AND g.gift_sequence         = (t.start_sequence+4)
       AND t.total_honored         = 5);
COMMIT;
/

/*** Update ID_number of Donor ***/
UPDATE       a_ack_temp_honor      t
   SET       t.donor_id_number     =
   (SELECT   a.id_number  
     FROM    a_ack_rcpt            a
     WHERE   t.receipt             = a.receipt
       AND   a.associated_code     = 'P'
       AND   a.transaction_type    NOT IN ('MG','MC'));
COMMIT;
/

/*** Update Name Fields for Honored Person ***/
UPDATE       a_ack_temp_honor              t
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

UPDATE       a_ack_temp_honor                                           t
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

UPDATE       a_ack_temp_honor                                           t
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

UPDATE       a_ack_temp_honor                                           t
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

UPDATE       a_ack_temp_honor                                           t
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
UPDATE       a_ack_temp_honor          t
   SET       t.honor_gender_he_she     = 'he is'
   WHERE     t.honor_gender_code       = 'M';
COMMIT;
/

UPDATE       a_ack_temp_honor          t
   SET       t.honor_gender_he_she     = 'she is'
   WHERE     t.honor_gender_code       = 'F';
COMMIT;
/

UPDATE       a_ack_temp_honor
   SET       honor_gender_he_she      = 'they are'
   WHERE     total_honored            > 1;
COMMIT;
/

UPDATE       a_ack_temp_honor          t
   SET       t.honor_gender_his_hers   = 'his'
   WHERE     t.honor_gender_code       = 'M';
COMMIT;
/

UPDATE       a_ack_temp_honor          t
   SET       t.honor_gender_his_hers   = 'hers'
   WHERE     t.honor_gender_code       = 'F';
COMMIT;
/

UPDATE       a_ack_temp_honor          t
   SET       t.honor_gender_his_hers   = 'their'
   WHERE     total_honored             > 1;
COMMIT;
/

UPDATE       a_ack_temp_honor
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
/****************************************************************************************************************************************************************************************************************/
/*** Update Payroll Deduction Pledge Flag ***/
/*** Needs to come before the sequences are counted such that payroll payments aren't counted as gifts ***/
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
/*** Update Corporate Flag ***/
UPDATE     a_ack_rcpt
  SET      ack_segment                  = 'Corporate'
  WHERE    person_or_org                ='O'
    AND    ack_segment                  IS NULL;
COMMIT;
/
/******************************************************************/
/******************************************************************/
/*** Create Table to Hold Payroll Deduction Pledge Payment Info ***/
/******************************************************************/
/******************************************************************/
DROP TABLE   a_ack_rcpt_new_pd_sched;
COMMIT;
/

CREATE TABLE   a_ack_rcpt_new_pd_sched       AS
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
UPDATE      a_ack_rcpt_new_pd_sched                   t
   SET      t.payment_number                      =
   (SELECT  COUNT(p.payment_schedule_pledge_nbr)
     FROM   payment_schedule                      p
    WHERE   t.receipt                             = p.payment_schedule_pledge_nbr);
COMMIT;
/

/*** Assume Equal Payment Amounts ***/
UPDATE      a_ack_rcpt_new_pd_sched
   SET      payment_amount             = ROUND(associated_amount_cfy/payment_number,2);
COMMIT;
/

/*** Start Date ***/
UPDATE      a_ack_rcpt_new_pd_sched                              t
   SET      t.start_date                                     =
   (SELECT  DECODE(SUBSTR(MIN(p.payment_schedule_date),5,2), '01','January ',
                                                             '02','February ',
                                                             '03','March ',
                                                             '04','April ',
                                                             '05','May ',
                                                             '06','June ',
                                                             '07','July ',
                                                             '08','August ',
                                                             '09','September ',
                                                             '10','October ',
                                                             '11','November ',
                                                             '12','December ')||SUBSTR(MIN(p.payment_schedule_date),1,4)
     FROM   payment_schedule                                 p
    WHERE   t.receipt                                        = p.payment_schedule_pledge_nbr);
COMMIT;
/

/*** End Date ***/
UPDATE      a_ack_rcpt_new_pd_sched                              t
   SET      t.end_date                                       =
   (SELECT  DECODE(SUBSTR(MAX(p.payment_schedule_date),5,2), '01','January ',
                                                             '02','February ',
                                                             '03','March ',
                                                             '04','April ',
                                                             '05','May ',
                                                             '06','June ',
                                                             '07','July ',
                                                             '08','August ',
                                                             '09','September ',
                                                             '10','October ',
                                                             '11','November ',
                                                             '12','December ')||SUBSTR(MAX(p.payment_schedule_date),1,4)
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
      FROM   a_ack_rcpt_new_pd_sched   t
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
      FROM   a_ack_rcpt_new_pd_sched       t
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
      FROM   a_ack_rcpt_new_pd_sched     t
     WHERE   t.receipt               = a.receipt)
   WHERE     flag_payroll_deduction  = 1;
COMMIT;
/

UPDATE       a_ack_rcpt            
   SET       pd_end           = ' '
WHERE        pd_end           IS NULL;
COMMIT;
/

/*** Update Payment Number ***/
UPDATE      a_ack_rcpt  a
   SET      a.payment_number        =
   (SELECT  t.payment_number
      FROM  a_ack_rcpt_new_pd_sched     t
     WHERE  t.receipt                   = a.receipt)
 WHERE      a.flag_payroll_deduction    = 1;
COMMIT;
/

UPDATE      a_ack_rcpt
   SET      payment_number = 0
 WHERE      payment_number IS NULL;
COMMIT;
/
/*** Update Payment Number Text ***/
UPDATE      a_ack_rcpt  a
   SET      a.payment_number_text        =
   (SELECT  DECODE(t.payment_number,'0','zero','1','one','2','two','3','three','4','four','5','five','6','six','7','seven','8','eight','9','nine',t.payment_number)
      FROM  a_ack_rcpt_new_pd_sched     t
     WHERE  t.receipt                   = a.receipt)
 WHERE      a.flag_payroll_deduction    = 1;
COMMIT;
/

UPDATE      a_ack_rcpt
   SET      payment_number_text = 'zero'
 WHERE      payment_number_text IS NULL;
COMMIT;
/
/****************************/
/****************************/
/*** Get Prospect Manager ***/
/****************************/
/****************************/
UPDATE      a_ack_rcpt                  m
   SET      m.manager_id_number =
            (select a.ass_id_number
               from a_dw_assignment_pm  a
              where a.id_number = m.id_number);
COMMIT;              
/

UPDATE      a_ack_rcpt                 m
   SET      m.manager_pref_name        = 
   (SELECT  'Please route to '||
            MAX(a.ass_pref_mail_name)||
            ' for review.'
      FROM  a_dw_assignment_pm            a
     WHERE  a.id_number                = m.id_number
       AND  m.flag_pc                  = '1');
COMMIT;
/

UPDATE a_ack_rcpt
   SET manager_pref_name      = ' '
 WHERE manager_pref_name      = 'Please route to  for review.';
COMMIT;
/

/***********************************************************/
/***********************************************************/
/*** Set Bequest Expectancy Transaction Type back to BE ***/
/***********************************************************/
/***********************************************************/
UPDATE  a_ack_rcpt              a
   SET  a.transaction_type      = 'BE',
        a.transaction_type_desc = 'Bequest Expectancy',
        a.ack_segment           = 'Bequest Ex'
 WHERE  a.receipt               IN
(SELECT prim_pledge_number  
   FROM primary_pledge
  WHERE prim_pledge_type        = 'BE');
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
/*****************************/
/*****************************/
/*** Update Multi-Year *******/
/*****************************/
/*****************************/
UPDATE          a_ack_rcpt
   SET          flag_multi_year = 1
 WHERE          receipt IN
    (SELECT prim_gift_receipt_number 
       FROM primary_gift
      WHERE prim_gift_pledge_number IN
        (SELECT pledge_number
           FROM pledge_codes));
COMMIT;
/


UPDATE          a_ack_rcpt
   SET          flag_multi_year = 0
 WHERE          flag_multi_year IS NULL;
COMMIT;
/
/********************************************/
/********************************************/
/*** Update Committee Regional Area Field ***/
/********************************************/
/********************************************/

/*** Update Committee Region Field ***/
UPDATE      a_ack_rcpt          a
   SET      a.committee_region  = 
   (SELECT  DECODE(c.committee_code, 'PCVDE', 'Denver',
                                     'PCVH',  'Houston',
                                     'PCVNT', 'North Texas',
                                     'PCVO',  'Oklahoma',
                                     'PCVSC', 'Southern California')
            FROM committee                  c
           WHERE a.id_number                = c.id_number
             AND c.committee_status_code    = 'A'
             AND c.committee_code IN ('PCVDE','PCVH','PCVNT','PCVO','PCVSC'))
     WHERE a.flag_committee IN ('PC','Both');
COMMIT;



/*** Update Region for Nulls ***/
UPDATE      a_ack_rcpt          a
   SET      a.committee_region = ' '
 WHERE      a.committee_region IS NULL;
COMMIT;
/
/****************************************************************************************************************************************************************************************************************/
/**** Create Table to Hold One-Gift People ******/
CREATE TABLE  temp_gift_sequence1
(id_number      varchar2(10),
 date_of_record    varchar2(8));
 commit;
 
 /*** Insert All Gifts into table - One gift is counted as ID_NUMBER + Date_of_record ***/
INSERT INTO temp_gift_sequence1
(SELECT id_number, 
date_of_record
   FROM a_ack_rcpt
WHERE transaction_type IN ('GF','PP')
     AND flag_payroll_deduction = 0
GROUP BY id_number, date_of_record);
COMMIT;

/*** Add Sequence Field to table ***/
ALTER TABLE temp_gift_sequence1
    ADD tt_gift_seq NUMBER;
COMMIT;    

/*** Set Sequence equal to 1 for those with only one gift ***/
UPDATE temp_gift_sequence1  t1
SET t1.tt_gift_seq = 1
WHERE t1.id_number IN
(SELECT t2.id_number 
FROM temp_gift_sequence1 t2
GROUP BY t2.id_number
HAVING count(t2.id_number) = 1);
COMMIT;

/*** Put people with multiple gifts into a separate table ***/
CREATE TABLE temp_gift_sequence2
AS
(SELECT *
FROM temp_gift_sequence1
WHERE id_number IN
(SELECT id_number 
FROM temp_gift_sequence1
GROUP BY id_number
HAVING count(id_number) > 1));
COMMIT;

/*** Remove those with multiple gifts from original table ***/
DELETE FROM temp_gift_sequence1
WHERE id_number IN
    (SELECT id_number from temp_gift_sequence2);
COMMIT;

/*** Initialize The Sequence of Multiple Gifts ***/
UPDATE temp_gift_sequence2
SET tt_gift_seq = 1;
COMMIT;

/*** Update Sequence For Those With 2 Or More Gifts ***/
DECLARE
    CURSOR curs_gift_seq IS
    SELECT id_number, tt_gift_seq 
      FROM temp_gift_sequence2
  ORDER BY id_number, date_of_record, tt_gift_seq

  FOR UPDATE OF tt_gift_seq;

   i                 number := 1;
   v_id_number       temp_gift_sequence2.id_number%type;
   v_tt_gift_seq       temp_gift_sequence2.tt_gift_seq%type;
   v_prev_id_number  temp_gift_sequence2.id_number%type;

   BEGIN

   OPEN curs_gift_seq; 
      LOOP 
        FETCH       curs_gift_seq 
         INTO       v_id_number, v_tt_gift_seq; 
         EXIT WHEN  curs_gift_seq%notfound;
             IF   v_id_number = v_prev_id_number THEN
                  i := i + 1;
         UPDATE   temp_gift_sequence2
            SET   tt_gift_seq = i 
          WHERE   CURRENT OF curs_gift_seq;
           ELSE   v_prev_id_number := v_id_number; i := 1;
         END IF;
       END LOOP;
    CLOSE curs_gift_seq;
END;
/
COMMIT;
/

/*** Combine the first two tables ***/
DROP TABLE temp_gift_sequence3;
COMMIT;

CREATE TABLE temp_gift_sequence3
AS
(SELECT *
FROM temp_gift_sequence1);

INSERT INTO temp_gift_sequence3
(SELECT * 
FROM temp_gift_sequence2);
COMMIT;

DROP TABLE temp_gift_sequence2;
COMMIT;

DROP TABLE temp_gift_sequence1;
commit;

/***** USE TT_GIFT_SEQ HERE TO UPDATE TODAY_XSEQUENCE *************************************************************************************************************************************************/
/*** UPDATE 02/22/2011 - added "WHERE a1.person_or_org = 'P' as id_number 51111 was getting a sub-query error due to a MC and GF on the same receipt ***/
UPDATE a_ack_rcpt     a1
       SET a1.today_xsequence =
            (select dw.daily_gift_seq
               from a_dw_pyramid  dw
            where dw.id_number = a1.id_number
                and dw.date_of_record = a1.date_of_record
                and dw.receipt = a1.receipt)
    WHERE a1.person_or_org = 'P';
commit;



/*** Update Ack Table With Gift Sequence ***/
UPDATE a_ack_rcpt       a1
       SET a1.ack_gift_sequence =
            (SELECT t1.tt_gift_seq
                FROM temp_gift_sequence3   t1
             WHERE t1.id_number = a1.id_number
                   AND t1.date_of_record = a1.date_of_record)
    WHERE a1.transaction_type IN ('PP','GF')
         AND flag_payroll_deduction = 0;
    
 UPDATE a_ack_rcpt
      SET ack_gift_sequence = 0
  WHERE ack_gift_sequence IS NULL;
  COMMIT;
/****************************************************************************************************************************************************************************************************************/
/**** Create Table to Hold Payroll-Payment People ******/
CREATE TABLE temp_payroll_pmt_sequence1
(id_number      varchar2(10),
 date_of_record    varchar2(8));
 commit;
 
 /*** Insert All -Payments into table - One Payroll Payment is counted as ID_NUMBER + Date_of_record with a payroll deduction flag ***/
INSERT INTO temp_payroll_pmt_sequence1
(SELECT id_number, 
date_of_record
   FROM a_ack_rcpt
WHERE transaction_type IN ('GF','PP')
     AND flag_payroll_deduction <> 0
GROUP BY id_number, date_of_record);
COMMIT;

/*** Add Sequence Field to table ***/
ALTER TABLE temp_payroll_pmt_sequence1
    ADD tt_payroll_pmt_seq NUMBER;
COMMIT;    

/*** Set Sequence equal to 1 for those with only one Payroll Payment ***/
UPDATE temp_payroll_pmt_sequence1  t1
SET t1.tt_payroll_pmt_seq = 1
WHERE t1.id_number IN
(SELECT t2.id_number 
FROM temp_payroll_pmt_sequence1 t2
GROUP BY t2.id_number
HAVING count(t2.id_number) = 1);
COMMIT;

/*** Put people with multiple Payroll Payments into a separate table ***/
CREATE TABLE temp_payroll_pmt_sequence2
AS
(SELECT *
FROM temp_payroll_pmt_sequence1
WHERE id_number IN
(SELECT id_number 
FROM temp_payroll_pmt_sequence1
GROUP BY id_number
HAVING count(id_number) > 1));
COMMIT;

/*** Remove those with multiple Payroll Payments from original table ***/
DELETE FROM temp_payroll_pmt_sequence1
WHERE id_number IN
    (SELECT id_number from temp_payroll_pmt_sequence2);
COMMIT;

/*** Initialize The Sequence of Multiple Payroll Payments ***/
UPDATE temp_payroll_pmt_sequence2
SET tt_payroll_pmt_seq = 1;
COMMIT;

/*** Update Sequence For Those With 2 Or More Payroll Payments ***/
DECLARE
    CURSOR curs_payroll_pmt_seq IS
    SELECT id_number, tt_payroll_pmt_seq 
      FROM temp_payroll_pmt_sequence2
  ORDER BY id_number, date_of_record, tt_payroll_pmt_seq

  FOR UPDATE OF tt_payroll_pmt_seq;

   i                 number := 1;
   v_id_number       temp_payroll_pmt_sequence2.id_number%type;
   v_tt_payroll_pmt_seq       temp_payroll_pmt_sequence2.tt_payroll_pmt_seq%type;
   v_prev_id_number  temp_payroll_pmt_sequence2.id_number%type;

   BEGIN

   OPEN curs_payroll_pmt_seq; 
      LOOP 
        FETCH       curs_payroll_pmt_seq 
         INTO       v_id_number, v_tt_payroll_pmt_seq; 
         EXIT WHEN  curs_payroll_pmt_seq%notfound;
             IF   v_id_number = v_prev_id_number THEN
                  i := i + 1;
         UPDATE   temp_payroll_pmt_sequence2
            SET   tt_payroll_pmt_seq = i 
          WHERE   CURRENT OF curs_payroll_pmt_seq;
           ELSE   v_prev_id_number := v_id_number; i := 1;
         END IF;
       END LOOP;
    CLOSE curs_payroll_pmt_seq;
END;
/
COMMIT;
/

/*** Combine the first two tables ***/
DROP TABLE temp_payroll_pmt_sequence3;
COMMIT;

CREATE TABLE temp_payroll_pmt_sequence3
AS
(SELECT *
FROM temp_payroll_pmt_sequence1);

INSERT INTO temp_payroll_pmt_sequence3
(SELECT * 
FROM temp_payroll_pmt_sequence2);
COMMIT;

DROP TABLE temp_payroll_pmt_sequence2;
COMMIT;

DROP TABLE temp_payroll_pmt_sequence1;
commit;

/*** Update Ack Table With Payroll Payment Sequence ***/
UPDATE a_ack_rcpt       a1
       SET a1.ack_payroll_pmt_seq =
            (SELECT t1.tt_payroll_pmt_seq
                FROM temp_payroll_pmt_sequence3   t1
             WHERE t1.id_number = a1.id_number
                   AND t1.date_of_record = a1.date_of_record)
    WHERE a1.transaction_type IN ('PP','GF')
        AND flag_payroll_deduction <> 0;
    
 UPDATE a_ack_rcpt
      SET ack_payroll_pmt_seq = 0
  WHERE ack_payroll_pmt_seq IS NULL;
  COMMIT;
/****************************************************************************************************************************************************************************************************************/
/*** Create Table to Hold One-pledge People ***/
CREATE TABLE temp_pledge_sequence1
(id_number      varchar2(10),
 date_of_record    varchar2(8),
 alloc              varchar2(7));
 commit;
 
 /*** Insert All pledges into table - One pledge is counted as ID_NUMBER + Date_of_record + Alloc ***/
INSERT INTO temp_pledge_sequence1
(SELECT id_number, 
date_of_record,
alloc
   FROM a_ack_rcpt
WHERE transaction_type IN ('P')
GROUP BY id_number, date_of_record, alloc);
COMMIT;

/*** Add Sequence Field to table ***/
ALTER TABLE temp_pledge_sequence1
    ADD tt_pledge_seq NUMBER;
COMMIT;

/*** Set Sequence equal to 1 for those with only one pledge ***/
UPDATE temp_pledge_sequence1  t1
SET t1.tt_pledge_seq = 1
WHERE t1.id_number IN
(SELECT t2.id_number 
FROM temp_pledge_sequence1 t2
GROUP BY t2.id_number
HAVING count(t2.id_number) = 1);
COMMIT;

/*** Put people with multiple pledges into a separate table ***/
CREATE TABLE temp_pledge_sequence2
AS
(SELECT *
FROM temp_pledge_sequence1
WHERE id_number IN
(SELECT id_number 
FROM temp_pledge_sequence1
GROUP BY id_number
HAVING count(id_number) > 1));
COMMIT;

/*** Remove those with multiple pledges from original table ***/
DELETE FROM temp_pledge_sequence1
WHERE id_number IN
    (SELECT id_number from temp_pledge_sequence2);
COMMIT;

/*** Initialize The Sequence of Multiple pledges ***/
UPDATE temp_pledge_sequence2
SET tt_pledge_seq = 1;
COMMIT;

/*** Update Sequence For Those With 2 Or More pledges ***/
DECLARE
    CURSOR curs_pledge_seq IS
    SELECT id_number, tt_pledge_seq 
      FROM temp_pledge_sequence2
  ORDER BY id_number, date_of_record, alloc, tt_pledge_seq

  FOR UPDATE OF tt_pledge_seq;

   i                 number := 1;
   v_id_number       temp_pledge_sequence2.id_number%type;
   v_tt_pledge_seq       temp_pledge_sequence2.tt_pledge_seq%type;
   v_prev_id_number  temp_pledge_sequence2.id_number%type;

   BEGIN

   OPEN curs_pledge_seq; 
      LOOP 
        FETCH       curs_pledge_seq 
         INTO       v_id_number, v_tt_pledge_seq; 
         EXIT WHEN  curs_pledge_seq%notfound;
             IF   v_id_number = v_prev_id_number THEN
                  i := i + 1;
         UPDATE   temp_pledge_sequence2
            SET   tt_pledge_seq = i 
          WHERE   CURRENT OF curs_pledge_seq;
           ELSE   v_prev_id_number := v_id_number; i := 1;
         END IF;
       END LOOP;
    CLOSE curs_pledge_seq;
END;
/
COMMIT;
/
/*** Combine the first two tables ***/
DROP TABLE temp_pledge_sequence3;
COMMIT;

CREATE TABLE temp_pledge_sequence3
AS
(SELECT *
FROM temp_pledge_sequence1);

INSERT INTO temp_pledge_sequence3
(SELECT * 
FROM temp_pledge_sequence2);
COMMIT;

DROP TABLE temp_pledge_sequence2;
COMMIT;

DROP TABLE temp_pledge_sequence1;
commit;

/*** Update Ack Table With pledge Sequence ***/
UPDATE a_ack_rcpt       a1
       SET a1.ack_pledge_sequence =
            (SELECT t1.tt_pledge_seq
                FROM temp_pledge_sequence3   t1
             WHERE t1.id_number = a1.id_number
                   AND t1.date_of_record = a1.date_of_record
                   AND t1.alloc                 = a1.alloc)
    WHERE a1.transaction_type IN ('P');
    
 UPDATE a_ack_rcpt
      SET ack_pledge_sequence = 0
  WHERE ack_pledge_sequence IS NULL;
  COMMIT;
/****************************************************************************************************************************************************************************************************************/
/*** Need cfy_giving_ytd field populated after sequences are written -- This field will count how much cash has been given so far up to the point of that gift's date, nothing after ********/
/*** Note:  This will not count anything which doesn't have a gift sequence -- so only gifts, and no gifts which are payroll pledge deductions ***/
/*** This field is ONLY USED FOR THE PC COUNT!!! Nothing else! ****/
UPDATE a_ack_rcpt   a1
      SET a1.cfy_giving_ytd =
        (SELECT sum(a2.associated_amount_cfy + a2.associated_amount_cfy_match + a2.associated_amount_cfy_claim)
           FROM a_ack_rcpt  a2
        WHERE a2.id_number = a1.id_number
             AND a2.ack_gift_sequence <= a1.ack_gift_sequence
             AND a2.ack_gift_sequence <> 0);
COMMIT;       

/*** PC Cash Flag ***/
/*** Updated 10/27/2010 ... added cnt_undergrad >= 1 to young pc as those with ONLY a grad degree at Mines cannot be Young PC per John/Rosie ***/
UPDATE a_ack_rcpt
      SET flag_pc_cash = '1'
 WHERE cfy_giving_ytd >= 1000
       OR id_number IN
            (SELECT id_number
                FROM a_ack_rcpt     a,
                           a_dw_young_alum   y
            WHERE a.record_type_code = 'AL'
                 AND a.cfy_giving_ytd BETWEEN y.pc_gift_level AND y.pc_gift_level_top
                 AND a.pref_class_year = y.year
                 AND a.cnt_undergrad >= 1);
COMMIT;
/                 

UPDATE a_ack_rcpt
      SET flag_pc_cash = 0
WHERE flag_pc_cash IS NULL;
COMMIT;      
/ 
                
/*** Flag First PC Gift This Year ***/
update a_ack_rcpt
set flag_first_pc_tfy = 1
where receipt IN
(select min(receipt)
from a_ack_rcpt
where flag_pc_cash = 1
group by id_number);

/*** PC This Gift Flag - Cash or Payroll Pledges Only ***/
UPDATE  a_ack_rcpt   a
        SET a.flag_pc_this_gift = 1
 WHERE (a.gift_amount_today >= 1000
                or (a.gift_amount_today >=
                    (SELECT ya.pc_gift_level
                         FROM a_dw_young_alum  ya
                      WHERE a.pref_class_year = ya.year)
                     AND a.cnt_undergrad >= 1)
)
          OR flag_first_pc_tfy = 1
          OR (flag_payroll_deduction = 1 and flag_pc = 1);
COMMIT;

/*** Flag for payment with pledge on the payment = 1***/
/*** This means we got ~some~ payment ***/
UPDATE a_ack_rcpt   a3
      SET a3.flag_pmt_w_pledge = 1
WHERE a3.receipt IN      
    (select a1.receipt 
        from a_ack_rcpt        a1,
                a_ack_rcpt  a2
        where a1.id_number = a2.id_number
        and a1.transaction_type = 'PP'
        and a2.transaction_type = 'P'
        and (a1.date_of_record-1 = a2.date_of_record
                or a1.date_of_record-2 = a2.date_of_record
                or a1.date_of_record-3 = a2.date_of_record));
COMMIT;  
      
/*** Flag for payment with pledge on the pledge = 2***/
/*** This means we got PC Payment ***/
UPDATE a_ack_rcpt   a3
      SET a3.flag_pmt_w_pledge = 2
WHERE a3.flag_pmt_w_pledge = 1
  AND a3.flag_pc_this_gift = 1;
COMMIT;  
       
/*** Flag for payment with pledge on the pledge = 3 ***/
/*** This means the pledge has been fulfilled ***/
UPDATE a_ack_rcpt   a3
      SET a3.flag_pmt_w_pledge = 3
WHERE a3.flag_pmt_w_pledge IN (1,2)
  AND a3.prim_pledge_amount_os = 0;
COMMIT;  

UPDATE a_ack_rcpt
      SET flag_pmt_w_pledge = 0
WHERE flag_pmt_w_pledge IS NULL;
COMMIT;


/****************************************************************************************************************************************************************************************************************/
/*** Need cfy_commitment_ytd field populated after sequences are written -- This field will count how much has been pledged so far up to the point of that pledge's date, nothing after ********/
/*** Note:  This will not count anything which doesn't have a pledge sequence -- so only pledges, and no pledges which are payroll pledge deductions ***/
/*** This field is ONLY USED FOR THE PC COUNT!!! Nothing else! ****/
UPDATE a_ack_rcpt   a1
      SET a1.cfy_commitment_ytd =
        (SELECT sum(a2.prim_pledge_original_amount)
           FROM a_ack_rcpt  a2
        WHERE a2.id_number = a1.id_number
             AND a2.ack_pledge_sequence <= a1.ack_pledge_sequence
             AND a2.ack_pledge_sequence <> 0);
COMMIT;     
/****************************************************************************************************************************************************************************************************************/
/*** Count the PC Gift count for a PC2 letter.  No honor letters or payroll deduction will get this letter ********/
/*** Drop Temp Table to be created in next step ***/
DROP TABLE a_temp_second_pc;
COMMIT;

/*** Create Temp Table For 2nd PC Gift Info ***/
/*** Note: Per Rosie 02-02-2009 all Memorial Securities Gifts need a Securities and Memorial letter, this will generate both ***/
CREATE TABLE a_temp_second_pc
AS
  SELECT p.id_number,
         p.record_type_code,
         p.date_of_record,
         p.pref_class_year,
         0 AS pc_gift,
         1 AS xsequence,
         p.cfy_giving_ytd,
         p.flag_young_alum,
         sum(p.associated_amount_cfy + p.associated_amount_cfy_match + p.associated_amount_cfy_claim) this_gift
    FROM a_ack_rcpt     p,
         a_dw_fiscal_dates  f
   WHERE p.date_of_record BETWEEN f.cfy_beg AND f.cfy_end
     AND p.transaction_type IN ('GF','PP')
     AND p.flag_pc_this_gift = 1
     AND p.flag_payroll_deduction = 0
     AND p.person_or_org    = 'P'
     AND (p.flag_honor = 0
             OR p.flag_honor = 1 and p.flag_securities = 1)
GROUP BY p.id_number,
         p.record_type_code,
         p.date_of_record,
         p.pref_class_year, 
         0, 
         1,
         p.cfy_giving_ytd,
         p.flag_young_alum;
COMMIT;
/

/*** Delete Those Who Aren't PC At All ***/
DELETE FROM a_temp_second_pc
WHERE id_number NOT IN
    (SELECT id_number
         FROM a_ack_rcpt
     WHERE flag_pc = '1');
COMMIT;

/*** Delete those flagged as PC who haven't yet donated at PC level ***/
DELETE FROM a_temp_second_pc    tp
WHERE tp.id_number IN
    (SELECT a.id_number
         FROM a_ack_rcpt a   
      WHERE a.flag_young_alum <> '1'
            AND a.cfy_giving_ytd < 1000)
     AND tp.cfy_giving_ytd < 1000;
COMMIT;

DELETE FROM a_temp_second_pc        tpc
WHERE tpc.id_number IN
    (SELECT a1.id_number
         FROM a_ack_rcpt            a1,
                   a_dw_young_alum      ya1
      WHERE a1.flag_young_alum = '1'
            AND a1.pref_class_year    = ya1.year
            AND a1.record_type_code = 'AL'
            AND a1.cfy_giving_ytd < ya1.pc_gift_level)
     AND tpc.cfy_giving_ytd <
        (SELECT ya2.pc_gift_level
              FROM a_dw_young_alum      ya2
          WHERE tpc.pref_class_year = ya2.year);
COMMIT;

/*** Set XSequence for Second PC Gift detection ***/
DECLARE
    CURSOR curs_get_sequence IS
    SELECT id_number, xsequence 
      FROM a_temp_second_pc
  ORDER BY id_number, date_of_record, xsequence

  FOR UPDATE OF xsequence;

   i                 number := 1;
   v_id_number       a_temp_second_pc.id_number%type;
   v_xsequence       a_temp_second_pc.xsequence%type;
   v_prev_id_number  a_temp_second_pc.id_number%type;

   BEGIN

   OPEN curs_get_sequence; 
      LOOP 
        FETCH       curs_get_sequence 
         INTO       v_id_number, v_xsequence; 
         EXIT WHEN  curs_get_sequence%notfound;
             IF   v_id_number = v_prev_id_number THEN
                  i := i + 1;
         UPDATE   a_temp_second_pc
            SET   xsequence = i 
          WHERE   CURRENT OF curs_get_sequence;
           ELSE   v_prev_id_number := v_id_number; i := 1;
         END IF;
       END LOOP;
    CLOSE curs_get_sequence;
END;
/
COMMIT;
/

/*** Update xsequence in the ack table ***/
UPDATE  a_ack_rcpt              a
   SET  a.pc_gift_xsequence     =
        (SELECT b.xsequence
           FROM a_temp_second_pc     b
          WHERE a.id_number      = b.id_number
            AND a.date_of_record = b.date_of_record
            AND a.cfy_giving_ytd = b.cfy_giving_ytd
            AND a.flag_pc       = 1);
COMMIT;
/

/*** Update Nulls ***/
UPDATE  a_ack_rcpt
   SET  pc_gift_xsequence = 0
 WHERE  pc_gift_xsequence IS NULL;
COMMIT;
/
/****************************************************************************************************************************************************************************************************************/
/*** Update matched gift info ************/
UPDATE  a_ack_rcpt      a
        SET a.mg_donor_matched_id =
        (SELECT mgt.match_gift_matched_donor_id
            FROM matching_gift   mgt
         WHERE mgt.match_gift_company_id = a.id_number
              AND mgt.match_gift_receipt_number = a.receipt)
 WHERE a.transaction_type = 'MG';
COMMIT;

UPDATE a_ack_rcpt      a
        SET a.mg_donor_matched_name =
        (SELECT e.pref_mail_name
            FROM entity  e
        WHERE e.id_number = a.mg_donor_matched_id)
WHERE a.transaction_type = 'MG';
COMMIT;

UPDATE a_ack_rcpt       a
        SET a.mg_receipt_matched =
        (SELECT mgt.match_gift_matched_receipt
             FROM matching_gift     mgt
          WHERE a.receipt = mgt.match_gift_receipt_number
               AND a.mg_donor_matched_id = mgt.match_gift_matched_donor_id)
WHERE a.transaction_type = 'MG';
COMMIT;

/****************************************************************************************************************************************************************************************************************/
/*** Update committed-to societies ********/
/*** Updated 10/12/2010 - changing name from "George M. Randall" to "member" ***/
UPDATE      a_ack_rcpt
   SET      society                      = 'member'
   WHERE    flag_pc                      = 1
     AND    cfy_commitment               < 2500;
COMMIT;
/

/*** Updated 10/12/2010 - changing name from "George M. Randall" to "member" ***/
UPDATE      a_ack_rcpt
   SET      society                      = 'member'
   WHERE    flag_pc                      = 1
     AND    cfy_commitment               BETWEEN 1000 AND 2499.99;
COMMIT;
/
   
UPDATE      a_ack_rcpt
/*** Updated 10/12/2010 - changing name from "Francis M. Van Tuyl" to "Supporting Member" ***/
   SET      society                      = 'Supporting Member'
   WHERE    flag_pc                      = 1
     AND    cfy_commitment               BETWEEN 2500 AND 4999.99
     AND    society                      IS NULL;
COMMIT;
/

/*** Updated 10/12/2010 - changing name from "Nathaniel P. Hill" to "Sustaining Member" ***/
UPDATE      a_ack_rcpt
   SET      society                     = 'Sustaining Member'
 WHERE      flag_pc                     = 1
   AND      cfy_commitment              BETWEEN 5000 AND 9999.99
   AND      society                     IS NULL;

/*** Updated 10/12/2010 - changing name from "Winfield S. Stratton" to "Investing Member" ***/
UPDATE      a_ack_rcpt
   SET      society                      = 'Investing Member'
   WHERE    flag_pc                      = 1
     AND    cfy_commitment               BETWEEN 10000 AND 24999.99
     AND    society                      IS NULL;
COMMIT;
/

/*** Updated 10/12/2010 - changing name from "Simon Guggenheim" to "Guggenheim Member" ***/
UPDATE      a_ack_rcpt
   SET      society                      = 'Guggenheim Member'
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

/*** Set Society For Gift Up To This Point ***/
UPDATE      a_ack_rcpt
   SET      society_now                      = 'member'
   WHERE    flag_pc                      = 1
     AND    cfy_giving_ytd               < 2500;
COMMIT;
/

UPDATE      a_ack_rcpt
   SET      society_now                      = 'member'
   WHERE    flag_pc                      = 1
     AND    cfy_giving_ytd               BETWEEN 1000 AND 2499.99;
COMMIT;
/
   
UPDATE      a_ack_rcpt
   SET      society_now                      = 'Supporting Member'
   WHERE    flag_pc                      = 1
     AND    cfy_giving_ytd               BETWEEN 2500 AND 4999.99
     AND    society_now                      IS NULL;
COMMIT;
/

UPDATE      a_ack_rcpt
   SET      society_now                     = 'Sustaining Member'
 WHERE      flag_pc                     = 1
   AND      cfy_giving_ytd              BETWEEN 5000 AND 9999.99
   AND      society_now                     IS NULL;

UPDATE      a_ack_rcpt
   SET      society_now                      = 'Investing Member'
   WHERE    flag_pc                      = 1
     AND    cfy_giving_ytd               BETWEEN 10000 AND 24999.99
     AND    society_now                      IS NULL;
COMMIT;
/

UPDATE      a_ack_rcpt
   SET      society_now                      = 'Guggenheim Member'
   WHERE     flag_pc                    =  1
     AND   cfy_giving_ytd               >= 25000
     AND    society_now                     IS NULL;
COMMIT;
/
UPDATE a_ack_rcpt
     SET society_now = ' '
WHERE society_now IS NULL;
COMMIT;
/

/***Put in PC level in PC Pledge receipt***/
UPDATE a_ack_rcpt                       a
   SET a.rcpt_pc_pledge                 ='If payments are completed by June 30th, '||(select cfy_year from a_dw_fiscal_dates)||', you will be recognized at the '||
   (a.society)||
   ' level of the President'||
   CHR(39)||
    's Council.  '
 WHERE       a.transaction_type           IN  ('P','PP')
   AND       a.flag_pc = '1'
   AND       a.prim_pledge_amount_os      <> 0;
COMMIT;
/

UPDATE     a_ack_rcpt
   SET     rcpt_pc_pledge   = ' '
   WHERE   rcpt_pc_pledge   IS NULL;
COMMIT;
/

/*** Update Society Change For Second PC Letter ***/
UPDATE a_ack_rcpt       a1
      SET a1.flag_society_change = 1
WHERE a1.pc_gift_xsequence > 1
    AND a1.society <> a1.society_now;
COMMIT;

UPDATE a_ack_rcpt       a1
      SET a1.flag_society_change = 1
 WHERE a1.pc_gift_xsequence > 1
      and a1.pc_gift_xsequence =
            (SELECT max(a3.pc_gift_xsequence)
                FROM a_ack_rcpt     a3
             WHERE a1.id_number = a3.id_number)
      AND a1.society_now <>
            (SELECT a2.society_now
                FROM a_ack_rcpt     a2
             WHERE a1.id_number = a2.id_number
                  AND a2.pc_gift_xsequence = a1.pc_gift_xsequence - 1
                  AND a2.receipt =
                        (SELECT max(a4.receipt)
                             FROM a_ack_rcpt    a4
                          WHERE a1.id_number = a4.id_number
                              AND a4.pc_gift_xsequence = a1.pc_gift_xsequence - 1));
COMMIT;

/*** New 01/27/10 ... this'll probably break the program, take it out if it's wrong ***/
/*** Take out this part if they decide we don't want letters for non-pc gift society change people ***/
UPDATE a_ack_rcpt       a1
      SET a1.flag_society_change = 1
 WHERE a1.ack_gift_sequence > 1
      and a1.ack_gift_sequence =
            (SELECT max(a3.ack_gift_sequence)
                FROM a_ack_rcpt     a3
             WHERE a1.id_number = a3.id_number)
  AND a1.society_now <>
                (SELECT a2.society_now
                FROM a_ack_rcpt     a2
             WHERE a1.id_number = a2.id_number
                  AND a2.ack_gift_sequence = a1.ack_gift_sequence - 1
                  AND (a2.society_now = 'member' AND a2.flag_pc_this_gift <> '1')
/*** NOTE:  5-12-10 ... the one line directly above this should be removed if problems occur, trying to fix so 2nd pc gifts are not made "2nd" gift if the first gift was not really PC ***/
                  AND a2.receipt =
                        (SELECT max(a4.receipt)
                             FROM a_ack_rcpt    a4
                          WHERE a1.id_number = a4.id_number
                              AND a4.ack_gift_sequence = a1.ack_gift_sequence - 1));
COMMIT;
/*** End of new 1/27/10 stuff ***/

UPDATE a_ack_rcpt
      SET flag_society_change = 0
WHERE flag_society_change IS NULL;
COMMIT;

/*** UPDATE 08-31-2010 ***/
/*** Per Rosie, Remove Society-Change Letter, so I will simply set everyone's flag back to 0 ***/
/*** NOTE:  If they decide they want the society change letter back, remove this next part and then edit the second_pc letter using a DECODE(flag_society_change,1,etc.) script ***/
UPDATE a_ack_rcpt
        SET flag_society_change = 0;
COMMIT;

/******************************************************/
/*********** Add info for Securities Receipts *********/
/***** Whole Section added 1-10-06 by Bryan Mack ******/
/*** Valuation Date - Different from Date of Record ***/
/******************************************************/
UPDATE a_ack_rcpt           a
   SET a.valuation_date     = 
    (select to_char(g.valuation_date,'YYYYMMDD')
       from gift_tender_type    g
      WHERE a.receipt           = g.receipt_number);

UPDATE a_ack_rcpt           a
   SET a.valuation_date     = '?   ? ?'
 WHERE a.valuation_date     IS NULL;
COMMIT;
/


/*** Securities Description ***/
UPDATE a_ack_rcpt           a
   SET a.securities_desc    = 
    (SELECT g.securities_desc
       FROM gift_tender_type    g
      WHERE a.receipt           = g.receipt_number);

UPDATE a_ack_rcpt
   SET securities_desc = ' '
 WHERE securities_desc IS NULL;

/*** Number of Shares ***/ 
UPDATE a_ack_rcpt             a
   SET a.number_of_shares     =
    (SELECT g.number_of_shares
       FROM gift_tender_type    g
      WHERE a.receipt           = g.receipt_number);
      
UPDATE a_ack_rcpt
   SET number_of_shares       = 0
 WHERE number_of_shares       IS NULL;
 
/*** Donor Value Amount ***/
UPDATE a_ack_rcpt             a
   SET a.valuation_amt      =
    (SELECT g.valuation_amt
       FROM gift_tender_type    g
      WHERE a.receipt           = g.receipt_number);

UPDATE a_ack_rcpt
   SET valuation_amt         = 0
 WHERE valuation_amt         IS NULL;
 
/*** Value Per Share ***/
UPDATE a_ack_rcpt           a
   SET a.value_per_share    =
    (SELECT g.value_per_share
       FROM gift_tender_type    g
      WHERE a.receipt           = g.receipt_number);
      
UPDATE a_ack_rcpt
   SET value_per_share      = 0
 WHERE value_per_share      IS NULL;
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
/*** Parents Fund Alloc *****/
/****************************/
/****************************/
UPDATE      a_ack_rcpt
   SET      alloc_desc = 'The Parents Fund'
 WHERE      alloc = '3795'
   AND      record_type_code IN ('PA','PX');
COMMIT;

/*****************************/
/*****************************/
/**** Senior Class Gifts *****/
/*****************************/
/*****************************/
UPDATE  a_ack_rcpt
   SET  alloc_desc       = 'Senior Class of 2012 Gift'||CHR(13)||alloc_desc
 WHERE  appeal_code      = 'SCG12';
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
   SET      flag_received_letter    = 'Canadian Memorial Gift'
 WHERE      p_country_code          = 'CD'
   AND      flag_honor              = 1;

UPDATE      a_ack_rcpt
   SET      flag_received_letter    = ' '
   WHERE    flag_received_letter    IS NULL;
COMMIT;
/
/*******************/
/*******************/
/*** Populate PS ***/
/*******************/
/*****************
 /*** Remove Per Heidi on 10-29-08, just put a blank space in there 
  
UPDATE   a_ack_rcpt
   SET   ack_ps      = 'You can now make your gift online at https://www.oia.mines.edu/give'
   WHERE signer      = 'VP'
     AND ack_segment = 'Receipt';
COMMIT;
/
***/

UPDATE a_ack_rcpt
   SET ack_ps      = ' '
 WHERE ack_ps      IS NULL;
COMMIT;
/
/*********************************************************************************/
/*** Memorial --
    * Non PC - 
        *  VP Standard Letter w/ Stamp if $100 or less OR
        *  VP TMF Letter w/ stamp if $100 or less  OR
        *  VP Standard Letter w/ Signature if over $100 OR
        *  VP TMF Letter w/ Signature if over $100
    * PC (in addition to VP)
        *  Prez Standard letter OR
        *  Prez TMF Letter 
***/         
UPDATE a_ack_rcpt
      SET ack_segment = 
      (CASE WHEN gift_amount_today < 101 AND alloc <> '3795' THEN 'Honor Stamp'
            WHEN gift_amount_today >= 101 AND alloc <> '3795' THEN 'Honor Sign'
            WHEN gift_amount_today < 101 AND alloc = '3795' THEN 'Honor TMF Stamp'
            WHEN gift_amount_today >= 101 AND alloc = '3795' THEN 'Honor TMF Sign'
            END),
             signer = 'VP'
   WHERE flag_honor = '1'
        AND ack_segment IS NULL;
COMMIT;
 
 
DROP TABLE temp_letter2;
COMMIT;

CREATE TABLE temp_letter2
AS
(SELECT *
    FROM a_ack_rcpt     a2
 WHERE substr(ack_segment,1,5) = 'Honor'
       AND ((associated_amount_cfy + associated_amount_cfy_match + associated_amount_cfy_claim >= 1000)
                OR (flag_pc = '1' AND flag_young_alum = '1')
                 OR (flag_pc_this_gift = '1' AND flag_first_pc_tfy IS NOT NULL)));
--NOTE: that last line above for the first_flag_pc_tfy is not null is because the only reason i think i need that line is the weird joint/behalf gift the bro/sis gifts the Arkins give
COMMIT;      

DROP TABLE temp_letter3;
COMMIT;

CREATE TABLE temp_letter3
AS
(SELECT *
     FROM a_ack_rcpt    a2
 WHERE a2.ack_segment = 'Honor'
       AND a2.flag_securities = '1');
COMMIT;

DROP TABLE temp_letter4;
COMMIT;

CREATE TABLE temp_letter4
AS
(SELECT *
     FROM a_ack_rcpt   a2
  WHERE a2.ack_segment = 'Honor'
       AND a2.flag_campus = 1
       AND a2.flag_pc <> 1
       AND a2.flag_payroll_deduction <> 1);
COMMIT;

DROP TABLE temp_letter5;
COMMIT;

CREATE TABLE temp_letter5
AS
(SELECT *
     FROM a_ack_rcpt   a2
  WHERE a2.ack_segment = 'Honor'
       AND a2.flag_campus = 1
       AND a2.flag_pc = 1
       AND a2.flag_payroll_deduction <> 1);
COMMIT;

UPDATE temp_letter2
      SET ack_segment =
        (CASE 
            WHEN alloc = '3795' THEN 'Memorial PC TMF'
            WHEN alloc <> '3795' THEN 'Memorial PC'
         END),
             signer = 'Pres';
COMMIT;

UPDATE temp_letter3
      SET ack_segment = 'Securities',
             signer = 'VP';
COMMIT;             

UPDATE temp_letter4
        SET ack_segment = 'Campus Standard',
               signer = 'Pres';
COMMIT;

UPDATE temp_letter5
        SET ack_segment = 'Campus PC',
               signer = 'Pres';
COMMIT;

INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter2);
COMMIT;

INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter3);
COMMIT;

INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter4);
COMMIT;

INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter5);
COMMIT;
/****************************************************************************************************************************************************************************************************************/
/**** Securities -- Special Receipt & Stock Letter ****/
/*** Securities PC gift gets PC letter as well as VP letter ***/
/*** Note: Both receipt and letter are in one row.  One works in ack_letter1 and one in ack_letter3 based on the_ack segment ***/
UPDATE a_ack_rcpt
     SET ack_segment = 
     (CASE
      WHEN alloc = '3795' THEN 'Securities TMF'
      WHEN alloc <> '3795' THEN 'Securities'
      END),
             signer = 'VP'
  WHERE flag_securities = '1'
       AND ack_segment IS NULL;
  COMMIT;
  
DROP TABLE temp_letter2;
COMMIT;

CREATE TABLE temp_letter2
AS
(SELECT *
FROM a_ack_rcpt
WHERE ack_segment IN ('Securities','Securities TMF')
     AND flag_pc_this_gift <> 0);
COMMIT;

UPDATE temp_letter2
       SET signer = 'Pres',
           ack_segment = 
           (CASE
            WHEN alloc = '3795' THEN 'PC TMF'
            WHEN alloc <> '3795' THEN 'PC'
            END);
COMMIT;

INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter2);
COMMIT;           
/****************************************************************************************************************************************************************************************************************/
/*** Bequests FY12 -- no more automated letters for BQ or PC BQ - this will be addressed by simply removing the letters from the batch.  Emails will be generated way below ***/
UPDATE a_ack_rcpt
      SET ack_segment = 'Bequest', 
             signer = 'VP'
WHERE transaction_type = 'BQ'
     AND ack_segment IS NULL;
COMMIT;     

/**************************************************************************************************/
/****************************** CAMPUS GIFTS ******************************************************/
/*** Straight Up Campus PC Gifts get President Letter and Receipt, Non-PC Campus Gifts get different President Letter and Receipt ***/
/*** NOTE:  06-29-10 -- new process, Pres letter for everything with an additional VP letter for payroll deduction
/*** NOTE:  07-10-10 -- remove pres letter from payroll deduction.  Maybe we can change our minds about this a few more times so I can spend 100% of my time on this stupid thing
/*** NOTE:  9-22-10 Per Rosie, the above line no longer holds true for Campus PC Gifts.  Campus PC Gifts now get a receipt, Prez letter, and VP letter.
/*** NOTE:  8-17-11 Per new process, revert to what we did before.  Imagine that.  PC Campus gifts get Prez letter and Receipt, NO vp letter
/*** Payroll Deduction Pledges get no receipt, but get either Campus PC or Campus standard letter from president AS WELL AS a VP letter stating payment plan ***/
UPDATE a_ack_rcpt
      SET ack_segment = 'Campus PC',
             signer            = 'Pres'
WHERE flag_campus  = '1'
      AND (flag_pc_cash          = '1' OR flag_pc_this_gift = '1')
      AND flag_securities <> '1'
      AND transaction_type IN ('PP','GF','P')
      AND (ack_gift_sequence = 1 OR ack_pledge_sequence > 0)
      AND ack_segment IS NULL;
COMMIT;      
/

UPDATE a_ack_rcpt
      SET ack_segment = 'Campus Standard',
             signer            = 'Pres'
WHERE flag_campus  = '1'
      AND flag_pc_cash          <> '1'
      AND flag_securities <> '1'
      AND flag_payroll_deduction <> 1
      AND transaction_type IN ('PP','GF','P')
      AND (ack_gift_sequence = 1 OR ack_pledge_sequence > 0)
      AND ack_segment IS NULL;
COMMIT;      
/

/*** No receipt for payroll pledge so set this here and only carry it over to table for a new letter if it is also PC ***/
UPDATE a_ack_rcpt
      SET ack_segment = 'Payroll Pledge',
             signer            = 'VP'
WHERE flag_campus  = '1'
      AND (flag_pc_this_gift <> '1' OR flag_pc_this_gift IS NULL)
      AND flag_securities <> '1'
      AND flag_payroll_deduction = '1'
      AND (ack_gift_sequence = '1' OR ack_pledge_sequence > '0')
      AND ack_segment IS NULL;
COMMIT;      
/

DROP TABLE temp_letter2;
COMMIT;

CREATE TABLE temp_letter2
AS
(SELECT *
    FROM a_ack_rcpt     a2
 WHERE ack_segment like 'Campus%');
COMMIT;      

UPDATE temp_letter2
       SET signer = 'VP',
              ack_segment = 'Receipt'
 WHERE flag_payroll_deduction <= 0
       AND transaction_type IN ('PP','GF');
COMMIT;

UPDATE temp_letter2
   SET signer = 'VP',
       ack_segment = 'Payroll Pledge'
WHERE flag_payroll_deduction = 1
  AND flag_pc_this_gift = '1';
COMMIT;

INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter2
 WHERE ack_segment IN ('Receipt','Payroll Pledge'));
COMMIT;

/*** No receipt or letter for Payroll Pledge Payments ***/
UPDATE a_ack_rcpt
      SET ack_segment = 'No Receipt for Payroll Payment',
             signer            = 'None'
WHERE ack_payroll_pmt_seq > 0
     AND ack_segment IS NULL;
COMMIT;     
/
/****************************************************************************************************************************************************************************************************************/
/*** Second Campus Gift gets different letter and receipt ****/
/*** If second campus gift is a second campus PC gift, they get a standard second PC gift letter, so that will be dealt with later ***/
/*** Here we will only address campus gifts that are not PC ***/
/*** Eliminated Campus 2 Letter 8/10/11 per FY12 Guidelines provided by Sara Pond

UPDATE a_ack_rcpt
SET ack_segment = 'Campus 2',
       signer            = 'Pres'
WHERE transaction_type IN ('GF')
     AND flag_campus = '1'
     AND flag_pc_cash <> '1'
     AND flag_securities <> '1'
     AND ack_gift_sequence > 1
     AND ack_segment IS NULL;
COMMIT;
     
DROP TABLE temp_letter2;
COMMIT;

CREATE TABLE temp_letter2
AS
    (SELECT *
        FROM a_ack_rcpt
     WHERE ack_segment = 'Campus 2');
COMMIT;
     
UPDATE temp_letter2
      SET ack_segment = 'Receipt', 
             signer = 'VP';
COMMIT;
             
INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter2);
COMMIT;
/****************************************************************************************************************************************************************************************************************/
/*** DiggerDial PC Pledges Get No Receipt (nor do any DiggerDial Pledges, for that matter) ****/
UPDATE a_ack_rcpt
      SET ack_segment = 'DiggerDial Pledge - No Receipt',
             signer = 'None'
WHERE ack_segment IS NULL
      AND transaction_type = 'P'
      AND appeal_code IN
            (SELECT appeal_code
                FROM a_dw_phonathon_appeals);
COMMIT;
/*** PC Pledges get no receipt, but get a VP letter, which I'll call Accompany PCP for the funk of it -- 2 different letters exist for this***/
/*** Edited 10/20/10 to add where ack_segment = Campus Standard ... this makes so Campus PC Pledges get this letter instead of Prez letter ***/
UPDATE a_ack_rcpt
      SET ack_segment = 'Accompany PCP',
             signer = 'VP'
 WHERE (ack_segment IS NULL or ack_segment = 'Campus Standard')
      AND transaction_type = 'P'
      AND (prim_pledge_original_amount >= 1000
               OR (prim_pledge_original_amount < 1000
                      AND cfy_commitment_ytd >= 1000));               
COMMIT;               
/*** Add Young Alum to the same segment, could have added it in the previous code block, but it would have been more difficult to adjust ***/
/*** Have fun reading it -- basically it says YA if they pledged PC this gift, or if this pledge plus other FY pledges summed are PC ***/
/*** Edited 10/20/10 to add where ack_segment = Campus Standard ... this makes so Young Alum Campus PC Pledges get this letter instead of Prez letter ***/
/*** Updated 10/27/2010 ... added cnt_undergrad >= 1 to young pc as those with ONLY a grad degree at Mines cannot be Young PC per John/Rosie ***/
UPDATE a_ack_rcpt       a1
      SET a1.ack_segment = 'Accompany PCP',
             a1.signer = 'VP'WHERE (a1.ack_segment IS NULL or ack_segment = 'Campus Standard')
     AND a1.transaction_type = 'P'
     AND a1.flag_young_alum = '1'
     AND a1.cnt_undergrad   >= 1
     AND ((a1.prim_pledge_original_amount >=
            (SELECT y.pc_gift_level
                 FROM a_dw_young_alum       y
              WHERE y.year = a1.pref_class_year))
              OR ((a1.prim_pledge_original_amount <
                    (SELECT y.pc_gift_level
                        FROM a_dw_young_alum    y
                      WHERE y.year = a1.pref_class_year))
                      AND a1.cfy_commitment_ytd >=
                        (SELECT y2.pc_gift_level
                            FROM a_dw_young_alum    y2
                         WHERE y2.year = a1.pref_class_year)));
COMMIT;

/*** Eliminated Accompany Letter 8/10/11 per FY12 Guidelines provided by Sara Pond
/*** NOTE:  "Accompany PCP isn't really an accompany letter.... but "Accompany Gugg" is
/*** Gugg Accompany PC Letter 
UPDATE a_ack_rcpt
      SET ack_segment = 'Accompany Gugg'
WHERE ack_segment = 'Accompany PCP'
     AND  prim_pledge_original_amount > 25000;
COMMIT;
***/

/*** Set Accompany PC to Accompany PP -- as the letter is different if a payment is included with the pledge ***/
/*** 8/17/11 - leave this one in here for now as the process does say a pledge w/ a payment gets a VP letter ***/
UPDATE  a_ack_rcpt      a1
    SET     ack_segment = 'Accompany PP'
WHERE   ack_segment IN  ('Accompany PCP','Accompany Gugg')
    AND     flag_pmt_w_pledge = 2;
COMMIT;    
/****************************************************************************************************************************************************************************************************************/
/*** Parent PC get receipt and President letter, also get a 3rd accompany VP letter if gift over $10K ***/
UPDATE a_ack_rcpt
      SET ack_segment = 'Parent PC',
             signer            = 'Pres'
WHERE transaction_type IN ('GF')
     AND (record_type_code = 'PA' OR flag_parent = '1')
     AND flag_pc = '1'
     AND pc_gift_xsequence = '1'
     AND ack_segment IS NULL;
COMMIT;     

DROP TABLE temp_letter2;
COMMIT;

CREATE TABLE temp_letter2
AS
    (SELECT *
        FROM a_ack_rcpt
     WHERE ack_segment = 'Parent PC');
COMMIT;

/*** Eliminated Accompany Letter 8/10/11 per FY12 Guidelines provided by Sara Pond
DROP TABLE temp_letter3;
COMMIT;

CREATE TABLE temp_letter3
AS
    (SELECT *
         FROM temp_letter2
      WHERE flag_pc_this_gift = 1);
COMMIT;
***/

UPDATE temp_letter2
      SET ack_segment = 'Receipt',
             signer = 'VP';
COMMIT;

/*** Eliminated Accompany Letter 8/10/11 per FY12 Guidelines provided by Sara Pond
UPDATE temp_letter3
      SET ack_segment = 'Accompany PCG',
             signer = 'VP';
COMMIT;
***/

INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter2);
COMMIT;

/*** Eliminated Accompany Letter 8/10/11 per FY12 Guidelines provided by Sara Pond
INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter3);
COMMIT;          
***/ 
/**************************************************************/
/*** FY12 - Athletics PC gets letter from President with a receipt, no matter the dollar value ****/
UPDATE a_ack_rcpt
      SET ack_segment = 'Athletic PC',
             signer = 'Pres'
WHERE (alloc = '5983'
               AND flag_pc = '1'
               AND transaction_type = 'GF'
               AND pc_gift_xsequence = '1'
               AND ack_segment IS NULL)
       OR (alloc_dept_code              = 'PA'
              AND flag_pc = '1'
              AND transaction_type = 'GF'
               AND pc_gift_xsequence = '1'
              AND ack_segment IS NULL);
COMMIT;              

DROP TABLE temp_letter2;
COMMIT;

CREATE TABLE temp_letter2
AS
    (SELECT *
        FROM a_ack_rcpt
     WHERE ack_segment = 'Athletic PC');
COMMIT;

/*** Eliminated Accompany Letter 8/10/11 per FY12 Guidelines provided by Sara Pond
DROP TABLE temp_letter3;
COMMIT;

CREATE TABLE temp_letter3
AS
    (SELECT *
         FROM temp_letter2
      WHERE flag_pc_this_gift = 1);
COMMIT;
***/

UPDATE temp_letter2
      SET ack_segment = 'Receipt',
             signer = 'VP';
COMMIT;

/*** Eliminated Accompany Letter 8/10/11 per FY12 Guidelines provided by Sara Pond
UPDATE temp_letter3
      SET ack_segment = 'Accompany PCG',
             signer = 'VP';
COMMIT;
***/

INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter2);
COMMIT;

/*** Eliminated Accompany Letter 8/10/11 per FY12 Guidelines provided by Sara Pond
INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter3);
COMMIT;
***/
/****************************************************************************************************************************************************************************************************************/
/*** Pledge Payments Below PC Level Get Receipt, as do PC pledge payments ***/
UPDATE a_ack_rcpt 
      SET ack_segment = 'Receipt',
             signer = 'VP'
  WHERE transaction_type = 'PP'
        AND flag_securities <> '1'
        AND flag_pc_cash <> '1'
        AND ack_segment IS NULL;
COMMIT;

/*** FY11 Pledge Payments that Fulfull or Maintain PC get additional letter.  Pledge Payments over $10000 get a third letter from the VP to accompany ***/
/*** FY12 - above no longer true.... no dollar amount decides a letter or not
 * 1st PC Pledge Payement gets PC level payment letter
 * Fulfilled pledge gets PC Pledge Fulfillment letter 
UPDATE a_ack_rcpt 
      SET ack_segment = 'Pledge Payment PC',
             signer = 'Pres'
  WHERE transaction_type = 'PP'
        AND flag_securities <> '1'
        AND flag_pc_cash = '1'
        AND ack_segment IS NULL;
COMMIT;
/

DROP TABLE temp_letter2;
COMMIT;

CREATE TABLE temp_letter2
AS
    (SELECT *
        FROM a_ack_rcpt
     WHERE ack_segment = 'Pledge Payment PC');
COMMIT;

/*** Eliminated Accompany Letter 8/10/11 per FY12 Guidelines provided by Sara Pond
DROP TABLE temp_letter3;
COMMIT;

--add letter for pledge payment over $10K that does not fulfill the pledge ... if it fulfills the pledge it gets a different letter
--NOTE: Changed from $1K in 2009 to $10K in 2010
--NOTE: changed from $10K in 2010 to $1K in 2011
CREATE TABLE temp_letter3
AS
    (SELECT *
         FROM temp_letter2
      WHERE associated_amount_cfy + associated_amount_cfy_match + associated_amount_cfy_claim >= 1000
           AND prim_pledge_amount_os > 0);
COMMIT;

DROP TABLE temp_letter4;
COMMIT;

CREATE TABLE temp_letter4
AS
    (SELECT * 
        FROM temp_letter2
     WHERE prim_pledge_amount_os = 0);
COMMIT;          
***/

UPDATE temp_letter2
      SET ack_segment = 'Receipt',
             signer = 'VP';
COMMIT;

/*** Eliminated Accompany Letter 8/10/11 per FY12 Guidelines provided by Sara Pond
UPDATE temp_letter3
       SET ack_segment = 'Accompany 1KPP',
              signer            = 'VP';
COMMIT;              

UPDATE temp_letter4
       SET ack_segment = 'Accompany PCPPF',
               signer = 'VP';
COMMIT;
***/    
         
INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter2);
COMMIT;

/*** Eliminated Accompany Letter 8/10/11 per FY12 Guidelines provided by Sara Pond
INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter3);
COMMIT;

INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter4);
COMMIT;
***/
/****************************************************************************************************************************************************************************************************************/
/*** First straight Up PC Gifts get receipt and letter from President, letter from VP as well if gift over $10K (For first or any PC gift on the accompany letter)***/
UPDATE a_ack_rcpt
      SET ack_segment = 
        (CASE WHEN alloc = '3795' THEN 'PC TMF'
              WHEN alloc <> '3795' THEN 'PC'
         END),
             signer            = 'Pres'
  WHERE flag_pc_cash = '1'
       AND transaction_type   = 'GF'
       AND pc_gift_xsequence = '1'
       AND associated_amount_cfy + associated_amount_cfy_match + associated_amount_cfy_claim < 25000
       AND ack_segment IS NULL;
COMMIT;       

UPDATE a_ack_rcpt
      SET ack_segment = 
        (CASE WHEN alloc = '3795' THEN 'Gugg TMF'
              WHEN alloc <> '3795' THEN 'Guff'
         END),
             signer            = 'Pres'
  WHERE flag_pc = '1'
       AND transaction_type   = 'GF'
       AND pc_gift_xsequence = '1'
       AND associated_amount_cfy + associated_amount_cfy_match + associated_amount_cfy_claim >= 25000
       AND ack_segment IS NULL;
COMMIT;    

DROP TABLE temp_letter2;
COMMIT;

CREATE TABLE temp_letter2
AS
    (SELECT *
        FROM a_ack_rcpt
     WHERE ack_segment IN ('PC','PC TMF','Gugg','Gugg TMF')
         AND flag_honor = 0
         AND flag_securities = 0);
COMMIT;

/*** Eliminated Accompany Letter 8/10/11 per FY12 Guidelines provided by Sara Pond
DROP TABLE temp_letter3;
COMMIT;

CREATE TABLE temp_letter3
AS
    (SELECT *
        FROM temp_letter2
     WHERE flag_pc_this_gift = 1);
COMMIT;
***/

UPDATE temp_letter2
      SET ack_segment = 'Receipt',
             signer = 'VP';
COMMIT;

/*** Eliminated Accompany Letter 8/10/11 per FY12 Guidelines provided by Sara Pond
UPDATE temp_letter3
      SET ack_segment = 'Accompany PCG',
             signer = 'VP';
COMMIT;    
***/

INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter2);
COMMIT;

/*** Eliminated Accompany Letter 8/10/11 per FY12 Guidelines provided by Sara Pond
INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter3);
COMMIT;
***/
/****************************************************************************************************************************************************************************************************************/
/*** Second and subsequent PC gifts get a receipt and an email to the PM to decide what to do ***/
/*** NOTE:  Just stop printing the PC2 letter ... use PC2 to generate an email ***/
UPDATE a_ack_rcpt
      SET ack_segment = 'PC2',
             signer = 'Pres'
WHERE pc_gift_xsequence >= 2
     AND flag_honor = 0
     AND flag_payroll_deduction = 0
     AND (ack_segment NOT IN ('Securities','Securities TMF') OR ack_segment IS NULL);

DROP TABLE temp_letter2;
COMMIT;

CREATE TABLE temp_letter2
AS
    (SELECT *
        FROM a_ack_rcpt
     WHERE ack_segment IN ('PC2'));
COMMIT;


UPDATE temp_letter2
      SET ack_segment = 'Receipt',
             signer = 'VP';
COMMIT;

INSERT INTO a_ack_rcpt
(SELECT * FROM temp_letter2);
COMMIT;
/
/****************************************************************************************************************************************************************************************************************/
/*** Pledge below PC gets nothing ***/
UPDATE a_ack_rcpt
      SET ack_segment = 'Non-PC Pledge, Nothing',
             signer = 'VP'
WHERE transaction_type = 'P'
     AND ack_segment IS NULL;
COMMIT;             
/****************************************************************************************************************************************************************************************************************/
/*** Receipts ***/
/*** Flag_PC but no pc_gift_xsequence means they have pledged PC but haven't yet given at that level -- so they just get a receipt ***/
UPDATE a_ack_rcpt
      SET  ack_segment = 'Receipt',
              signer = 'VP'
 WHERE ack_segment IS NULL
      AND flag_pc = '1'
      AND transaction_type = 'GF'
      AND pc_gift_xsequence = 0;
COMMIT;              
/*** All remaining gifts get receipt ***/
UPDATE a_ack_rcpt
      SET ack_segment = 'Receipt',
             signer = 'VP'
WHERE ack_segment IS NULL
     AND transaction_type = 'GF';
COMMIT;     

/***********************************************/
/****** Flag New Century Society Acks ************/
/**********************************************/
/*** This flag will only work until the donor gives another gift, so this will only show if the change happened on their most recent gift ***/
UPDATE a_ack_rcpt
        SET manager_pref_name = 'Send to Annie and Erica, New to '||DECODE(flag_new_cs_level,1,'Copper ',
                                                                                                                                    2,'Silver ',
                                                                                                                                    3,'Gold ',
                                                                                                                                    4,'Platinum ',
                                                                                                                                    5,'Diamond ')||
                                                'Century Society Level'
WHERE flag_new_cs_level > 0;
commit;

/*** This flag will appear as a historical reference, stating that this gift was what pushed them over the limit of a new CS level ***/
UPDATE a_ack_rcpt
        SET manager_pref_name = 'Send to Annie and Erica, New to '||DECODE(flag_new_cs_level_this_gift,1,'Copper ',
                                                                                                                                    2,'Silver ',
                                                                                                                                    3,'Gold ',
                                                                                                                                    4,'Platinum ',
                                                                                                                                    5,'Diamond ')||
                                                'Century Society Level'
WHERE flag_new_cs_level_this_gift > 0
       AND manager_pref_name NOT LIKE '%Send to Annie and Erica,%';
commit;
/***********************************************/
/****** Flag Francis DeFilippo Acks ************/
/***********************************************/
UPDATE a_ack_rcpt
   SET manager_pref_name = 'Direct to Heidi Cox per request of Francis DeFilippo'
 WHERE id_number = 8156;
COMMIT;

UPDATE a_ack_rcpt
   SET pref_mail_name = 'Direct to Heidi Cox per request of Francis DeFilippo'
 WHERE id_number = 8156
   AND ack_segment = 'Receipt';
COMMIT;
/     

/*** Receipt 
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
/******************************************************/
/************PC Gift Letter Text *******************/
/*****************************************************/
/*** Do this so you can concatenate fields if need be ***/
UPDATE a_ack_rcpt
SET flag_received_letter = ' '
WHERE flag_received_letter IS NULL;
commit;

UPDATE a_ack_rcpt
       SET pc_gift_text = DECODE(pc_gift_xsequence,1,'First',2,'Second',3,'Third',4,'Fourth',5,'Fifth',6,'Sixth',7,'Seventh','0?');
COMMIT;       

UPDATE a_ack_rcpt
SET flag_received_letter = 'The word '||pc_gift_text||' in this may be false'
WHERE ack_segment = 'PC2';
COMMIT;

/*** Campus gifts which are also memorial do NOT get a receipt ***/
UPDATE a_ack_rcpt
        SET ack_segment = 'Campus Gift Also Mem - No Rcpt'
 WHERE ack_segment = 'Receipt'
      AND flag_honor = 1
      AND receipt IN
        (SELECT receipt FROM a_ack_rcpt WHERE ack_segment IN ('Campus Standard','Campus PC'));
COMMIT;
/

/*** Per Rosie 10/26/2009 flag all pledge payments on a pc pledge ***/
UPDATE a_ack_rcpt
        SET flag_received_letter = 'Possibly Already Received Pledge Payment PC Letter'
WHERE  transaction_type = 'PP'
     AND receipt_paid IN
        (SELECT receipt FROM a_ack_rcpt WHERE transaction_type = 'P' AND flag_pc_this_gift = '1');
COMMIT;
/

/*** Per Heidi 01/20/2011 flag all PC2 letters ***/
UPDATE a_ack_rcpt       ack
   SET ack.flag_received_letter = 
    (select nvl(max(a.ass_pref_mail_name),'Mrs. Sara Pond')||' received notification via email of this Second PC gift' 
       from a_dw_assignment_pm a
      where a.ass_id_number = ack.manager_id_number)
WHERE  ack.ack_segment = 'PC2';
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


/************************************************************/
/************************************************************/
/*** Populate letter field for Securities & Real Estate...***/
/****************** ...Receipts *****************************/
/************************************************************/
DELETE FROM a_ack_rcpt
 WHERE (ack_segment = 'Receipt' 
   AND flag_securities = '1');
COMMIT;
/

/************************************************************/
/************************************************************/
/*** Populate letter field for non-PC Securities gifts ******/
/************************************************************/
/************************************************************/
UPDATE a_ack_rcpt
   SET ack_letter1 = 'Generates Special Securities Receipt and Letter'
 WHERE ack_segment IN ('Securities','Securities TMF')
   AND signer      = 'VP';
COMMIT;
/


/************************************************************/
/************************************************************/
/*** Populate letter field for Securities and Real Estate ***/
/************************************************************/
/************************************************************/
/*** Updated 08-25-2010, per Heidi, Canadian gifts do get receipts if Stock ... I edited out the stock exclusion line below ***/
UPDATE a_ack_rcpt
   SET ack_segment = 'No Receipt for Canada',
           signer = 'CD'
 WHERE (ack_segment = 'Receipt')
 --   OR  ack_segment IN ('Securities','Securities TMF'))
   AND p_country_code = 'CD';
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

/***********************************************/
/***********************************************/
/***  Second PC Email Stuff ***********************/
/***********************************************/
/***********************************************/
--Bryan Mack, just to cover my ass
UPDATE a_ack_rcpt  
   SET pc2_email1 = 'bmack@exchange.mines.edu'
 WHERE ack_segment IN ('PC2','Bequest','PC Bequest');
COMMIT;

--Diane Scollard, just to cover her ass (if PC2), else go to Kim Spratt (Planned Giving Officer)
UPDATE a_ack_rcpt  
   SET pc2_email2 = DECODE(ack_segment,'PC2','scollard@exchange.mines.edu','kspratt@exchange.mines.edu')
 WHERE ack_segment IN ('PC2','Bequest','PC Bequest');
COMMIT;

--Heidi Cox, just to cover her ass (if PC2), else to go Chris Wenger (Planned Giving Director)
UPDATE a_ack_rcpt  
   SET pc2_email3 = DECODE(ack_segment,'PC2','heidic@exchange.mines.edu','cwenger@exchange.mines.edu')
 WHERE ack_segment IN ('PC2','Bequest','PC Bequest');
COMMIT;

--PM, if exists, per Sara Pond 08/15/2011 (FY12 Ack Process)
UPDATE a_ack_rcpt  ack
   SET ack.pc2_email4 =
    (select z.email_address
       from zz_user z
      where z.id_number = ack.manager_id_number)
 WHERE ack_segment = 'PC2';
COMMIT;     
   
--Director or Annual Giving (Sara Pond), per Sara Pond 08/15/2011 (FY12 Ack Process), if no PM
UPDATE a_ack_rcpt  
   SET pc2_email4 = DECODE(ack_segment,'PC2','spond@exchange.mines.edu','test@test.com')
 WHERE manager_id_number IS NULL;
COMMIT;

--Annual Gift Officer (Laura Stenovec), per Sara Pond 08/15/2011 (FY12 Ack Process), if no PM
UPDATE a_ack_rcpt  
   SET pc2_email5 = DECODE(ack_segment,'PC2','lstenove@exchange.mines.edu','test@test.com')
 WHERE manager_id_number IS NULL;
COMMIT;

--update to dummy account where pc_email4 is a PM, and thus, pc_email5 is going to be null
UPDATE a_ack_rcpt
   SET pc2_email5 = 'test@test.com'
 WHERE pc2_email5 IS NULL
   AND pc2_email1 IS NOT NULL;
COMMIT; 


drop table a_ack_rcpt2;
commit;

--note - do not include those where they changed CS societies on this gift
create table a_ack_rcpt2
as
(select *
from a_ack_rcpt
where ack_segment IN ('PC2','Bequest','PC Bequest')
and flag_new_cs_level = 0);
commit;

/*** Un-Comment this if we want to stop printing the letters
delete from a_ack_rcpt
where ack_segment = 'PC2';
commit;
***/

drop table a_ack_rcpt3;
commit;

create table a_ack_rcpt3
(id_number       varchar2(10),
 pref_mail_name  varchar2(45),
 date_of_record varchar2(8),
 pc2_email1     varchar2(80),
 pc2_email2     varchar2(80),
 pc2_email3     varchar2(80),
 pc2_email4     varchar2(80),
 pc2_email5     varchar2(80),
 ack_segment    varchar2(30),
 gifts                varchar2(255));
commit;

insert into a_ack_rcpt3
(id_number, pref_mail_name, date_of_record, pc2_email1, pc2_email2, pc2_email3, pc2_email4, pc2_email5, ack_segment)
(select distinct id_number, pref_mail_name, date_of_record, pc2_email1, pc2_email2, pc2_email3, pc2_email4, pc2_email5, ack_segment from a_ack_rcpt2);
commit;

update a_ack_rcpt3   a3
set a3.gifts =
    (select substr(max(decode(today_xsequence,1,alloc_desc||'- '||'$'||associated_amount_cfy))||
               max(decode(today_xsequence,2,CHR(13)||alloc_desc||'- '||'$'||associated_amount_cfy))||
               max(decode(today_xsequence,3,CHR(13)||alloc_desc||'- '||'$'||associated_amount_cfy))||
               max(decode(today_xsequence,4,CHR(13)||alloc_desc||'- '||'$'||associated_amount_cfy))||
               max(decode(today_xsequence,5,CHR(13)||alloc_desc||'- '||'$'||associated_amount_cfy))||
               max(decode(today_xsequence,6,CHR(13)||alloc_desc||'- '||'$'||associated_amount_cfy))||
               max(decode(today_xsequence,7,CHR(13)||alloc_desc||'- '||'$'||associated_amount_cfy))||
               max(decode(today_xsequence,8,CHR(13)||alloc_desc||'- '||'$'||associated_amount_cfy)),1,255)
         from a_ack_rcpt2  a2
       where a2.id_number = a3.id_number
           and a2.date_of_record = a3.date_of_record);
COMMIT;


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

GRANT ALTER  ON a_ack_temp_honor TO ADVROLE;
/
GRANT DELETE ON a_ack_temp_honor TO ADVROLE;
/
GRANT INSERT ON a_ack_temp_honor TO ADVROLE;
/
GRANT SELECT ON a_ack_temp_honor TO ADVROLE;
/
GRANT UPDATE ON a_ack_temp_honor TO ADVROLE;
/

/*** Update Runtimes ***/
INSERT INTO ADVANCE.a_dw_runtimes
   VALUES
      ('Finish','Create a_ack_rcpt table',TO_CHAR(SYSDATE, 'YYYYMMDD:HH:MI:SS'), SYSDATE);
COMMIT;

EXIT;