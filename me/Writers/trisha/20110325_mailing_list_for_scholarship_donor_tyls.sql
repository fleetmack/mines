/*** Mailing list of scholarship donors .... first part is individuals, second is for corporate ***/
select distinct id_number
from a_temp_stew_hold_for_schol_ty
union
select distinct id_number
from entity
where id_number IN ('0000029462',	
 '0000028477',	
 '0000040980',	
 '0000037967',	
 '0000054302',	
 '0000036881',	
 '0000010865',	
 '0000054647',	
 '0000040980',	
 '0000054666',	
 '0000054366',	
 '0000019919',	
 '0000037927',	
 '0000057589',	
 '0000057345',	
 '0000057344',	
 '0000050157',	
 '0000050115',	
 '0000050894',	
 '0000050841',	
 '0000005529',
 '0000041989',
 '0000054366',
'0000050191',
'0000051106',
'0000057595',
'0000051108',
'0000011730');