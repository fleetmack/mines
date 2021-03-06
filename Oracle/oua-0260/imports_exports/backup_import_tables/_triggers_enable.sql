/******************************************/
/******************************************/
/*** Enables All Triggers Before Import ***/
/******************************************/
/******************************************/
SPOOL d:\imports_exports\log_backup_import_tables\_triggers_enable.log;

/*** Need to Enable Constraints ***/
ALTER TABLE ADVANCE.DONOR_TOTALS ENABLE CONSTRAINT DONOR_TOTALS_FK1
/
ALTER TABLE ADVANCE.EP_ZL_COLUMN ENABLE CONSTRAINT EP_FK_ZL_TABLE_COLUMN
/
ALTER TABLE ADVANCE.EP_ZL_FROM ENABLE CONSTRAINT EP_FK_ZL_SELECT_FROM
/
ALTER TABLE ADVANCE.EP_ZL_FROM ENABLE CONSTRAINT EP_FK_ZL_TABLE_FROM
/
ALTER TABLE ADVANCE.EP_ZL_JOIN ENABLE CONSTRAINT EP_FK_ZL_COLUMN_JOIN
/
ALTER TABLE ADVANCE.EP_ZL_JOIN ENABLE CONSTRAINT EP_FK_ZL_COLUMN_JOIN_2
/
ALTER TABLE ADVANCE.EP_ZL_JOIN ENABLE CONSTRAINT EP_FK_ZL_SELECT_JOIN
/
ALTER TABLE ADVANCE.EP_ZL_JOIN_REPLACEMENT ENABLE CONSTRAINT EP_FK_ZL_JOIN_JOIN_REPLACE_FRO
/
ALTER TABLE ADVANCE.EP_ZL_JOIN_REPLACEMENT ENABLE CONSTRAINT EP_FK_ZL_JOIN_JOIN_REPLACE_TO
/
ALTER TABLE ADVANCE.EP_ZL_JOIN_REPLACEMENT ENABLE CONSTRAINT EP_FK_ZL_OUT_JOIN_REPLACE
/
ALTER TABLE ADVANCE.EP_ZL_JOIN_REPLACEMENT ENABLE CONSTRAINT EP_ZL_OUT_JOIN_REPLACE_ACT
/
ALTER TABLE ADVANCE.EP_ZL_JOIN_REPLACEMENT_SELECT ENABLE CONSTRAINT EP_FK_ZL_JOIN_REPLACE_SEL_J
/
ALTER TABLE ADVANCE.EP_ZL_JOIN_REPLACEMENT_SELECT ENABLE CONSTRAINT EP_FK_ZL_JOIN_REPLACE_SEL_JR
/
ALTER TABLE ADVANCE.EP_ZL_JOIN_REPLACEMENT_SELECT ENABLE CONSTRAINT EP_FK_ZL_JOIN_REPLACE_SEL_PS
/
ALTER TABLE ADVANCE.EP_ZL_JOIN_REPLACEMENT_SELECT ENABLE CONSTRAINT EP_ZL_JOIN_REPLACE_SEL_AS
/
ALTER TABLE ADVANCE.EP_ZL_OUTPUT_TYPE ENABLE CONSTRAINT EP_ZL_SELECT_OUTPUT_TYPE
/
ALTER TABLE ADVANCE.EP_ZL_OUTPUT_TYPE_SELECT ENABLE CONSTRAINT EP_FK_ZL_OUTPUT_TYPE_SELECT
/
ALTER TABLE ADVANCE.EP_ZL_OUTPUT_TYPE_SELECT ENABLE CONSTRAINT EP_FK_ZL_SELECT_OUT_TYPE_SELEC
/
ALTER TABLE ADVANCE.EP_ZL_RESULT_SET ENABLE CONSTRAINT EP_FK_ZL_COLUMN_RESULT_SET
/
ALTER TABLE ADVANCE.EP_ZL_RESULT_SET ENABLE CONSTRAINT EP_FK_ZL_SELECT_RESULT_SET
/
ALTER TABLE ADVANCE.EP_ZL_RESULT_SET_REPLACEMENT ENABLE CONSTRAINT EP_FK_ZL_OUTPUT_TYPE_REPLACE
/
ALTER TABLE ADVANCE.EP_ZL_RESULT_SET_REPLACEMENT ENABLE CONSTRAINT EP_FK_ZL_RESULT_REPLACE_FROM
/
ALTER TABLE ADVANCE.EP_ZL_RESULT_SET_REPLACEMENT ENABLE CONSTRAINT EP_FK_ZL_RESULT_REPLACE_TO
/
ALTER TABLE ADVANCE.EP_ZL_RESULT_SET_REPLACEMENT ENABLE CONSTRAINT EP_ZL_OUTPUT_TYPE_REPLACE_ACT
/
ALTER TABLE ADVANCE.EP_ZL_SELECT_RESTRICTION ENABLE CONSTRAINT EP_FK_ZL_SELECT_SELECT_REST
/
ALTER TABLE ADVANCE.EP_ZL_SELECT_RESTRICTION ENABLE CONSTRAINT EP_FK_ZL_SELECT_SELECT_REST2
/
ALTER TABLE ADVANCE.EP_ZL_SELECT_RESTRICTION ENABLE CONSTRAINT EP_FK_ZL_SEL_ZL_OUT_TYPE
/
ALTER TABLE ADVANCE.EP_ZL_SELECT_UNION ENABLE CONSTRAINT EP_FK_ZL_SELECT_SELECT_UNION
/
ALTER TABLE ADVANCE.EP_ZL_SELECT_UNION ENABLE CONSTRAINT EP_FK_ZL_SELECT_SELECT_UNION2
/
ALTER TABLE ADVANCE.WWW_PAGE_COMPONENT ENABLE CONSTRAINT FK_WWW_PAGE_COMPONENT_WWW_COMP
/
ALTER TABLE ADVANCE.ZZ_DT_CL_CODE ENABLE CONSTRAINT ZZ_DT_CODE_FK1
/
ALTER TABLE ADVANCE.ZZ_DT_COL ENABLE CONSTRAINT ZZ_DT_COL_FK2
/
ALTER TABLE ADVANCE.ZZ_DT_COL ENABLE CONSTRAINT ZZ_DT_COL_FK3
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK1
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK2
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK3
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK4
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK5
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK6
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK7
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK8
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK9
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK10
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK11
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK12
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK13
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK14
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK15
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK16
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER ENABLE CONSTRAINT ZZ_DT_HEADER_FK17
/
ALTER TABLE ADVANCE.ZZ_DT_HEADER_COL ENABLE CONSTRAINT ZZ_DT_HEADER_COL_FK1
/
ALTER TABLE ADVANCE.WWW_COMPONENT ENABLE CONSTRAINT CKC_ACTIVE_IND_WWW_COMP
/
ALTER TABLE ADVANCE.WWW_DW ENABLE CONSTRAINT CKC_ACTIVE_IND_WWW_DW
/
ALTER TABLE ADVANCE.WWW_PAGE ENABLE CONSTRAINT CKC_ACTIVE_IND_WWW_PAGE
/
ALTER TABLE ADVANCE.WWW_PAGE ENABLE CONSTRAINT CKC_LOGON_REQ_IND_WWW_PAGE
/
/*** Enable Triggers ***/

ALTER TRIGGER ADVANCE.t_appeals ENABLE;

ALTER TRIGGER ADVANCE.t_memb_appeals ENABLE;

ALTER TRIGGER ADVANCE.t_name ENABLE;

COMMIT;
/

EXIT;