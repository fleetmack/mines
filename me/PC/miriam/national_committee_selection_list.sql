select id_number, pref_mail_name, pref_name_sort, pref_class_year, h_addr_pref_desc, h_cityline, h_foreign_cityzip, b_addr_pref_desc, b_company_name_1, b_business_title
from a_dw_address_good
where record_type_code = 'AL'
and p_zipcode not between '80000-0000' and '80499-9999'
and p_zipcode not between '77000-0000' and '77599-9999'
and pref_class_year NOT IN 
(select year
from a_dw_reunion_years_cfy)
and id_number NOT IN
    (select id_number
       from committee
      where committee_status_code = 'A'
        and committee_code IN
            (select c.committee_code
               from tms_committee_table c
              where c.status_code = 'A'
                and c.committee_group_code in ('TR')))
and id_number in
    (select id_number
       from a_dw_prospecting
      where pfy_giving >= 500
         or cfym2_giving >= 500
         or cfym3_giving >= 500
         or cfym4_giving >= 500
         or cfym5_giving >= 500)



            
            
      