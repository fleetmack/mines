CREATE OR REPLACE PROCEDURE ADVANCE.A_CSM_HP_PROP_INIT_PROS
(i_id_number         VARCHAR2,
RC1 IN OUT refcur_pkg.RC) AS
BEGIN
/*** All Individuals ***/
   OPEN RC1 FOR
SELECT e.id_number, 
       e.pref_mail_name,
       pe.primary_ind as prospect_primary_ind, 
       pt.prospect_type,
       pl.proposal_type,
       pl.stage_code,
       CASE
         WHEN to_char(pl.initial_contribution_date,'YYYYMMDD') < to_char(sysdate,'YYYYMMDD')
         THEN '<font color="red">'||to_char(pl.initial_contribution_date,'Mon DD, YYYY')||'</font>'
         ELSE to_char(pl.initial_contribution_date,'Mon DD, YYYY')
       END as qualify_date, 
       to_char(pl.initial_contribution_date,'YYYYMMDD') as qualify_date_char,
       pl.prospect_id,
       pl.proposal_id
  FROM entity e,
       prospect_entity pe,
       prospect pt,
       proposal pl
 WHERE e.id_number = pe.id_number
   AND pe.prospect_id = pt.prospect_id
   AND pt.prospect_id = pl.prospect_id
   AND pt.active_ind = 'Y'
   AND pl.active_ind = 'Y'
   AND pt.prospect_type <> 'B'
   AND pl.start_date IS NULL
   AND pl.initial_contribution_date IS NOT NULL
   AND e.id_number IN (SELECT id_number FROM assignment WHERE assignment_type = 'PP' AND active_ind = 'Y' AND assignment_id_number = i_id_number)
   ORDER BY TO_CHAR(pl.initial_contribution_date,'YYYYMMDD');
END;