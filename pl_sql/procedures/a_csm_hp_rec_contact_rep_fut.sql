CREATE OR REPLACE PROCEDURE ADVANCE.A_CSM_HP_REC_CONTACT_REP_FUT
(i_id_number         VARCHAR2,
RC1 IN OUT refcur_pkg.RC) AS
BEGIN
/*** All Individuals ***/
   OPEN RC1 FOR
SELECT e.id_number, 
       e.pref_mail_name,
       e.pref_name_sort,
       TO_CHAR(cr.contact_date,'MM/DD/YY') as contact_date,
       TO_CHAR(cr.contact_date,'YYYYMMDD') as contact_date2,
       cr.description,
       DECODE(cr.contact_outcome, 'MOVE','*',' ') as mover,
       t.full_desc as contact_type,
       t2.full_desc as purpose,
       e2.last_name as contacted_by,
       cr.report_id
  FROM entity e,
       contact_report cr,
       tms_contact_rpt_type t,
       tms_contact_rpt_purpose t2,
       entity e2
 WHERE cr.contact_type = t.contact_type
   AND cr.contact_purpose_code = t2.contact_purpose_code
   AND cr.author_id_number = e2.id_number
   AND (e.id_number = cr.id_number
    OR e.id_number = cr.id_number_2)
   AND (i_id_number IN (SELECT crc.id_number
                         FROM contact_rpt_credit crc
                        WHERE cr.report_id = crc.report_id)
    OR e.id_number IN (SELECT a.id_number 
                         FROM assignment a  
                        WHERE a.active_ind = 'Y'
                          AND a.assignment_id_number = i_id_number))
   AND TO_CHAR(cr.contact_date,'YYYYMMDD') > TO_CHAR(sysdate,'YYYYMMDD')
   AND cr.contact_initiated_by <> 'MASS'
ORDER BY TO_CHAR(cr.contact_date,'YYYYMMDD') desc;
END;