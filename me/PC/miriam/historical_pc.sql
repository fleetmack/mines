/*************** Creates Historical PC Data dating back until 1984 *****************/
/*** Young Alum wasn't created until late 90's, so that isn't a variable in this ***/

DROP TABLE a_dw_gift_clubs_pc;
COMMIT;
/

CREATE TABLE a_dw_gift_clubs_pc
    (
    id_number               VARCHAR2(10) NOT NULL,
    record_type_code        VARCHAR2(2)  NULL,
    pref_class_year         VARCHAR2(4)  NULL,
    pref_mail_name          VARCHAR2(60) NULL,
    pref_name_sort          VARCHAR2(60) NULL,
    cityline                VARCHAR2(60) NULL,
    total_years_pc          NUMBER(3)    NULL,
    consecutive_pc          NUMBER(3)    NULL,
    pc84                    NUMBER(1)    NULL,
    pc85                    NUMBER(1)    NULL,
    pc86                    NUMBER(1)    NULL,
    pc87                    NUMBER(1)    NULL,
    pc88                    NUMBER(1)    NULL,
    pc89                    NUMBER(1)    NULL,
    pc90                    NUMBER(1)    NULL,
    pc91                    NUMBER(1)    NULL,
    pc92                    NUMBER(1)    NULL,
    pc93                    NUMBER(1)    NULL,
    pc94                    NUMBER(1)    NULL,
    pc95                    NUMBER(1)    NULL,
    pc96                    NUMBER(1)    NULL,
    pc97                    NUMBER(1)    NULL,
    pc98                    NUMBER(1)    NULL,
    pc99                    NUMBER(1)    NULL,
    pc00                    NUMBER(1)    NULL,
    pc01                    NUMBER(1)    NULL,
    pc02                    NUMBER(1)    NULL,
    pc03                    NUMBER(1)    NULL,
    pc04                    NUMBER(1)    NULL,
    pc05                    NUMBER(1)    NULL
    );
COMMIT;
/

INSERT INTO a_dw_gift_clubs_pc
            (
            id_number,
            record_type_code,
            pref_class_year,
            pref_mail_name,
            pref_name_sort,
            pc92,
            pc93,
            pc94,
            pc95,
            pc96,
            pc97,
            pc98,
            pc99,
            pc00,
            pc01,
            pc02,
            pc03,
            pc04)
 (SELECT    id_number,
            record_type_code,
            pref_class_year,
            pref_mail_name,
            pref_name_sort,
            pc92,
            pc93,
            pc94,
            pc95,
            pc96,
            pc97,
            pc98,
            pc99,
            pc00,
            pc01,
            pc02,
            pc03,
            pc04
    FROM    a_dw_gift_clubs          g
   WHERE    g.pc92 = '1'
      OR    g.pc93 = '1'
      OR    g.pc94 = '1'
      OR    g.pc95 = '1'
      OR    g.pc96 = '1'
      OR    g.pc97 = '1'
      OR    g.pc98 = '1'
      OR    g.pc99 = '1'
      OR    g.pc00 = '1'
      OR    g.pc01 = '1'
      OR    g.pc02 = '1'
      OR    g.pc03 = '1'
      OR    g.pc04 = '1');
COMMIT;
/

/*** Insert Cityline ***/
UPDATE a_dw_gift_clubs_pc       g1
   SET g1.CITYLINE =
        (SELECT a.p_cityline
           FROM a_dw_address_good   a
          WHERE a.id_number(+) = g1.id_number);
COMMIT;
/

/*** Update Nulls ***/
UPDATE a_dw_gift_clubs_pc
   SET cityline = ' '
 WHERE cityline IS NULL;
COMMIT;
/    
    
/*** Update Nulls for FY05 as we're still in FY04 ***/
UPDATE      a_dw_gift_clubs_pc
   SET      pc05         =  '0';
COMMIT;
/

/*** Update PC84 Field ***/
UPDATE a_dw_gift_clubs_pc
   SET pc84 = '1'
 WHERE id_number IN
    (SELECT id_number
       FROM a_dw_pyramid
      WHERE date_of_record BETWEEN '19830701' AND '19840630'
        AND flag_alumni = '0'
            GROUP BY id_number
            HAVING SUM(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint) >= 1000);
COMMIT;
/

/*** Update Nulls ***/
UPDATE a_dw_gift_clubs_pc
   SET pc84 = '0'
 WHERE pc84 IS NULL;
COMMIT;
/

/*** Update PC85 Field ***/
UPDATE a_dw_gift_clubs_pc
   SET pc85 = '1'
 WHERE id_number IN
    (SELECT id_number
       FROM a_dw_pyramid
      WHERE date_of_record BETWEEN '19840701' AND '19850630'
        AND flag_alumni = '0'
            GROUP BY id_number
            HAVING SUM(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint) >= 1000);
COMMIT;
/

/*** Update Nulls ***/
UPDATE a_dw_gift_clubs_pc
   SET pc85 = '0'
 WHERE pc85 IS NULL;
COMMIT;
/

/*** Update PC86 Field ***/
UPDATE a_dw_gift_clubs_pc
   SET pc86 = '1'
 WHERE id_number IN
    (SELECT id_number
       FROM a_dw_pyramid
      WHERE date_of_record BETWEEN '19850701' AND '19860630'
        AND flag_alumni = '0'
            GROUP BY id_number
            HAVING SUM(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint) >= 1000);
COMMIT;
/

/*** Update Nulls ***/
UPDATE a_dw_gift_clubs_pc
   SET pc86 = '0'
 WHERE pc86 IS NULL;
COMMIT;
/

/*** Update PC87 Field ***/
UPDATE a_dw_gift_clubs_pc
   SET pc87 = '1'
 WHERE id_number IN
    (SELECT id_number
       FROM a_dw_pyramid
      WHERE date_of_record BETWEEN '19860701' AND '19870630'
        AND flag_alumni = '0'
            GROUP BY id_number
            HAVING SUM(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint) >= 1000);
COMMIT;
/

/*** Update Nulls ***/
UPDATE a_dw_gift_clubs_pc
   SET pc87 = '0'
 WHERE pc87 IS NULL;
COMMIT;
/

/*** Update PC88 Field ***/
UPDATE a_dw_gift_clubs_pc
   SET pc88 = '1'
 WHERE id_number IN
    (SELECT id_number
       FROM a_dw_pyramid
      WHERE date_of_record BETWEEN '19870701' AND '19880630'
        AND flag_alumni = '0'
            GROUP BY id_number
            HAVING SUM(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint) >= 1000);
COMMIT;
/

/*** Update Nulls ***/
UPDATE a_dw_gift_clubs_pc
   SET pc88 = '0'
 WHERE pc88 IS NULL;
COMMIT;
/

/*** Update PC89 Field ***/
UPDATE a_dw_gift_clubs_pc
   SET pc89 = '1'
 WHERE id_number IN
    (SELECT id_number
       FROM a_dw_pyramid
      WHERE date_of_record BETWEEN '19880701' AND '19890630'
        AND flag_alumni = '0'
            GROUP BY id_number
            HAVING SUM(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint) >= 1000);
COMMIT;
/

/*** Update Nulls ***/
UPDATE a_dw_gift_clubs_pc
   SET pc89 = '0'
 WHERE pc89 IS NULL;
COMMIT;
/

/*** Update PC90 Field ***/
UPDATE a_dw_gift_clubs_pc
   SET pc90 = '1'
 WHERE id_number IN
    (SELECT id_number
       FROM a_dw_pyramid
      WHERE date_of_record BETWEEN '19890701' AND '19900630'
        AND flag_alumni = '0'
            GROUP BY id_number
            HAVING SUM(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint) >= 1000);
COMMIT;
/

/*** Update Nulls ***/
UPDATE a_dw_gift_clubs_pc
   SET pc90 = '0'
 WHERE pc90 IS NULL;
COMMIT;
/

/*** Update PC91 Field ***/
UPDATE a_dw_gift_clubs_pc
   SET pc91 = '1'
 WHERE id_number IN
    (SELECT id_number
       FROM a_dw_pyramid
      WHERE date_of_record BETWEEN '19900701' AND '19910630'
        AND flag_alumni = '0'
            GROUP BY id_number
            HAVING SUM(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint) >= 1000);
COMMIT;
/

/*** Update Nulls ***/
UPDATE a_dw_gift_clubs_pc
   SET pc91 = '0'
 WHERE pc91 IS NULL;
COMMIT;
/


/*** Update Total Years PC Field ***/
/*** Only valid through 1992 - could be longer ***/
/*** Keep this code AFTER the calculations for 1984 and beyond ***/
UPDATE      a_dw_gift_clubs_pc
   SET      total_years_pc = (pc84 +
                              pc85 +
                              pc86 +
                              pc87 +
                              pc88 +
                              pc89 +
                              pc90 +
                              pc91 +
                              pc92 +
                              pc93 +
                              pc94 +
                              pc95 +
                              pc96 +
                              pc97 +
                              pc98 +
                              pc99 +
                              pc00 +
                              pc01 +
                              pc02 +
                              pc03 +
                              pc04 +
                              pc05);
COMMIT;
/


/**************************************/
/*** Determine Consecutive Years PC ***/
/**************************************/

DECLARE 
m_count_years   NUMBER(2)   := 0;
m_fiscal_year   NUMBER(1)   ;

v_pc03          NUMBER(1)   ;
v_pc04          NUMBER(1)   ;
v_pc02          NUMBER(1)   ;
v_pc01          NUMBER(1)   ;
v_pc00          NUMBER(1)   ;
v_pc99          NUMBER(1)   ;
v_pc98          NUMBER(1)   ; 
v_pc97          NUMBER(1)   ; 
v_pc96          NUMBER(1)   ; 
v_pc95          NUMBER(1)   ; 
v_pc94          NUMBER(1)   ; 
v_pc93          NUMBER(1)   ; 
v_pc92          NUMBER(1)   ;
v_pc91          NUMBER(1)   ;
v_pc90          NUMBER(1)   ;
v_pc89          NUMBER(1)   ;
v_pc88          NUMBER(1)   ;
v_pc87          NUMBER(1)   ;
v_pc86          NUMBER(1)   ;
v_pc85          NUMBER(1)   ;
v_pc84          NUMBER(1)   ;

v_id_number     VARCHAR2(10);

/*** Open Cursor ***/
   
   CURSOR   c_pc_id_number       IS
     SELECT pc2.id_number, pc2.pc04, pc2.pc03, pc2.pc02, pc2.pc01, pc2.pc00, pc2.pc99, 
            pc2.pc98, pc2.pc97, pc2.pc96, pc2.pc95, pc2.pc94, pc2.pc93, pc2.pc92, pc2.pc91,
            pc2.pc90, pc2.pc89, pc2.pc88, pc2.pc87, pc2.pc86, pc2.pc85, pc2.pc84
     FROM   a_dw_gift_clubs_pc      pc2;

   BEGIN
      OPEN c_pc_id_number; 

/*** Open Cursor Loop ***/
      LOOP

         FETCH c_pc_id_number INTO v_id_number, v_pc04, v_pc03, v_pc02, v_pc01, v_pc00, v_pc99, 
                                   v_pc98, v_pc97, v_pc96, v_pc95, v_pc94, v_pc93, v_pc92, v_pc91, v_pc90,
                                   v_pc89, v_pc88, v_pc87, v_pc86, v_pc85, v_pc84;
         EXIT WHEN c_pc_id_number%NOTFOUND;

/*** Open Counter and Update Loop ***/
           
           BEGIN
           LOOP

               /*** Reset Count ***/
               m_count_years    := 0;
           
               
               /*** Fiscal 2004 ***/
               IF v_pc04 = 1    THEN
                 m_count_years  := m_count_years + 1;
               END IF;
               
               /*** Fiscal 2003 ***/
               IF v_pc03 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE
                 EXIT;
               END IF;
               
               /*** Fiscal 2002 ***/
               IF v_pc02 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE
                 EXIT;
               END IF;
               
               /*** Fiscal 2001 ***/
               IF v_pc01 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE
                 EXIT;
               END IF;
               
               /*** Fiscal 2000 ***/
               IF v_pc00 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;

               /*** Fiscal 1999 ***/
               IF v_pc99 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;

               /*** Fiscal 1998 ***/
               IF v_pc98 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;

               /*** Fiscal 1997 ***/
               IF v_pc97 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;

               /*** Fiscal 1996 ***/
               IF v_pc96 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;


               /*** Fiscal 1995 ***/
               IF v_pc95 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;

               /*** Fiscal 1994 ***/
               IF v_pc94 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;

               /*** Fiscal 1993 ***/
               IF v_pc93 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;

               /*** Fiscal 1992 ***/
               IF v_pc92 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;
               
               /*** Fiscal 1991 ***/
               IF v_pc91 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;
               
               /*** Fiscal 1990 ***/
               IF v_pc90 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;
               
               /*** Fiscal 1989 ***/
               IF v_pc89 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;
               
               /*** Fiscal 1988 ***/
               IF v_pc88 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;
               
               /*** Fiscal 1987 ***/
               IF v_pc87 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;
               
               /*** Fiscal 1986 ***/
               IF v_pc86 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;
               
               /*** Fiscal 1985 ***/
               IF v_pc85 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;
               
               /*** Fiscal 1984 ***/
               IF v_pc84 = 1    THEN
                 m_count_years  := m_count_years + 1;
               ELSE      
                 EXIT;  
               END IF;

               /*** Exit loop ***/
               EXIT;
            END LOOP;

            /*** Update the consecutive years field ***/
            UPDATE   a_dw_gift_clubs_pc   pc
               SET   pc.consecutive_pc   = m_count_years
               WHERE pc.id_number        = v_id_number;
            END;
      END LOOP;

      /*** Close cursor ***/
      CLOSE c_pc_id_number;

   COMMIT;

END;
/