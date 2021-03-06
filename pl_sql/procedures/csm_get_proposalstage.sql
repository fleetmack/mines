CREATE OR REPLACE PROCEDURE         csm_get_ProposalStage
  (
    i_id_number     IN  VARCHAR2
    ,i_stage_desc     IN  VARCHAR2
    , RC1          OUT SYS_REFCURSOR
  )
AS

/*---------------------------------------------------------------------------------------
                          MY SCHEDULED TASKS
The My proposal aging

01/12/2011      JYY(SGHE)    Creation
*/--------------------------------------------------------------------------------------
    v_stage_desc              zz_adv_table.adv_short_desc%TYPE;

BEGIN

      v_stage_desc := i_stage_desc;
         
      OPEN RC1 FOR
      WITH stage_rec AS
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
      SELECT
      i_stage_desc AS stage_desc--sr.stage_desc
      ,i_id_number AS id_number
      , pros.prospect_name
      , pros.prospect_id
      , prop.proposal_id
      , prop.ask_amt
      , prop.expected_date
      , sr.stage_date
      , tpss.short_desc AS prop_status_desc
      , prop.proposal_title
      FROM proposal prop
      INNER JOIN stage_rec sr ON sr.proposal_id = prop.proposal_id AND sr.prospect_id = prop.prospect_id AND sr.stage_code = prop.stage_code
      INNER JOIN prospect pros ON pros.prospect_id = prop.prospect_id
      INNER JOIN tms_proposal_status tpss ON tpss.proposal_status_code = prop.proposal_status_code
      WHERE prop.active_ind = 'Y'
      AND prop.active_ind = 'Y'
      AND prop.stage_code in ('E','CU','S','SO','ST')  --Customization 1.1
      AND pros.active_ind = 'Y'
      AND sr.rank_no = 1
      AND UPPER(sr.stage_desc) LIKE UPPER(TRIM(i_stage_desc)) || '%'
      UNION
      SELECT
      NULL AS stage_desc
      ,NULL AS id_number
      ,'ZTotal' AS prospect_name
      , 0 AS prospect_id
      , 0 AS proposal_id
      , SUM(prop.ask_amt) AS ask_amt
      , NULL AS expected_date
      , NULL AS stage_date
      , NULL AS prop_status_desc
      , NULL AS proposal_title
      FROM proposal prop
      INNER JOIN stage_rec sr ON sr.proposal_id = prop.proposal_id AND sr.prospect_id = prop.prospect_id AND sr.stage_code = prop.stage_code
      INNER JOIN prospect pros ON pros.prospect_id = prop.prospect_id
      WHERE prop.active_ind = 'Y'
      AND pros.active_ind = 'Y'
      AND sr.rank_no = 1
      AND prop.stage_code in ('E','CU','S','SO','ST')  --Customization 1.1
      AND UPPER(sr.stage_desc) LIKE UPPER(TRIM(i_stage_desc)) || '%'
      
      ORDER BY 1
      ;

END csm_get_ProposalStage;
