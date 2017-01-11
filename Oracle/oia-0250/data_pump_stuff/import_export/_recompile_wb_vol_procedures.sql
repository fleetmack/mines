/********************************/
/********************************/
/*** Recompiles Wb Procedures ***/
/********************************/
/********************************/

/*** Update Runtimes ***/
INSERT INTO ADVANCE.a_dw_runtimes
   VALUES
      ('Start','Recompile a_wb_vol procedures',TO_CHAR(SYSDATE, 'YYYYMMDD:HH:MI:SS'), SYSDATE);

COMMIT;
/

/*************************************************************/
/*** Recompile Stored Procedures Since they   		   ***/
/*** are Invalidated after a_wb_volunteer Table is Created ***/
/*************************************************************/


/*************************/
/*** Volunteer Updates ***/
/*************************/
ALTER PROCEDURE ADVANCE.A_WB_VOL_GIFT COMPILE;
/


/*** Update Runtimes ***/
INSERT INTO ADVANCE.a_dw_runtimes
   VALUES
      ('Finish','Recompile a_wb_vol procedures',TO_CHAR(SYSDATE, 'YYYYMMDD:HH:MI:SS'), SYSDATE);
/

COMMIT;

EXIT;
