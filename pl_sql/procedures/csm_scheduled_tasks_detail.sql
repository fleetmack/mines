CREATE OR REPLACE PROCEDURE         ADVANCE.CSM_SCHEDULED_TASKS_DETAIL
(i_id_number VARCHAR2,
 i_start_date VARCHAR2,
 i_end_date VARCHAR2,
 i_task_code VARCHAR2,
 RC1 IN OUT refcur_pkg.rc)

AS

/*---------------------------------------------------------------------------------------
                          MY SCHEDULED TASKS
The My Scheduled Tasks form provides a summary table of users? (person who is logged in)
scheduled tasks (entity, prospect and proposal tasks), both in the future and those that
are past due.  User has the ability to drill down on summary total rows to navigate to
the actual tasks for that particular time period (this is the same form layout as the
`This Week?s Scheduled Tasks? in 3.1.2 above).

01/20/2011      JYY(SGHE)    Creation

*/--------------------------------------------------------------------------------------

  v_date_count   NUMBER(5) := 0;
  v_gt31         VARCHAR2(5) := 'GT31';
  v_past_due     VARCHAR2(5) := 'PD';

BEGIN




  IF length(i_start_date) = 8 AND length(i_end_date) = 8 THEN

      v_date_count := to_date(i_start_date,'YYYYMMDD') - SYSDATE;

        OPEN RC1 FOR
        SELECT DISTINCT
                d.task_id
               ,task_desc
               ,d.task_description
               ,d.task_status_code
               ,d.active_ind
               ,d.task_priority_code
               ,d.sched_date
               ,task_name
               ,d.id_number
               ,d.prospect_id
               ,d.program_code
               ,d.program_year
               ,d.proposal_id
               ,d.report_id
               ,d.allocation_code
               ,d.committee_code
               ,d.contract_grant_id
               ,d.event_id
               ,fk
               ,union_type
               , CASE WHEN to_char(v_date_count) = '0' THEN 'Tasks 0 to 7 days'
                      WHEN to_char(v_date_count) = '7' THEN 'Tasks 8 to 15 days'
                      WHEN to_char(v_date_count) = '15' THEN 'Tasks 16 to 30 days'
                      ELSE ' ' END AS header
        FROM
            (
            SELECT DISTINCT
                    task.task_id
                   ,NVL(tms_task.short_desc, ' ') AS task_desc
                   ,task.task_description
                   ,task.task_status_code
                   ,tms_task_status.active_ind
                   ,task.task_priority_code
                   ,task.sched_date
                   ,CASE WHEN NOT task.prospect_id IS NULL AND task.prospect_id > 0 THEN
                             prospect.prospect_name
                         ELSE entity.pref_mail_name
                         END AS task_name
                   ,task.id_number
                   ,task.prospect_id
                   ,task.program_code
                   ,task.program_year
                   ,task.proposal_id
                   ,task.report_id
                   ,task.allocation_code
                   ,task.committee_code
                   ,task.contract_grant_id
                   ,task.event_id
                   ,task.task_id AS fk
                   ,'1'         AS union_type
            FROM    task
                    INNER JOIN task_responsible
                        ON task_responsible.task_id = task.task_id
                    LEFT OUTER JOIN prospect
                        ON prospect.prospect_id = task.prospect_id
                    LEFT OUTER JOIN proposal
                        ON proposal.proposal_id = task.proposal_id
                    LEFT OUTER JOIN allocation
                        ON allocation.allocation_code = task.allocation_code
                    LEFT OUTER JOIN contact_report
                        ON contact_report.report_id = task.report_id
                    LEFT OUTER JOIN entity
                        ON entity.id_number = task.id_number
                    LEFT OUTER JOIN ep_event
                        ON ep_event.event_id = task.event_id
                    LEFT OUTER JOIN tms_program
                        ON tms_program.program_code = task.program_code
                    LEFT OUTER JOIN tms_task
                        ON tms_task.task_code = task.task_code
                    LEFT OUTER JOIN tms_task_status
                        ON tms_task_status.task_status_code = task.task_status_code
                    LEFT OUTER JOIN task_outlook o
                        ON  o.task_id           = task.task_id
            WHERE NVL(prospect.prospect_type,'*') <> 'B'
             AND prospect.active_ind = 'Y'
             AND proposal.active_ind = 'Y'
              AND task.task_status_code IN ('1')
              AND task.task_code IN ('1','M','MWP','SOL')
             AND (task.source_id_number = i_id_number
              OR task.task_id IN (SELECT task_id FROM advance.task_responsible WHERE id_number = i_id_number)
              OR entity.id_number IN (SELECT id_number FROM advance.assignment WHERE assignment_type = 'PP' AND active_ind = 'Y' AND assignment_id_number = i_id_number))
            AND     tms_task_status.active_ind  = 'Y'
            AND     task.sched_date BETWEEN to_date(i_start_date,'YYYYMMDD') AND to_date(i_end_date,'YYYYMMDD')
            ) d
        ORDER BY  d.sched_date
                 ,d.task_id DESC;
  ELSIF TRIM(i_start_date) = v_gt31 AND length(i_end_date) = 8 THEN
        OPEN RC1 FOR
        SELECT DISTINCT
                d.task_id
               ,task_desc
               ,d.task_description
               ,d.task_status_code
               ,d.active_ind
               ,d.task_priority_code
               ,d.sched_date
               ,task_name
               ,d.id_number
               ,d.prospect_id
               ,d.program_code
               ,d.program_year
               ,d.proposal_id
               ,d.report_id
               ,d.allocation_code
               ,d.committee_code
               ,d.contract_grant_id
               ,d.event_id
               ,fk
               ,union_type
               ,'Tasks > 30 days'
        FROM
            (
            SELECT DISTINCT
                    task.task_id
                   ,NVL(tms_task.short_desc, ' ') AS task_desc
                   ,task.task_description
                   ,task.task_status_code
                   ,tms_task_status.active_ind
                   ,task.task_priority_code
                   ,task.sched_date
                   ,CASE WHEN NOT task.prospect_id IS NULL AND task.prospect_id > 0 THEN
                             prospect.prospect_name
                         ELSE entity.pref_mail_name
                         END AS task_name
                   ,task.id_number
                   ,task.prospect_id
                   ,task.program_code
                   ,task.program_year
                   ,task.proposal_id
                   ,task.report_id
                   ,task.allocation_code
                   ,task.committee_code
                   ,task.contract_grant_id
                   ,task.event_id
                   ,task.task_id AS fk
                   ,'1'         AS union_type
            FROM    task
                    INNER JOIN task_responsible
                        ON task_responsible.task_id = task.task_id
                    LEFT OUTER JOIN prospect
                        ON prospect.prospect_id = task.prospect_id
                    LEFT OUTER JOIN proposal
                        ON proposal.proposal_id = task.proposal_id
                    LEFT OUTER JOIN allocation
                        ON allocation.allocation_code = task.allocation_code
                    LEFT OUTER JOIN contact_report
                        ON contact_report.report_id = task.report_id
                    LEFT OUTER JOIN entity
                        ON entity.id_number = task.id_number
                    LEFT OUTER JOIN ep_event
                        ON ep_event.event_id = task.event_id
                    LEFT OUTER JOIN tms_program
                        ON tms_program.program_code = task.program_code
                    LEFT OUTER JOIN tms_task
                        ON tms_task.task_code = task.task_code
                    LEFT OUTER JOIN tms_task_status
                        ON tms_task_status.task_status_code = task.task_status_code
                    LEFT OUTER JOIN task_outlook o
                        ON  o.task_id           = task.task_id
            WHERE NVL(prospect.prospect_type,'*') <> 'B'
             AND prospect.active_ind = 'Y'
             AND proposal.active_ind = 'Y'
              AND task.task_status_code IN ('1')
              AND task.task_code IN ('1','M','MWP','SOL')
             AND (task.source_id_number = i_id_number
              OR task.task_id IN (SELECT task_id FROM advance.task_responsible WHERE id_number = i_id_number)
              OR entity.id_number IN (SELECT id_number FROM advance.assignment WHERE assignment_type = 'PP' AND active_ind = 'Y' AND assignment_id_number = i_id_number))
            AND     tms_task_status.active_ind  = 'Y'
            AND     task.sched_date > to_date(i_end_date,'YYYYMMDD')
            ) d
        ORDER BY  d.sched_date
                 ,d.task_id DESC;
  ELSIF LENGTH(i_start_date) = 8 AND TRIM(i_end_date) = v_past_due THEN

        OPEN RC1 FOR
        SELECT DISTINCT
                d.task_id
               ,task_desc
               ,d.task_description
               ,d.task_status_code
               ,d.active_ind
               ,d.task_priority_code
               ,d.sched_date
               ,task_name
               ,d.id_number
               ,d.prospect_id
               ,d.program_code
               ,d.program_year
               ,d.proposal_id
               ,d.report_id
               ,d.allocation_code
               ,d.committee_code
               ,d.contract_grant_id
               ,d.event_id
               ,fk
               ,union_type
               ,'Past Due Tasks'
        FROM
            (
            SELECT DISTINCT
                    task.task_id
                   ,NVL(tms_task.short_desc, ' ') AS task_desc
                   ,task.task_description
                   ,task.task_status_code
                   ,tms_task_status.active_ind
                   ,task.task_priority_code
                   ,task.sched_date
                   ,CASE WHEN NOT task.prospect_id IS NULL AND task.prospect_id > 0 THEN
                             prospect.prospect_name
                         ELSE entity.pref_mail_name
                         END AS task_name
                   ,task.id_number
                   ,task.prospect_id
                   ,task.program_code
                   ,task.program_year
                   ,task.proposal_id
                   ,task.report_id
                   ,task.allocation_code
                   ,task.committee_code
                   ,task.contract_grant_id
                   ,task.event_id
                   ,task.task_id AS fk
                   ,'1'         AS union_type
            FROM    task
                    INNER JOIN task_responsible
                        ON task_responsible.task_id = task.task_id
                    LEFT OUTER JOIN prospect
                        ON prospect.prospect_id = task.prospect_id
                    LEFT OUTER JOIN proposal
                        ON proposal.proposal_id = task.proposal_id
                    LEFT OUTER JOIN allocation
                        ON allocation.allocation_code = task.allocation_code
                    LEFT OUTER JOIN contact_report
                        ON contact_report.report_id = task.report_id
                    LEFT OUTER JOIN entity
                        ON entity.id_number = task.id_number
                    LEFT OUTER JOIN ep_event
                        ON ep_event.event_id = task.event_id
                    LEFT OUTER JOIN tms_program
                        ON tms_program.program_code = task.program_code
                    LEFT OUTER JOIN tms_task
                        ON tms_task.task_code = task.task_code
                    LEFT OUTER JOIN tms_task_status
                        ON tms_task_status.task_status_code = task.task_status_code
                    LEFT OUTER JOIN task_outlook o
                        ON  o.task_id           = task.task_id
            WHERE NVL(prospect.prospect_type,'*') <> 'B'
             AND prospect.active_ind = 'Y'
             AND proposal.active_ind = 'Y'
              AND task.task_status_code IN ('1')
              AND task.task_code IN ('1','M','MWP','SOL')
             AND (task.source_id_number = i_id_number
              OR task.task_id IN (SELECT task_id FROM advance.task_responsible WHERE id_number = i_id_number)
              OR entity.id_number IN (SELECT id_number FROM advance.assignment WHERE assignment_type = 'PP' AND active_ind = 'Y' AND assignment_id_number = i_id_number))
            AND     tms_task_status.active_ind  = 'Y'
            AND     task.sched_date < to_date(i_start_date,'YYYYMMDD') ) d
        ORDER BY  d.sched_date
                 ,d.task_id DESC;
  ELSE
        OPEN RC1 FOR
        SELECT  ' ' AS task_id
               ,' ' AS task_desc
               ,'Error in Procedure Execution' AS task_description
               ,' ' AS task_status_code
               ,' ' AS active_ind
               ,' ' AS task_priority_code
               ,NULL AS sched_date
               ,' ' AS task_name
               ,' ' AS id_number
               ,NULL AS prospect_id
               ,' ' AS program_code
               ,' ' AS program_year
               ,NULL AS proposal_id
               ,NULL AS report_id
               ,' ' AS allocation_code
               ,' ' AS committee_code
               ,NULL AS contract_grant_id
               ,NULL AS event_id
               ,NULL AS fk
               ,NULL AS union_type
        FROM dual;
  END IF;

END csm_scheduled_tasks_detail;
