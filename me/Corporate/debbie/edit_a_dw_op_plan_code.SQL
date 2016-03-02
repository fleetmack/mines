
 
 ALTER TABLE A_DW_OP_PLAN
 ADD PRIORITY_CODE  NUMBER(1) nULL

UPDATE A_DW_OP_PLAN

set priority_code = 4 where priority_code is null
set priority_code = IS NULL where solicitation_priority_code IS NULL;



SELECT PRIORITY_CODE, SOLICITATION_PRIORITY_CODE, GROUP_DESC, GROUP_CODE FROM A_DW_OP_PLAN


select solicitation_priority_code, group_code, group_desc, priority_code
from a_dw_op_plan where priority_code is null
set 
order by group_code, solicitation_priority_code
