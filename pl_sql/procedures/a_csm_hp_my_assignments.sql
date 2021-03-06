CREATE OR REPLACE PROCEDURE ADVANCE.A_CSM_HP_MY_ASSIGNMENTS
(i_id_number         VARCHAR2,
RC1 IN OUT refcur_pkg.RC) AS
BEGIN
/*** All Individuals ***/
   OPEN RC1 FOR
SELECT e.id_number, 
       e.pref_mail_name,
       e.pref_name_sort,
       a.assignment_type,
       DECODE(t.adv_very_short_desc,' ', t.short_desc, t.adv_very_short_desc) as short_desc,
       DECODE(a.assignment_type, 'PP',1,
                                 'SM',2,
                                 'PS',3,
                                 'PT',4,
                                      5) as sorter,
       DECODE(af.temperature, 'H', '<img border="0" src="images/mines/thermo_1hot.png">'
                             , 'W', '<img border="0" src="images/mines/thermo_2warm.png">'
                                  , '<img border="0" src="images/mines/thermo_3cold.png">') as thermo,
       af.donor_continuum,
       NVL((SELECT d.dp_rating_code||': '||t.full_desc 
              FROM demographic_profile d, 
                   tms_dp_rating t
             WHERE dp_rating_type_code = 'RMG'
               AND t.dp_rating_code = d.dp_rating_code
               AND d.id_number = e.id_number),'RP14: Unrated') as rating,
      NVL((SELECT MAX(DECODE(pl.stage_code,'S' ,'1. Solicitation'
                                             ,'SO','2. Clearing for Solicitation'
                                             ,'ST','3. Gift Follow-Up'
                                             ,'CU','4. Cultivation'
                                             ,'E' ,'5. Evaluation')) 
             FROM prospect_entity pe,
                  prospect pt,
                  proposal pl
            WHERE pe.prospect_id = pt.prospect_id
              AND pt.prospect_id = pl.prospect_id
              AND pe.id_number = e.id_number
              AND pt.active_ind = 'Y'
              AND pl.active_ind = 'Y'
              AND pt.prospect_type <> 'B'
              AND pl.stage_code IN ('CU','E','S','SO','ST')
         GROUP BY pe.id_number),'6. No Active Proposal') as stage,
      NVL((SELECT SUM(pl.ask_amt) 
             FROM prospect_entity pe,
                  prospect pt,
                  proposal pl
            WHERE pe.prospect_id = pt.prospect_id
              AND pt.prospect_id = pl.prospect_id
              AND pe.id_number = e.id_number
              AND pt.active_ind = 'Y'
              AND pl.active_ind = 'Y'
              AND pt.prospect_type <> 'B'
              AND pl.stage_code IN ('CU','E','S','SO')
         GROUP BY pe.id_number),0) as ask_amt,
      NVL((SELECT MAX(to_char(cr.contact_date,'MM/DD/YY'))
               FROM   a_dw_contact_report cr
              WHERE   cr.id_number           = e.id_number
                AND   cr.contact_initiated_by NOT IN ('MASS','BOG')
                AND   cr.contact_type IN ('0','5','6','K','R') 
                AND   cr.contact_date        =
                (SELECT max(cr2.contact_date)
                   FROM a_dw_contact_report cr2
                  WHERE cr2.id_number         = e.id_number
                AND   cr2.contact_initiated_by NOT IN ('MASS','BOG')
                AND   cr2.contact_type IN ('0','5','6','K','R'))),'None') as last_contact,
      NVL((SELECT substr(to_char(n.note_text),1,4000)
             FROM notes n
            WHERE n.note_type = 'B3'
              AND n.id_number = e.id_number
              AND to_char(n.note_date,'YYYYMMDD') IN
              (SELECT MAX(to_char(n2.note_date,'YYYYMMDD'))
                 FROM notes n2
                WHERE n2.id_number = e.id_number
                  AND n2.note_type = 'B3')),' ') as strategy
  FROM entity e,
       assignment a,
       tms_assignment_type t,
       a_dw_affinity af
 WHERE e.id_number = a.id_number
   AND a.assignment_type = t.assignment_type
   AND e.id_number = af.id_number
   AND a.assignment_type NOT IN ('PP','SM')
   AND a.active_ind = 'Y'
   AND assignment_id_number = i_id_number
ORDER BY DECODE(a.assignment_type, 'PP',1,
                                 'SM',2,
                                 'PS',3,
                                 'PT',4,
                                      5), pref_name_sort;
END;