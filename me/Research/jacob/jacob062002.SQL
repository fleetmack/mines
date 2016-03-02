/***use a_alumni_degrees_by_company in PowerBuilder***/

/***Phillips ID Numbers***/
select * 
from a_dw_jobs 
where record_status_code = 'A'
  and record_type_code   = 'AL'
  and job_status_code    = 'C'
  and employ_relat_code  = 'PE'
  and employer_id_number = ANY('0000032098',   /***Phillips Alaska, Inc***/                            
                               '0000018200',   /***Phillips Petroleum Company***/ 
                               '0000018202',   /***Phillips Petroleum Company of Norway***/
                               '0000018203')   /***Phillips Petroleum Company - Western Region***/


/***Conoco ID Numbers***/
select * 
from a_dw_jobs 
where record_status_code = 'A'
  and record_type_code   = 'AL'
  and job_status_code    = 'C'
  and employ_relat_code  = 'PE'
  and employer_id_number = ANY('0000028400',   /***Conoco Canada, LTD.***/
                               '0000018051',   /***Conoco, Inc.***/
                               '0000018056')   /***Conoco Inc., North American Production***/


