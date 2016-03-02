/*** Petroleum Donors FY2010 ***/
select id_number, person_or_org, record_type_code, pref_class_year, pref_mail_name, pref_name_sort, sum(associated_amount) cash_without_match, sum(associated_amount_match + associated_amount_claim) match, sum(associated_amount_joint) additional_joint_amt
from a_dw_pyramid
where year_of_giving = '2010'
and alloc = '4641'
and associated_code <> 'B'
group by id_number, person_or_org, record_type_code, pref_class_year, pref_mail_name, pref_name_sort
order by person_or_org DESC, pref_name_sort