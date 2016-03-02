/*** Donors to this specific allocation with the requested data ***/
select distinct dw.id_number, 
        dw.record_type_code,
        dw.pref_mail_name, 
        dw.pref_name_sort, 
        dw.pref_class_year,
        ad.p_city,
        ad.p_state_code,
        nvl((select j.employer_name1 from a_dw_jobs j where j.job_status_code = 'C' and j.employ_relat_code = 'PE' and j.id_number = dw.id_number),' ') employer,
        sum(dw.total_commitment) total_commitment,
        sum(dw.total_jnt_commitment) total_jnt_commitment, 
        sum(dw.associated_amount_match + dw.associated_amount_claim) match, 
        sum(dw.total_jnt_commitment) - sum(dw.associated_amount_match + dw.associated_amount_claim) total_jnt_commit_without_match
from a_dw_pyramid  dw,
        a_dw_address_good  ad
where ad.id_number(+) = dw.id_number
and dw.alloc = 'B5608'
group by  dw.id_number, 
                dw.record_type_code,
                dw.pref_mail_name, 
                dw.pref_name_sort,
                dw.pref_class_year,
                ad.p_city,
                ad.p_state_code
order by dw.id_number