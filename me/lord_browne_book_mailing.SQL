/***creates temp table with pc 02 and pc 03 donors ***/
create table a_temp_browne as
 SELECT ID_Number
 FROM a_dw_gift_clubs
 WHERE record_status_code = 'A' 
   AND (pc02 = 1
    OR pc03 = 1);
COMMIT;
/


/***adds century society members to this temp table -- includes duplicates ***/
INSERT INTO a_temp_browne (id_number)
SELECT id_number 
  FROM a_dw_gift_clubs
 WHERE flag_cs = 1
   AND record_status_code = 'A';
COMMIT;
/


/*** adds heritage members to temp table ***/
INSERT INTO a_temp_browne (id_number)
SELECT id_number
  FROM a_dw_gift_clubs
 WHERE heritage_society = 1
   AND record_status_code = 'A';
COMMIT;
/


/***reunion committee volunteers***/
INSERT INTO a_temp_browne (id_number)
SELECT id_number 
  FROM committee
 WHERE committee_code = 'RGP'
   AND committee_status_code = 'A';
COMMIT;
/

/***pc committee volunteers***/
INSERT INTO a_temp_browne (id_number)
   SELECT id_number
  FROM committee
 WHERE committee_code IN ('PCVDE','PCVH','PCVNT','PCVO','PCVSC')
   AND committee_status_code = 'A';
COMMIT;
/


/*** shows # of entities in temp table ***/
select count(id_number) from a_temp_browne



/*** Drops Temp Table ***/
drop table a_temp_browne;
commit;
/

