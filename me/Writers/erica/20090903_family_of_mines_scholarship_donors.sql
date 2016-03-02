/*** Family of Mines Scholarship ***/
select id_number, pref_mail_name, pref_name_sort, sum(associated_amount+associated_amount_match+associated_amount_claim+associated_amount_joint) as total_cash
from a_dw_pyramid
where alloc = '4970'
group by id_number, pref_mail_name, pref_name_sort
order by pref_name_sort