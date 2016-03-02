/*** Campus employees who gave $1000 or more combined over the past 5 years ***/
select p.id_number, p.pref_mail_name, p.pref_name_sort, pm.ass_pref_mail_name
from a_dw_pyramid   p,
        a_dw_assignment_pm pm
where pm.id_number(+) = p.id_number
and p.flag_non_monthend <> 1
and p.flag_alumni <> 1
and p.year_of_giving >= (select substr(cfy_beg_minus_5,1,4) from a_dw_fiscal_dates)
and p.id_number IN
    (select id_number from a_dw_jobs where employer_id_number IN ('0000020910',
                                                                                                         '0000017894',
                                                                                                         '0000019431',
                                                                                                         '0000034805',
                                                                                                         '0000018591')
        and employ_relat_code = 'PE' and job_status_code = 'C')
group by p.id_number, p.pref_mail_name, p.pref_name_sort, pm.ass_pref_mail_name
having sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim) >= 1000;