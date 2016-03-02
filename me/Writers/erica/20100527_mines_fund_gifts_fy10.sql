/*** USE THIS FOR ERICA'S STUFF!! YOUR TOTAL LIFETIME NUMBERS ARE HOSED RIGHT NOW BUT SHOULD BE RIGHT IN A_DW_LT_MF_GIVING ***/
select p.id_number, p.pref_mail_name, p.pref_name_sort, p.record_type_code, p.pref_class_year, 
--g.total_w_pledge total_lifetime_commitment_mf, 
sum(p.total_jnt_commitment) fy10_commitment, sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim + p.associated_amount_joint) fy10_cash_plus_match
from a_dw_pyramid   p,
        a_dw_lt_mf_giving  g
where g.id_number = p.id_number
and p.year_of_giving = '2010'
and p.alloc = '3795'
and p.flag_alumni <> '1'
and p.flag_non_monthend <> '1'
and p.person_or_org = 'P'
and p.associated_code <> 'B'
group by p.id_number, p.pref_mail_name, p.pref_name_sort, p.record_type_code, p.pref_class_year, g.total+g.joint+g.match, g.total_w_pledge
order by p.pref_name_sort