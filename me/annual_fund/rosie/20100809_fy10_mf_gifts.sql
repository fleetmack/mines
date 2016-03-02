/*** MF gifts in 2010 by individual ***/
/*** Note - this includes behalf currently, eliminate if needed by associated_code <> 'B' ***/
select id_number, pref_mail_name, pref_name_sort, sum(associated_amount) cash, sum(associated_amount+associated_amount_joint) joint_cash, sum(associated_amount+associated_amount_match+associated_amount_claim) cash_plus_match,
         sum(associated_amount+associated_amount_match+associated_amount_claim+associated_amount_joint) joint_cash_plus_match, sum(total_commitment) commitment, sum(total_jnt_commitment) joint_commitment
from a_dw_pyramid
where alloc = '3795'
and year_of_giving = '2010'
and flag_alumni <> '1'
and person_or_org = 'P'
and flag_non_monthend <> '1'
group by id_number, pref_mail_name, pref_name_sort
order by pref_name_sort