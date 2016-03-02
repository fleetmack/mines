/*** Securities for this guy ***/
select  'Ralph Hennebach',prim_gift_date_of_record, '$'||prim_gift_amount, prim_gift_comment
from primary_gift
where prim_gift_receipt_number
IN 
(select gift_receipt_number
from gift
where gift_donor_id = 2595
and gift_payment_type = 'S')