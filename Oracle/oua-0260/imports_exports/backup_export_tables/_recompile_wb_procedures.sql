/********************************/
/********************************/
/*** Recompiles Wb Procedures ***/
/********************************/
/********************************/

/*** Update Runtimes ***/
INSERT INTO ADVANCE.a_dw_runtimes
   VALUES
      ('Start','Recompile a_wb procedures',TO_CHAR(SYSDATE, 'YYYYMMDD:HH:MI:SS'), SYSDATE);

COMMIT;
/

/***************************************************/
/*** Recompile Stored Procedures Since they      ***/
/*** are Invalidated after a_wb Table is Dropped ***/
/***************************************************/

/***********************************/
/*** Alumni Directory Procedures ***/
/***********************************/
ALTER PROCEDURE ADVANCE.A_WB_DIR_COUNTRY COMPILE;
/
ALTER PROCEDURE ADVANCE.A_WB_DIR_MAIDEN_NAME COMPILE;
/
ALTER PROCEDURE ADVANCE.A_WB_DIR_NAME_CITY COMPILE;
/
ALTER PROCEDURE ADVANCE.A_WB_DIR_NAME_COUNTRY COMPILE;
/
ALTER PROCEDURE ADVANCE.A_WB_DIR_NAME_EXACT COMPILE;
/
ALTER PROCEDURE ADVANCE.A_WB_DIR_NAME_PARTIAL COMPILE;
/
ALTER PROCEDURE ADVANCE.A_WB_DIR_NAME_YEAR COMPILE;
/
ALTER PROCEDURE ADVANCE.A_WB_DIR_PREF_YEAR COMPILE;
/
ALTER PROCEDURE ADVANCE.A_WB_DIR_COMPANY_PARTIAL COMPILE;
/

/*******************/
/*** Lost Alumni ***/
/*******************/
ALTER PROCEDURE ADVANCE.A_WB_LOST_YEAR COMPILE;
/

/*************************/
/*** Volunteer Updates ***/
/*************************/
ALTER PROCEDURE ADVANCE.A_WB_VOL_ADDR COMPILE;
/

ALTER PROCEDURE ADVANCE.A_WB_VOL_GIFT COMPILE;
/

ALTER PROCEDURE ADVANCE.A_WB_VOL_GIFT2 COMPILE;
/

ALTER PROCEDURE ADVANCE.A_WB_VOL_GIFT_SUMM COMPILE;
/

ALTER PROCEDURE ADVANCE.A_WB_VOL_GIFT_SUMM_REUN COMPILE;
/

/*** Update Runtimes ***/
INSERT INTO ADVANCE.a_dw_runtimes
   VALUES
      ('Finish','Recompile a_wb procedures',TO_CHAR(SYSDATE, 'YYYYMMDD:HH:MI:SS'), SYSDATE);
/

COMMIT;

EXIT;
