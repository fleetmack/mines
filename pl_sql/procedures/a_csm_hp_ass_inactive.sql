CREATE OR REPLACE PROCEDURE ADVANCE.A_CSM_HP_ASS_INACTIVE
(i_id_number         VARCHAR2,
RC1 IN OUT refcur_pkg.RC) AS
BEGIN
/*** All Individuals ***/
   OPEN RC1 FOR
SELECT e.id_number, 
       e.pref_mail_name,
       e.pref_name_sort,
       e.record_status_code,
       e.record_type_code,
       e.pref_class_year,
       NVL(TO_CHAR((SELECT MAX(cr.contact_date)
              FROM contact_report cr
             WHERE cr.contact_initiated_by <> 'MASS'
               AND cr.contact_type IN ('0','5','6','K','R')
               AND (e.id_number = cr.id_number
                OR e.id_number = cr.id_number_2)),'MM/DD/YY'),' ') as last_contact,
       NVL((SELECT cr.description
              FROM contact_report cr
             WHERE cr.contact_initiated_by <> 'MASS'
               AND cr.contact_type IN ('0','5','6','K','R')
               AND (e.id_number = cr.id_number
                OR e.id_number = cr.id_number_2)
               AND cr.report_id IN (SELECT MAX(x.report_id)
                                      FROM contact_report x
                                     WHERE x.contact_initiated_by <> 'MASS'
                                       AND x.contact_type IN ('0','5','6','K','R')
                                       AND x.id_number = e.id_number
                                       AND TO_CHAR(x.contact_date,'YYYYMMDD') IN (SELECT MAX(TO_CHAR(y.contact_date,'YYYYMMDD'))
                                                                                    FROM contact_report y
                                                                                   WHERE y.contact_initiated_by <> 'MASS'
                                                                                     AND y.contact_type IN ('0','5','6','K','R')
                                                                                     AND y.id_number = e.id_number))),' ') as description,
       NVL((SELECT MAX(x.report_id)
              FROM contact_report x
             WHERE x.contact_initiated_by <> 'MASS'
               AND x.contact_type IN ('0','5','6','K','R')
               AND x.id_number = e.id_number
               AND TO_CHAR(x.contact_date,'YYYYMMDD') IN (SELECT MAX(TO_CHAR(y.contact_date,'YYYYMMDD'))
                                                            FROM contact_report y
                                                           WHERE y.contact_initiated_by <> 'MASS'
                                                             AND y.contact_type IN ('0','5','6','K','R')
                                                             AND y.id_number = e.id_number)),0) as report_id
  FROM entity e,
       assignment a
 WHERE e.id_number = a.id_number
   AND e.id_number NOT IN (SELECT cr.id_number
                             FROM contact_report cr
                            WHERE cr.contact_initiated_by <> 'MASS'
                              AND cr.contact_type IN ('0','5','6','K','R')
                              AND TO_CHAR(cr.contact_date,'YYYYMMDD') >= TO_CHAR(sysdate-180,'YYYYMMDD'))
   AND e.id_number NOT IN (SELECT cr.id_number_2
                             FROM contact_report cr
                            WHERE cr.contact_initiated_by <> 'MASS'
                              AND cr.contact_type IN ('0','5','6','K','R')
                              AND TO_CHAR(cr.contact_date,'YYYYMMDD') >= TO_CHAR(sysdate-180,'YYYYMMDD'))
   AND a.assignment_id_number = i_id_number
   AND a.active_ind = 'Y'
ORDER BY pref_name_sort;
END;