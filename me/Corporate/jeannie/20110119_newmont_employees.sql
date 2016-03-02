/*** Employees working for Newmont ***/
select e.id_number, e.pref_mail_name, e.pref_name_sort, e.pref_class_year,
          deg.degrees,
          dw.employer_name1,
          ad.b_company_name_1, ad.b_business_title, ad.b_street1, ad.b_street2, ad.b_street3, ad.b_cityline, ad.b_foreign_cityzip, ad.b_country_code, ad.b_email_address, ad.b_phone_formatted
from entity  e,
        a_dw_jobs  dw,
        a_dw_degree_count deg,
        a_dw_address_good  ad
where e.id_number = dw.id_number
    and deg.id_number = e.id_number
    and ad.id_number(+) = e.id_number
    and e.record_type_code = 'AL'
    and dw.employer_id_number IN ('0000019460','0000019169','0000018171')
    and dw.job_status_code = 'C'
    and dw.employ_relat_code IN ('PE','CE');