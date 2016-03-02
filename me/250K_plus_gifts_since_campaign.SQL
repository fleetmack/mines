select id_number, 
       pref_mail_name, 
       sum(associated_amount+associated_amount_match+associated_amount_claim) as gift,
       sum(prim_pledge_amount_os) as os_pledge,
       sum(associated_amount + associated_amount_match+associated_amount_claim+prim_pledge_amount_os) as total
from a_dw_pyramid
where flag_trans_resources = 1
and date_of_record > '20000701'
group by id_number, pref_mail_name
having sum(associated_amount + prim_pledge_amount_os) >= 250000
order by sum(associated_amount +associated_amount_match+associated_amount_claim+ prim_pledge_amount_os) desc
