/*** Creates Tables for All PG Prospecting Reports ***/
/*** This needs to run in the overnights AFTER a_dw_address_good ***/
/*** This needs to run in the overnights AFTER a_dw_gift_clubs ***/

/*** Update Runtimes ***/
INSERT INTO ADVANCE.a_dw_runtimes
   VALUES
      ('Start','Create a_dw_pg_prospecting',TO_CHAR(SYSDATE, 'YYYYMMDD:HH:MI:SS'), SYSDATE);
COMMIT;
/

/*** Drop Table If It Already Exists ***/
DROP TABLE a_dw_pg_prospecting;
COMMIT;
/

/*** Add if they get the Planned Giving Newsletter ***/
CREATE TABLE  a_temp_pg_pros_1          AS
     SELECT   id_number
       FROM   mailing_list
       WHERE  mail_list_code            IN('PGN');
COMMIT;
/

/*** Add Widows ***/
INSERT INTO   a_temp_pg_pros_1 (id_number)
   (SELECT    id_number
      FROM    entity_record_type
     WHERE    record_type_code = 'WI');
COMMIT;
/

/*** Add Heritage Society ***/
INSERT INTO   a_temp_pg_pros_1 (id_number)
   (SELECT    gift_club_id_number
      FROM    gift_clubs
     WHERE    gift_club_code      = 'HS');
COMMIT;
/

/*** Add to Table For Everyone Older than 1968 ***/
INSERT INTO a_temp_pg_pros_1   (id_number)
    (SELECT id_number
       FROM a_dw_address_good
      WHERE record_type_code    = 'AL'
        AND pref_class_year     < '1970');
COMMIT;
/

/*** Add All People Rated with GG&A Rating ***/
INSERT INTO   a_temp_pg_pros_1 (id_number)
    (SELECT   d.id_number
       FROM   demographic_profile   d
      WHERE   d.dp_rating_type_code = 'PGC');
COMMIT;
/

/*** Add those people Prior to 1976 with 0 children ***/
INSERT INTO    a_temp_pg_pros_1 (id_number)
    (SELECT    e.id_number          
       FROM    entity               e
      WHERE    e.record_type_code   =   'AL'
        AND    e.record_status_code =   'A'
        AND    e.pref_class_year    <   '1976'
        AND    e.children_nbr       =   '0');
COMMIT;
/

/*** Remove Dups by Inserting into file 2 ***/
CREATE TABLE  a_temp_pg_pros_2                    AS
     SELECT   DISTINCT(id_number)
       FROM   a_temp_pg_pros_1;
COMMIT;
/

/*** Drop Temp Table ***/
DROP TABLE a_temp_pg_pros_1;
COMMIT;
/


/***Create Main Prospecting Table ***/
CREATE TABLE a_dw_pg_prospecting
   (id_number              VARCHAR2(10)  NOT NULL,
   record_type_code        VARCHAR2(2)   NULL,
   pref_class_year         VARCHAR2(4)   NULL,
   pref_mail_name          VARCHAR2(60)  NULL,
   pref_name_sort          VARCHAR2(60)  NULL,
   p_state_code            VARCHAR2(3)   NULL,
   p_zipcode               VARCHAR2(10)  NULL,
   p_cityline              VARCHAR2(60)  NULL,
   p_foreign_cityzip       VARCHAR2(40)  NULL,
   last_5_yr_giving        VARCHAR2(12)  NULL,
   flag_hs                 VARCHAR2(1)   NULL,
   flag_reunion            NUMBER(1)     NULL,
   total_years_giving      VARCHAR2(2)   NULL,
   flag_req_pgr            VARCHAR2(1)   NULL,
   requested_pgr           VARCHAR2(500) NULL);
COMMIT;
/

/*** Populate fields taken from a_dw_address_good ***/
INSERT INTO a_dw_pg_prospecting
    (id_number,
     record_type_code,
     pref_class_year,
     pref_mail_name,
     pref_name_sort,
     p_state_code,
     p_zipcode,
     p_cityline,
     p_foreign_cityzip)
     (SELECT a.id_number,
             a.record_type_code,
             a.pref_class_year,
             a.pref_mail_name,
             a.pref_name_sort,
             a.p_state_code,
             a.p_zipcode,
             a.p_cityline,
             a.p_foreign_cityzip
        FROM a_dw_address_good  a
       WHERE a.id_number IN
        (select id_number
           from a_temp_pg_pros_2));
COMMIT;
/

/*** Drop Temp Table ***/
DROP TABLE a_temp_pg_pros_2;
COMMIT;
/

/*** Populate Flat Heritage Society Field ***/
UPDATE a_dw_pg_prospecting
   SET flag_hs = '1'
 WHERE id_number in
    (SELECT id_number
       FROM a_dw_gift_clubs
      WHERE heritage_society = '1');

/*** Update Nulls ***/
UPDATE a_dw_pg_prospecting
   SET flag_hs      = '0'
 WHERE flag_hs      IS NULL;
COMMIT;

/*** Populate Flag_reunion Field ***/
UPDATE a_dw_pg_prospecting
   SET flag_reunion     = '1'
 WHERE record_type_code = 'AL'
   AND pref_class_year IN
    (SELECT year
       FROM a_dw_reunion_years_cfy);
       
/*** Update Nulls ***/
UPDATE a_dw_pg_prospecting
   SET flag_reunion     = '0'
 WHERE flag_reunion     IS NULL;
COMMIT;


/*** Create Temp Table to populate Total Years Giving Field ***/
/*** This isn't 100% accurate as it tracks Alumni gifts as well ***/
CREATE TABLE temp_total_years_giving
AS
(SELECT g.giving_total_id_number as id_number,
        COUNT(g.giving_total_giving_year) AS total_years_giving 
   FROM giving_total    g
 GROUP BY g.giving_total_id_number);
COMMIT;
/

/*** Populate Total Years Giving Field ***/
UPDATE a_dw_pg_prospecting      pg
   SET pg.total_years_giving =
    (SELECT g.total_years_giving
       FROM temp_total_years_giving     g
      WHERE pg.id_number            = g.id_number);
COMMIT;
/

/*** Set Nulls to Zero (0) ***/
UPDATE a_dw_pg_prospecting
   SET total_years_giving = '0'
 WHERE total_years_giving IS NULL;
COMMIT;
/

/*** Drop Temp Table ***/
DROP TABLE temp_total_years_giving;
COMMIT;

/*** Update Flag_req_pgr ***/
UPDATE  a_dw_pg_prospecting     p
   SET  p.flag_req_pgr          = '1'
 WHERE  p.id_number IN
        (SELECT id_number
           FROM activity
          WHERE activity_code = 'PGR');

/*** UPDATE NULLS ***/
UPDATE a_dw_pg_prospecting
   SET flag_req_pgr             = '0'
 WHERE flag_req_pgr             IS NULL;
COMMIT;

/*** Add Planned Giving Request Information ***/
UPDATE  a_dw_pg_prospecting     p
   SET  p.requested_pgr =
    (select a.xcomment
       from activity    a
      where p.id_number = a.id_number
        and a.activity_code = 'PGR');
COMMIT;
/

/*** Update Nulls ***/
UPDATE  a_dw_pg_prospecting p
   SET  p.requested_pgr = ' '
 WHERE  p.requested_pgr IS NULL;
COMMIT;
/


/*** Create Temp Table for Summary of Last 5 Years of Giving ***/
CREATE TABLE A_TEMP_PG_GIVING AS
    (select id_number,
            cfy_year,
            cfy_cash + cfy_joint + cfy_match as cfy_giving,
            pfy_year,
            pfy_cash + pfy_joint + pfy_match as pfy_giving,
            cfym2_year,
            cfym2_cash + cfym2_joint + cfym2_match as cfym2_giving,
            cfym3_year,
            cfym3_cash + cfym3_joint + cfym3_match as cfym3_giving,
            cfym4_year,
            cfym4_cash + cfym4_joint + cfym4_match as cfym4_giving,
            cfym5_year,
            cfym5_cash + cfym5_joint + cfym5_match as cfym5_giving           
            from a_dw_5_year_give_summ
           WHERE id_number in
            (select id_number
               from a_dw_pg_prospecting));
COMMIT;
/

/*** Populate field of last 5 years + cfy of giving summary ***/
/*** Does NOT count pledges that are outstanding ***/
UPDATE a_dw_pg_prospecting  p
   SET p.last_5_yr_giving =
    (SELECT t.cfy_giving + t.pfy_giving + t.cfym2_giving + t.cfym3_giving + t.cfym4_giving + t.cfym5_giving
       FROM a_temp_pg_giving    t
      WHERE p.id_number = t.id_number);
COMMIT;
/

/*** Drop Temp Table ***/
DROP TABLE A_TEMP_PG_GIVING;
COMMIT;
/


ANALYZE TABLE ADVANCE.a_dw_pg_prospecting COMPUTE STATISTICS;

/*******************************************************************/
/*** Need to grant these to role if user is able to access table ***/
/*******************************************************************/
GRANT ALTER  ON a_dw_pg_prospecting TO ADVROLE;
/
GRANT DELETE ON a_dw_pg_prospecting TO ADVROLE;
/
GRANT INSERT ON a_dw_pg_prospecting TO ADVROLE;
/
GRANT SELECT ON a_dw_pg_prospecting TO ADVROLE;
/
GRANT UPDATE ON a_dw_pg_prospecting TO ADVROLE;
/

/*** Update Runtimes ***/
INSERT INTO ADVANCE.a_dw_runtimes
   VALUES
      ('Finish','Create a_dw_pg_prospecting table',TO_CHAR(SYSDATE, 'YYYYMMDD:HH:MI:SS'), SYSDATE);

COMMIT;
/

EXIT;