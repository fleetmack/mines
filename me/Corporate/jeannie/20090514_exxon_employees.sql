 /*** ExxonMobil Employees ****/
select e.id_number, e.pref_mail_name, e.pref_name_sort,  e.pref_class_year, ag.b_company_name_1,ag.b_company_name_2, ag.b_business_title, ag.b_street1, ag.b_street2, ag.b_cityline, ag.b_email_address, ag.b_phone_formatted, max(d.dept_desc)
from entity   e,
        a_dw_address_good   ag,
        a_dw_jobs    j,
        a_dw_degrees  d
where ag.id_number(+) = e.id_number
and d.id_number = e.id_number
and e.id_number = j.id_number
and e.record_type_code = 'AL'
and j.employ_relat_code = 'PE'
and j.job_status_code = 'C'
and j.employer_id_number IN
        ('0000025665',
        '0000025664',
        '0000024589',
        '0000025663',
        '0000024570',
        '0000019534',
        '0000018323',
        '0000029633',
        '0000029631',
        '0000034526',
        '0000029691',
        '0000032146',
        '0000032268')
group by e.id_number, e.pref_mail_name, e.pref_name_sort,  e.pref_class_year, ag.b_company_name_1,ag.b_company_name_2, ag.b_business_title, ag.b_street1, ag.b_street2, ag.b_cityline, ag.b_email_address, ag.b_phone_formatted
order by max(d.dept_desc), ag.b_company_name_1, e.pref_name_sort