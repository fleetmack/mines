/*** Drop Temp Table to be created in next step ***/
DROP TABLE a_temp_scg;
COMMIT;

/*** Create Temp Table For Senior Class Gift Info ***/
CREATE TABLE a_temp_scg
AS
  SELECT p.id_number,
         p.receipt,
         p.record_type_code,
         p.date_of_record,
         p.pref_class_year,
         1 AS xsequence,
         SUM(p.total_jnt_cash) AS total_jnt_cash
    FROM a_dw_pyramid       p
   WHERE p.transaction_type = 'GF'
     AND p.person_or_org    = 'P'
     AND p.associated_code  = 'P'
     AND p.appeal_code      = 'SCG07'
GROUP BY p.id_number,
         p.receipt,
         p.record_type_code,
         p.date_of_record,
         p.pref_class_year, 
         1;
COMMIT;
/

/*** Set XSequence for Senior Clas Gift detection ***/
DECLARE
    CURSOR curs_get_sequence IS
    SELECT id_number, xsequence
      FROM a_temp_scg
  ORDER BY id_number, date_of_record, xsequence

  FOR UPDATE OF xsequence;

   i                 number := 1;
   v_id_number       a_temp_scg.id_number%type;
   v_xsequence       a_temp_scg.xsequence%type;
   v_prev_id_number  a_temp_scg.id_number%type;

   BEGIN

   OPEN curs_get_sequence; 
      LOOP 
        FETCH       curs_get_sequence 
         INTO       v_id_number, v_xsequence; 
         EXIT WHEN  curs_get_sequence%notfound;
             IF   v_id_number = v_prev_id_number THEN
                  i := i + 1;
         UPDATE   a_temp_scg
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
   SET  a.scg_xsequence       =
        (SELECT b.xsequence
           FROM a_temp_scg     b
          WHERE a.receipt       = b.receipt);
COMMIT;
/

/*** Update Nulls ***/
UPDATE  a_ack_rcpt
   SET  scg_xsequence = 0
 WHERE  scg_xsequence IS NULL;
COMMIT;
/
