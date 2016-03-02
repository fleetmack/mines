select dw.id_number, dw.pref_mail_name, dw.pref_name_sort, dw.record_type_code, dw.pref_class_year, 
dw.cfae_purp_desc, dw.cfae_purp_code, dw.alloc, a.long_name, a.program_code, t1.full_desc, a.alloc_purpose, t.full_desc,
sum(associated_amount) cash,
sum(associated_amount_match + associated_amount_claim) match,
sum(associated_amount_joint) joint,
sum(total_jnt_cash) total_joint_cash,
sum(total_commitment) total_single_commitment,
sum(total_jnt_commitment) total_joint_commitment
from a_dw_pyramid  dw,
        allocation a,
        tms_purpose  t,
        tms_program  t1
where a.allocation_code = dw.alloc
and t.purpose_code = a.alloc_purpose
and t1.program_code = a.program_code
and dw.year_of_giving = '2010'
and dw.alloc <> '3795'
and dw.flag_alumni <> 1
and dw.flag_non_monthend <> 1
and dw.associated_code <> 'B'
group by dw.id_number, dw.pref_mail_name, dw.pref_name_sort, dw.record_type_code, dw.pref_class_year, 
dw.cfae_purp_desc, dw.cfae_purp_code, dw.alloc, a.long_name, a.program_code, t1.full_desc, a.alloc_purpose, t.full_desc
order by dw.cfae_purp_code, a.program_code, a.alloc_purpose, dw.alloc, sum(total_jnt_commitment) DESC