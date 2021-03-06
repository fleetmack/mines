CREATE OR REPLACE PROCEDURE         ADVANCE.CSM_MY_SCHEDULED_TASKS
(i_id_number VARCHAR2,
 RC1 IN OUT refcur_pkg.rc)

AS

/*---------------------------------------------------------------------------------------
                          MY SCHEDULED TASKS
The My Scheduled Tasks form provides a summary table of users? (person who is logged in)
scheduled tasks (entity, prospect and proposal tasks), both in the future and those that
are past due.  User has the ability to drill down on summary total rows to navigate to
the actual tasks for that particular time period (this is the same form layout as the
`This Week?s Scheduled Tasks? in 3.1.2 above).

01/12/2011      JYY(SGHE)    Creation
*/--------------------------------------------------------------------------------------


BEGIN


             OPEN RC1 FOR
             SELECT 
              t.task_code
             , tt.short_desc AS task_desc
             , ' ' AS null_identifier
             , to_char((SYSDATE),'YYYYMMDD') AS zero_date
             , to_char((SYSDATE+7),'YYYYMMDD') AS seven_date
             , to_char((SYSDATE+8),'YYYYMMDD') AS eight_date
             , to_char((SYSDATE+15),'YYYYMMDD') AS fifteen_date
             , to_char((SYSDATE+16),'YYYYMMDD') AS sixteen_date
             , to_char((SYSDATE+30),'YYYYMMDD') AS thirty_date
             , COUNT(DISTINCT CASE WHEN t.sched_date BETWEEN  TRUNC(SYSDATE) AND TRUNC(SYSDATE+7) THEN t.task_id
                          ELSE NULL END) AS zero_seven_num
             , COUNT(DISTINCT CASE WHEN t.sched_date BETWEEN TRUNC(SYSDATE+8) AND TRUNC(SYSDATE+15) THEN t.task_id
                          ELSE NULL END) AS eight_fifteen_num
             , COUNT(DISTINCT CASE WHEN t.sched_date BETWEEN TRUNC(SYSDATE+16) AND TRUNC(SYSDATE+30) THEN t.task_id
                          ELSE NULL END) AS sixteen_thirty_num
             , COUNT(DISTINCT CASE WHEN t.sched_date >= TRUNC(SYSDATE+31) THEN t.task_id
                          ELSE NULL END) AS greater_thirty_num
             , COUNT(DISTINCT CASE WHEN t.sched_date < TRUNC(SYSDATE) THEN t.task_id
                          ELSE NULL END)  AS past_due_num
             , to_char(COUNT(DISTINCT CASE WHEN t.sched_date BETWEEN  TRUNC(SYSDATE) AND TRUNC(SYSDATE+7) THEN t.task_id
                          ELSE NULL END)) AS Zero_seven --0-7
             , to_char(COUNT(DISTINCT CASE WHEN t.sched_date BETWEEN TRUNC(SYSDATE+8) AND TRUNC(SYSDATE+15) THEN t.task_id
                          ELSE NULL END))  AS eight_fifteen--8-15
             , to_char(COUNT(DISTINCT CASE WHEN t.sched_date BETWEEN TRUNC(SYSDATE+16) AND TRUNC(SYSDATE+30) THEN t.task_id
                          ELSE NULL END)) AS sixteen_thirty--16-30
             , to_char(COUNT(DISTINCT CASE WHEN t.sched_date >= TRUNC(SYSDATE+31) THEN t.task_id
                          ELSE NULL END)) AS greater_thirty-->30
             , to_char(COUNT(DISTINCT CASE WHEN t.sched_date < TRUNC(SYSDATE) THEN t.task_id
                          ELSE NULL END))  AS past_due--Past_due
            FROM advance.entity e,
                 advance.prospect_entity pe,
                 advance.prospect pt,
                 advance.proposal pl,
                 advance.task t,
                 advance.tms_task tt
           WHERE e.id_number = pe.id_number
             AND pe.prospect_id = pt.prospect_id
             AND pt.prospect_id = pl.prospect_id
             AND pl.proposal_id = t.proposal_id
             AND pl.prospect_id = t.prospect_id
             AND t.task_code = tt.task_code
             AND pt.active_ind = 'Y'
             AND pl.active_ind = 'Y'
             AND pt.prospect_type <> 'B'
             AND t.task_status_code IN ('1')
             AND t.task_code IN ('1','M','MWP','SOL')
             AND (t.source_id_number = i_id_number
              OR t.task_id IN (SELECT task_id FROM advance.task_responsible WHERE id_number = i_id_number)
              OR e.id_number IN (SELECT id_number FROM advance.assignment WHERE assignment_type = 'PP' AND active_ind = 'Y' AND assignment_id_number = i_id_number))
           GROUP BY t.task_code, tt.short_desc
            UNION
            SELECT
               'zzz' AS task_code
             , 'TOTAL ROW' AS task_desc
             , ' ' AS null_identifier
             , to_char((SYSDATE),'YYYYMMDD') AS zero_date
             , to_char((SYSDATE+7),'YYYYMMDD') AS seven_date
             , to_char((SYSDATE+8),'YYYYMMDD') AS eight_date
             , to_char((SYSDATE+15),'YYYYMMDD') AS fifteen_date
             , to_char((SYSDATE+16),'YYYYMMDD') AS sixteen_date
             , to_char((SYSDATE+30),'YYYYMMDD') AS thirty_date
             , COUNT(DISTINCT CASE WHEN t.sched_date BETWEEN  TRUNC(SYSDATE) AND TRUNC(SYSDATE+7) THEN t.task_id
                          ELSE NULL END) AS zero_seven_num
             , COUNT(DISTINCT CASE WHEN t.sched_date BETWEEN TRUNC(SYSDATE+8) AND TRUNC(SYSDATE+15) THEN t.task_id
                          ELSE NULL END) AS eight_fifteen_num
             , COUNT(DISTINCT CASE WHEN t.sched_date BETWEEN TRUNC(SYSDATE+16) AND TRUNC(SYSDATE+30) THEN t.task_id
                          ELSE NULL END) AS sixteen_thirty_num
             , COUNT(DISTINCT CASE WHEN t.sched_date >= TRUNC(SYSDATE+31) THEN t.task_id
                          ELSE NULL END) AS greater_thirty_num
             , COUNT(DISTINCT CASE WHEN t.sched_date < TRUNC(SYSDATE) THEN t.task_id
                          ELSE NULL END) AS past_due_num
             , '<a href="'
                   || adv_declarations.c_hyperlink
                   || '?type=SCHED_TSK&key1='
                   || to_char((SYSDATE),'YYYYMMDD')
                   || '&key2='
                   || to_char((SYSDATE+7),'YYYYMMDD')
                   || '">'
                   || to_char(COUNT(DISTINCT CASE WHEN t.sched_date BETWEEN  TRUNC(SYSDATE) AND TRUNC(SYSDATE+7) THEN t.task_id
                                 ELSE NULL END) )
                   || ' </a>' AS Zero_seven --0-7
             , '<a href="'
                   || adv_declarations.c_hyperlink
                   || '?type=SCHED_TSK&key1='
                   || to_char((SYSDATE+8),'YYYYMMDD')
                   || '&key2='
                   || to_char((SYSDATE+15),'YYYYMMDD')
                   || '">'
                   || to_char(COUNT(DISTINCT CASE WHEN t.sched_date BETWEEN TRUNC(SYSDATE+8) AND TRUNC(SYSDATE+15) THEN t.task_id
                                 ELSE NULL END))
                   || ' </a>' AS eight_fifteen--8-15
             , '<a href="'
                   || adv_declarations.c_hyperlink
                   || '?type=SCHED_TSK&key1='
                   || to_char((SYSDATE+16),'YYYYMMDD')
                   || '&key2='
                   || to_char((SYSDATE+30),'YYYYMMDD')
                   || '">'
                   || to_char(COUNT(DISTINCT CASE WHEN t.sched_date BETWEEN TRUNC(SYSDATE+16) AND TRUNC(SYSDATE+30) THEN t.task_id
                                         ELSE NULL END))
                   || ' </a>' AS sixteen_thirty--16-30
             , '<a href="'
                   || adv_declarations.c_hyperlink
                   || '?type=SCHED_TSK&key1='
                   || to_char('GT31')
                   || '&key2='
                   || to_char((SYSDATE+31),'YYYYMMDD')
                   || '">'
                   || to_char(COUNT(DISTINCT CASE WHEN t.sched_date >= TRUNC(SYSDATE+31) THEN t.task_id
                                         ELSE NULL END))
                   || ' </a>' AS greater_thirty-->30
             , '<a href="'
                   || adv_declarations.c_hyperlink
                   || '?type=SCHED_TSK&key1='
                   || to_char((SYSDATE),'YYYYMMDD')
                   || '&key2='
                   || to_char('PD')
                   || '">'
                   || to_char(COUNT(DISTINCT CASE WHEN t.sched_date < TRUNC(SYSDATE) THEN t.task_id
                                         ELSE NULL END))
                   || ' </a>' AS past_due--Past_due
            FROM advance.entity e,
                 advance.prospect_entity pe,
                 advance.prospect pt,
                 advance.proposal pl,
                 advance.task t,
                 advance.tms_task tt
           WHERE e.id_number = pe.id_number
             AND pe.prospect_id = pt.prospect_id
             AND pt.prospect_id = pl.prospect_id
             AND pl.proposal_id = t.proposal_id
             AND pl.prospect_id = t.prospect_id
             AND t.task_code = tt.task_code
             AND pt.active_ind = 'Y'
             AND pl.active_ind = 'Y'
             AND pt.prospect_type <> 'B'
             AND t.task_status_code IN ('1')
             AND t.task_code IN ('1','M','MWP','SOL')
             AND (t.source_id_number = i_id_number
              OR t.task_id IN (SELECT task_id FROM advance.task_responsible WHERE id_number = i_id_number)
              OR e.id_number IN (SELECT id_number FROM advance.assignment WHERE assignment_type = 'PP' AND active_ind = 'Y' AND assignment_id_number = i_id_number))
             ;


END csm_my_scheduled_tasks;
