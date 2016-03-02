select *
from a_dw_pyramid
where appeal_code = 'D03'
   or (appeal_code = 'Y303' and date_of_record between '20030501' and '20030731')
   or (appeal_code = 'N203' and date_of_record between '20030501' and '20030731')
   or (appeal_code = 'LL203' and date_of_record between '20030501' and '20030731')
order by appeal_code; 
