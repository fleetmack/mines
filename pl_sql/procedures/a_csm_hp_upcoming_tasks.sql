CREATE OR REPLACE PROCEDURE ADVANCE.A_CSM_HP_UPCOMING_TASKS
(i_id_number         VARCHAR2,
RC1 IN OUT refcur_pkg.RC) AS
BEGIN
/*** All Individuals ***/
   OPEN RC1 FOR
   SELECT e.id_number, 
       e.pref_mail_name, 
       pe.primary_ind as prospect_primary_ind,
       tt.adv_very_short_desc as full_desc,
--       to_char(t.sched_date,'Mon DD, YYYY') as sched_date_char, 
       CASE
         WHEN to_char(t.sched_date,'YYYYMMDD') < to_char(sysdate,'YYYYMMDD')
         THEN '<font color="red">'||to_char(t.sched_date,'MM/DD/YY')||'</font>'
         ELSE to_char(t.sched_date,'MM/DD/YY')
       END as sched_date_char, 
       CASE
         WHEN to_char(t.sched_date,'YYYYMMDD') < to_char(sysdate,'YYYYMMDD')
         THEN 1
         ELSE 0
       END as overdue, 
       CASE
         WHEN t.task_id IN (SELECT task_id FROM task_responsible GROUP BY task_id HAVING COUNT(task_id) > 1)
         THEN 'Multiple Resp'
         ELSE (SELECT e.last_name FROM entity e, task_responsible tr WHERE e.id_number = tr.id_number AND t.task_id = tr.task_id)
       END as responsible,
       t.task_description, 
       t.sched_date, 
       t.task_id,
       pl.prospect_id,
       pl.proposal_id
  FROM entity e,
       prospect_entity pe,
       prospect pt,
       proposal pl,
       task t,
       tms_task tt
 WHERE e.id_number = pe.id_number
   AND pe.prospect_id = pt.prospect_id
   AND pt.prospect_id = pl.prospect_id
   AND pl.proposal_id = t.proposal_id
   AND t.task_code = tt.task_code
   AND pt.active_ind = 'Y'
   AND pl.active_ind = 'Y'
   AND pt.prospect_type <> 'B'
   AND t.task_status_code IN ('1')
   AND to_char(t.sched_date,'YYYYMMDD') < to_char(sysdate+90,'YYYYMMDD')
   AND (t.source_id_number = i_id_number
    OR t.task_id IN (SELECT task_id FROM task_responsible WHERE id_number = i_id_number)
    OR e.id_number IN (SELECT id_number FROM assignment WHERE assignment_type = 'PP' AND active_ind = 'Y' AND assignment_id_number = i_id_number))
ORDER BY t.sched_date ;
END;