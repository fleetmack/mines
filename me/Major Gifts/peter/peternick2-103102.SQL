select sum(total_commitment)
from a_dw_pyramid,
     a_dw_fiscal_dates
where date_of_record between pfy_beg and pfy_end
and flag_alumni = 0
and associated_code <> 'B'
and id_number in 
(select id_number
from a_dw_gift_clubs
where gugg02 = 1);

select sum(total_commitment)
from a_dw_pyramid,
     a_dw_fiscal_dates
where date_of_record between pfy_beg and pfy_end
and flag_alumni = 0
and associated_code <> 'B'
and transaction_type not in ('MG','MC');

/***(Doesn’t actually work)***/
select sum(commitment_amount + associated_amount_match + associated_amount_claim )
from a_dw_pyramid,
     a_dw_fiscal_dates
where commitment_date between pfy_beg and pfy_end
and flag_alumni = 0
and associated_code <> 'B'
and id_number in 
(select id_number
from a_dw_gift_clubs
where gugg02 = 1);

select sum(commitment_amount)
from a_dw_pyramid,
     a_dw_fiscal_dates
where commitment_date between pfy_beg and pfy_end
and flag_alumni = 0
and associated_code <> 'B';

/***(Doesn’t actually work either - closer though)***/
select sum(commitment_amount + associated_amount_match + associated_amount_claim )
from a_dw_pyramid,
     a_dw_fiscal_dates
where commitment_date between pfy_beg and pfy_end
and flag_alumni = 0
and associated_code <> 'B'
and transaction_type not in ('MG','MC');