/*** Donors to SCG with gift amount ***/
select id_number, pref_mail_name, pref_name_sort, commitment_amount
from a_dw_pyramid
where appeal_code = 'SCG11'
--group by id_number, pref_mail_name, pref_name_sort, commitment_amount
order by pref_name_sort;



select id_number, pref_mail_name, pref_name_sort, ltrim(to_char(sum(associated_amount+associated_amount_match+associated_amount_claim+associated_amount_joint),'$999,999,999,999'),' ') gift
from a_dw_pyramid
where appeal_code = 'SCG11'
group by id_number, pref_mail_name, pref_name_sort
order by pref_name_sort;


select id_number, pref_mail_name, pref_name_sort, associated_amount, associated_amount_match, associated_amount_claim, associated_amount_joint
from a_dw_pyramid
where appeal_code = 'SCG11'
--group by id_number, pref_mail_name, pref_name_sort
order by pref_name_sort;