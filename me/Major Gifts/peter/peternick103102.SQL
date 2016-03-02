select sum(prim_pledge_amount_os)
from a_dw_pyramid, a_dw_fiscal_dates
where date_of_record between pfy_beg and pfy_end
and flag_alumni = 0 
and associated_code <> 'B'
and id_number in
(select id_number from a_dw_gift_clubs
where gugg02 = 1); 


