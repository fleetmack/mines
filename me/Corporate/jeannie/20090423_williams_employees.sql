select id_number, pref_mail_name, pref_name_sort, pref_class_year, b_company_name_1, b_company_name_2, b_business_title, b_street1, b_street2, b_cityline, b_email_address, b_phone_formatted
from a_dw_address_good
where id_number IN
(select *
from a_dw_jobs
where employer_id_number IN ('0000028985','0000018526','0000028986','0000037526')
and record_type_code = 'AL'
and job_status_code = 'C'
order by employer_id_number)
order by b_street1, pref_name_sort