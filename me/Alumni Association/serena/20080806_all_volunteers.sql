/*** All Alumni Association Volunteers ***/
DROP TABLE a_dw_aa_volunteers;
COMMIT;
/

CREATE TABLE a_dw_aa_volunteers
(id_number                     VARCHAR2(10) NOT NULL,
 pref_mail_name             VARCHAR2(60) NULL,
 pref_name_sort             VARCHAR2(60) NULL,
 pref_class_year                VARCHAR2(4) NULL,
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
 h_care_of               VARCHAR2(45)  NULL,
 h_company_name_1        VARCHAR2(60)  NULL,
 h_company_name_2        VARCHAR2(60)  NULL,
 h_business_title        VARCHAR2(60)  NULL,
 h_street1               VARCHAR2(40)  NULL,
 h_street2               VARCHAR2(40)  NULL,
 h_street3               VARCHAR2(40)  NULL,
 h_city                  VARCHAR2(30)  NULL,
 h_state_code            VARCHAR2(3)   NULL,
 h_state_desc            VARCHAR2(40)  NULL,
 h_zipcode               VARCHAR2(10)  NULL,
 h_cityline              VARCHAR2(60)  NULL,
 h_foreign_cityzip       VARCHAR2(40)  NULL,
 h_country_code          VARCHAR2(5)   NULL,
 h_country_desc          VARCHAR2(40)  NULL,
 h_geo_desc              VARCHAR2(60)  NULL,
 h_flag_foreign          NUMBER(1)     NULL,
 h_flag_tanfc            NUMBER(1)     NULL,
 h_email_address         VARCHAR2(60)  NULL,
 h_flag_no_email         NUMBER(1)     NULL,
 h_phone_status          VARCHAR2(3)   NULL,
 h_phone_area_code       VARCHAR2(3)   NULL,
 h_phone_number          VARCHAR2(7)   NULL,
 h_phone_extension       VARCHAR2(5)   NULL,
 h_phone_formatted       VARCHAR2(40)  NULL,
 h_cell_formatted        VARCHAR2(40)  NULL,
 h_phone_unlisted_ind    CHAR(1)       NULL,
 h_fax_formatted         VARCHAR2(40)  NULL,
 h_foreign_phone         VARCHAR2(22)  NULL,
 h_foreign_fax           VARCHAR2(22)  NULL,
 b_care_of               VARCHAR2(45)  NULL,
   b_company_name_1        VARCHAR2(60)  NULL,
   b_company_name_2        VARCHAR2(60)  NULL,
   b_business_title        VARCHAR2(60)  NULL,
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
   b_geo_desc              VARCHAR2(60)  NULL,
   b_flag_foreign          NUMBER(1)     NULL,
   b_flag_tanfc            NUMBER(1)     NULL,
   b_email_address         VARCHAR2(60)  NULL,
   b_flag_no_email         NUMBER(1)     NULL,
   b_phone_status          VARCHAR2(3)   NULL,
   b_phone_area_code       VARCHAR2(3)   NULL,
   b_phone_number          VARCHAR2(7)   NULL,
   b_phone_extension       VARCHAR2(5)   NULL,
   b_phone_formatted       VARCHAR2(40)  NULL,
   b_cell_formatted        VARCHAR2(40)  NULL,
   b_phone_unlisted_ind    CHAR(1)       NULL,
   b_fax_formatted         VARCHAR2(40)  NULL,
   b_foreign_phone         VARCHAR2(22)  NULL,
   b_foreign_fax           VARCHAR2(22)  NULL);
 COMMIT;
 /
 

CREATE TABLE temp_vol_all
(id_number  VARCHAR2(10));
COMMIT;
/

/*** Alumni Volunteers Report Guts ***/
INSERT INTO temp_vol_all
    (SELECT distinct(id_number)
        FROM committee
     WHERE committee_code IN ('BOT','CSMX','AAPP','AABOD','DMC','EDH','AAGC','AASC','AARP','AARV'));
COMMIT;
/     

/*** AAG = CSMAA Event Golf ***/
/*** AAOV = CSMAA Office Volunteers ***/
INSERT INTO temp_vol_all
        (SELECT distinct(id_number)
            FROM activity
         WHERE activity_code IN ('AAG','AAOV')
              AND id_number NOT IN
                    (SELECT id_number
                        FROM temp_vol_all));
COMMIT;
/

INSERT INTO temp_vol_all
        (SELECT distinct(id_number)
            FROM mentor
         WHERE mentor_type_code = 'MENT'
              AND mentor_status_code = 'A'
              AND id_number NOT IN
                    (SELECT id_number
                        FROM temp_vol_all));
COMMIT;
/     
     
DELETE FROM temp_vol_all
WHERE id_number NOT IN
    (SELECT id_number
        FROM a_dw_address_good);
COMMIT;
/        
     
INSERT INTO a_dw_aa_volunteers (id_number)
    (SELECT id_number
        FROM temp_vol_all);
COMMIT;
/    

DROP TABLE temp_vol_all;
COMMIT;
/

UPDATE a_dw_aa_volunteers   dw
SET              (dw.pref_mail_name,
                    dw.pref_name_sort,
                    dw.pref_class_year,
                    dw.p_addr_type_code,
                    dw.p_care_of,
                    dw.p_company_name_1,
                    dw.p_company_name_2,
                    dw.p_business_title,
                    dw.p_street1,
                    dw.p_street2,
                    dw.p_street3,
                    dw.p_city,
                    dw.p_state_code,
                    dw.p_state_desc,
                    dw.p_zipcode,
                    dw.p_cityline,
                    dw.p_foreign_cityzip,
                    dw.p_country_code,
                    dw.p_country_desc,
                    dw.p_flag_foreign,
                    dw.p_email_address,
                    dw.p_phone_status,
                    dw.p_phone_area_code,
                    dw.p_phone_number,
                    dw.p_phone_extension,
                    dw.p_phone_formatted,
                    dw.p_phone_unlisted_ind,
                    dw.p_fax_formatted,
                    dw.p_foreign_phone,
                    dw.p_foreign_fax,
                    dw.h_care_of,
                    dw.h_company_name_1,
                    dw.h_company_name_2,
                    dw.h_business_title,
                    dw.h_street1,
                    dw.h_street2,
                    dw.h_street3,
                    dw.h_city,
                    dw.h_state_code,
                    dw.h_state_desc,
                    dw.h_zipcode,
                    dw.h_cityline,
                    dw.h_foreign_cityzip,
                    dw.h_country_code,
                    dw.h_country_desc,
                    dw.h_geo_desc,
                    dw.h_flag_foreign,
                    dw.h_flag_tanfc,
                    dw.h_email_address,
                    dw.h_flag_no_email,
                    dw.h_phone_status,
                    dw.h_phone_area_code,
                    dw.h_phone_number,
                    dw.h_phone_extension,
                    dw.h_phone_formatted,
                    dw.h_cell_formatted,
                    dw.h_phone_unlisted_ind,
                    dw.h_fax_formatted,
                    dw.h_foreign_phone,
                    dw.h_foreign_fax,
                    dw.b_care_of,
                    dw.b_company_name_1,
                    dw.b_company_name_2,
                    dw.b_business_title,
                    dw.b_street1,
                    dw.b_street2,
                    dw.b_street3,
                    dw.b_city,
                    dw.b_state_code,
                    dw.b_state_desc,
                    dw.b_zipcode,
                    dw.b_cityline,
                    dw.b_foreign_cityzip,
                    dw.b_country_code,
                    dw.b_country_desc,
                    dw.b_geo_desc,
                    dw.b_flag_foreign,
                    dw.b_flag_tanfc,
                    dw.b_email_address,
                    dw.b_flag_no_email,
                    dw.b_phone_status,
                    dw.b_phone_area_code,
                    dw.b_phone_number,
                    dw.b_phone_extension,
                    dw.b_phone_formatted,
                    dw.b_cell_formatted,
                    dw.b_phone_unlisted_ind,
                    dw.b_fax_formatted,
                    dw.b_foreign_phone,
                    dw.b_foreign_fax) =
(SELECT       dwa.pref_mail_name,
                    dwa.pref_name_sort,
                    dwa.pref_class_year,
                    dwa.p_addr_type_code,
                    dwa.p_care_of,
                    dwa.p_company_name_1,
                    dwa.p_company_name_2,
                    dwa.p_business_title,
                    dwa.p_street1,
                    dwa.p_street2,
                    dwa.p_street3,
                    dwa.p_city,
                    dwa.p_state_code,
                    dwa.p_state_desc,
                    dwa.p_zipcode,
                    dwa.p_cityline,
                    dwa.p_foreign_cityzip,
                    dwa.p_country_code,
                    dwa.p_country_desc,
                    dwa.p_flag_foreign,
                    dwa.p_email_address,
                    dwa.p_phone_status,
                    dwa.p_phone_area_code,
                    dwa.p_phone_number,
                    dwa.p_phone_extension,
                    dwa.p_phone_formatted,
                    dwa.p_phone_unlisted_ind,
                    dwa.p_fax_formatted,
                    dwa.p_foreign_phone,
                    dwa.p_foreign_fax,
                    dwa.h_care_of,
                    dwa.h_company_name_1,
                    dwa.h_company_name_2,
                    dwa.h_business_title,
                    dwa.h_street1,
                    dwa.h_street2,
                    dwa.h_street3,
                    dwa.h_city,
                    dwa.h_state_code,
                    dwa.h_state_desc,
                    dwa.h_zipcode,
                    dwa.h_cityline,
                    dwa.h_foreign_cityzip,
                    dwa.h_country_code,
                    dwa.h_country_desc,
                    dwa.h_geo_desc,
                    dwa.h_flag_foreign,
                    dwa.h_flag_tanfc,
                    dwa.h_email_address,
                    dwa.h_flag_no_email,
                    dwa.h_phone_status,
                    dwa.h_phone_area_code,
                    dwa.h_phone_number,
                    dwa.h_phone_extension,
                    dwa.h_phone_formatted,
                    dwa.h_cell_formatted,
                    dwa.h_phone_unlisted_ind,
                    dwa.h_fax_formatted,
                    dwa.h_foreign_phone,
                    dwa.h_foreign_fax,
                    dwa.b_care_of,
                    dwa.b_company_name_1,
                    dwa.b_company_name_2,
                    dwa.b_business_title,
                    dwa.b_street1,
                    dwa.b_street2,
                    dwa.b_street3,
                    dwa.b_city,
                    dwa.b_state_code,
                    dwa.b_state_desc,
                    dwa.b_zipcode,
                    dwa.b_cityline,
                    dwa.b_foreign_cityzip,
                    dwa.b_country_code,
                    dwa.b_country_desc,
                    dwa.b_geo_desc,
                    dwa.b_flag_foreign,
                    dwa.b_flag_tanfc,
                    dwa.b_email_address,
                    dwa.b_flag_no_email,
                    dwa.b_phone_status,
                    dwa.b_phone_area_code,
                    dwa.b_phone_number,
                    dwa.b_phone_extension,
                    dwa.b_phone_formatted,
                    dwa.b_cell_formatted,
                    dwa.b_phone_unlisted_ind,
                    dwa.b_fax_formatted,
                    dwa.b_foreign_phone,
                    dwa.b_foreign_fax                    
   FROM        a_dw_address_good        dwa
WHERE        dw.id_number                   = dwa.id_number);
COMMIT;
/

DELETE FROM a_dw_aa_volunteers
 WHERE id_number IN
    (SELECT id_number
        FROM a_dw_address_good
     WHERE flag_omit_from_mail = '1');
COMMIT;
/

     
SELECT *
from a_dw_aa_volunteers;                   