CREATE OR REPLACE PROCEDURE ADVANCE.A_CSM_HP_PROP_QUAL_PROS
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
       pl.start_date AS ask_date,
       pl.ask_amt,
       pl.stop_date as antic_resp_date,
       pl.anticipated_amt,
       pl.proposal_title,       
       CASE
         WHEN pl.proposal_type = 'PG'
         THEN 'Planned Gift'
         WHEN pl.stage_code = 'EV'
         THEN 'Evaluation'
         WHEN pl.stage_code = 'CU'
         THEN 'Cultivation'
         ELSE 'Error'
       END as stage_desc,      
       CASE
         WHEN pl.proposal_type = 'BD'
         THEN 3
         WHEN pl.stage_code = 'S'
         THEN 1
         WHEN pl.stage_code = 'SO'
         THEN 2
         ELSE 4
       END as stage_sort,
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
   AND pl.start_date IS NOT NULL
   AND pl.stage_code NOT IN ('S','SO','ST','D','CA')
   AND pl.proposal_type IN ('BD')
   AND e.id_number IN (SELECT id_number FROM assignment WHERE assignment_type = 'PP' AND active_ind = 'Y' AND assignment_id_number = i_id_number)
ORDER BY CASE
           WHEN pl.proposal_type = 'PG'
           THEN 3
           WHEN pl.stage_code = 'EV'
           THEN 1
           WHEN pl.stage_code = 'CU'
           THEN 2
           ELSE 4
       END,
         TO_CHAR(pl.start_date,'YYYYMMDD');
END;