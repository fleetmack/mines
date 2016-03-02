/*** Donors giving over $1M by year for last 10 years ***/
select id_number, pref_mail_name, pref_name_sort, year_of_giving, sum(commitment_amount_summ) commitment_amount_summ, sum(associated_amount+associated_amount_match+associated_amount_claim) total_individual_giving,
(CASE
WHEN sum(commitment_amount_summ) <> sum(associated_amount+associated_amount_match+associated_amount_claim) THEN 'x'
ELSE ' '
END) joint_is_different,
(CASE when id_number IN (select id_number from a_dw_pyramid where flag_behalf = '1') THEN 'X'
 ELSE ' '
 END) flag_potential_behalf
from a_dw_pyramid
where year_of_giving >= '2001'
and flag_alumni <> '1'
and flag_non_monthend <> '1'
group by id_number, pref_mail_name, pref_name_sort, year_of_giving
having sum(associated_amount+associated_amount_match+associated_amount_claim+associated_amount_joint) > 1000000
order by year_of_giving, pref_name_sort;

/*** Donors giving between $500K and $999,999.99 by year for last 10 years ***/
select id_number, pref_mail_name, pref_name_sort, year_of_giving, sum(commitment_amount_summ) total_joint_giving, sum(associated_amount+associated_amount_match+associated_amount_claim) total_individual_giving,
(
CASE
WHEN sum(commitment_amount_summ) <> sum(associated_amount+associated_amount_match+associated_amount_claim) THEN 'x'
ELSE ' '
END) joint_is_different,
(CASE when id_number IN (select id_number from a_dw_pyramid where flag_behalf = '1') THEN 'X'
 ELSE ' '
 END) flag_potential_behalf
from a_dw_pyramid
where year_of_giving >= '2001'
and flag_alumni <> '1'
and flag_non_monthend <> '1'
group by id_number, pref_mail_name, pref_name_sort, year_of_giving
having sum(commitment_amount_summ) BETWEEN 500000 and 999999.99
order by year_of_giving, pref_name_sort;