CREATE OR REPLACE PROCEDURE         csm_proposal_aging
(i_id_number VARCHAR2,
 RC1 IN OUT refcur_pkg.rc)
AS

/*---------------------------------------------------------------------------------------
                          MY SCHEDULED TASKS
The My proposal aging

01/12/2011      JYY(SGHE)    Creation
*/--------------------------------------------------------------------------------------


BEGIN


      OPEN RC1 FOR
      WITH prop_rec AS
      (
      SELECT 
      prop.proposal_id
      , prop.prospect_id
      , prop.start_date
      , st.stage_date
      , prop.ask_amt
      , prop.stage_code AS pstage_code
      , st.stage_code
      , tps.short_desc stage_desc
      , MONTHS_BETWEEN(sysdate,st.stage_date) AS month_diff
      , row_number() OVER(PARTITION BY st.prospect_id, st.proposal_id ORDER BY st.stage_date DESC) AS rank_no
      from advance.proposal prop
      INNER JOIN advance.prospect_entity pe ON pe.prospect_id = prop.prospect_id
      INNER JOIN advance.stage st ON st.proposal_id = prop.proposal_id AND st.prospect_id = prop.prospect_id 
      INNER JOIN advance.tms_proposal_stage tps ON tps.stage_code = st.stage_code
      where prop.active_ind = 'Y'
      --AND prop.proposal_status_code IN ('2','3','7','8')
      AND st.stage_code = prop.stage_code  
      AND prop.stage_code in ('E','CU','S','SO','ST')  
      AND (EXISTS (SELECT 'Y'
                  FROM advance.assignment assg
                  INNER JOIN advance.entity e ON e.id_number = assg.id_number
                  WHERE assg.active_ind = 'Y'
                  AND assg.assignment_type = 'PP'
                  AND assg.id_number = e.id_number
                  AND assg.id_number = pe.id_number
                  AND assg.assignment_id_number = i_id_number) 
           OR
           EXISTS (SELECT 'Y'
                  FROM advance.assignment assg
                  WHERE assg.active_ind = 'Y'
                  AND assg.assignment_type = 'PP'
                  AND assg.prospect_id= pe.prospect_id
                  AND assg.assignment_id_number = i_id_number) 
          )
      )
      , assg_id AS
      (
      SELECT 
      DISTINCT assignment_id_number
      FROM advance.assignment
      WHERE assignment_id_number = i_id_number --'0000034355'
      )
      , prop_stages AS
      (
      SELECT 
      stage_code
      , short_desc AS stage_desc
      , tps2.hierarchy_order
      FROM advance.tms_proposal_stage tps2
      WHERE tps2.stage_code in ('E','CU','S','SO','ST')    --Customization 1.1
      )
      SELECT 
      ps.stage_desc
      , ps.hierarchy_order
      , i_id_number AS assg_id_number
      ,GROUPING(ps.stage_desc) desc_ind
      ,GROUPING(ps.hierarchy_order) order_ind 
      , COUNT(pr.stage_desc) AS rec_count
      , SUM(CASE WHEN month_diff >= 24 THEN pr.ask_amt
                                  ELSE 0
            END) AS more_than_24months
      , SUM(CASE WHEN month_diff >= 18 AND month_diff < 24 THEN pr.ask_amt
                                  ELSE 0
            END) AS between_18_and_24
      , SUM(CASE WHEN month_diff >= 12 AND month_diff < 18 THEN pr.ask_amt
                                  ELSE 0
            END) AS between_12_and_18
      , SUM(CASE WHEN month_diff >= 6  AND month_diff < 12 THEN pr.ask_amt
                                  ELSE 0
            END) AS between_6_and_12
      , SUM(CASE WHEN month_diff < 6  THEN pr.ask_amt
                                  ELSE 0
            END) AS less_6
      FROM assg_id
      LEFT OUTER JOIN prop_stages ps ON (1=1)
      LEFT OUTER JOIN prop_rec pr ON (ps.stage_code = pr.stage_code)
      WHERE NVL(pr.rank_no,1) = 1
      GROUP BY ROLLUP(ps.stage_desc, hierarchy_order), i_id_number
      HAVING grouping(ps.hierarchy_order) = 0 or grouping(ps.stage_desc) = 1
      ORDER BY CASE WHEN TRIM(stage_desc) IS NULL THEN 10000   --for sorting purposes
                                                  ELSE hierarchy_order
               END ASC
      ;

END csm_proposal_aging;
