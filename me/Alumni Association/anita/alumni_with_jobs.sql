select   a.id_number,
         a.pref_mail_name,
         a.pref_name_sort,
         dg1.degrees_csmaa_dir,
         a.h_street1        as home_street,
         a.h_street2        as home_street2,
         a.h_street3        as home_street3,
         a.h_city           as home_city,
         a.h_state_desc     as home_state,
         a.h_zipcode        as home_zip,
         a.h_foreign_cityzip as home_foreign_city_zip,
         a.h_country_desc   as home_foreign_country,
         a.h_email_address  as home_email,
         a.h_phone_formatted as home_phone,
         a.b_company_name_1  as company_name1,
         a.b_company_name_2  as company_name2,
         a.b_business_title as business_title,
         a.b_street1        as business_street,
         a.b_street2        as business_street2,
         a.b_street3        as business_street3,
         a.b_city           as business_city,
         a.b_state_desc     as business_state,
         a.b_zipcode  as business_zip,
         a.b_foreign_cityzip as business_foreign_city_zip,
         a.b_country_desc   as business_foreign_country,
         a.b_email_address  as business_email,
         a.b_phone_formatted as business_phone
    from a_dw_address_good     a,
         a_dw_degree_count     dg1
   where a.id_number            = dg1.id_number
     and a.record_type_code     = 'AL'
     and a.id_number            IN
        (select id_number
           from a_dw_degrees
          where institution_code = '1')    
      and a.id_number           IN
        (select id_number
           from a_dw_jobs
          where record_status_code = 'A'
              and employ_relat_code = 'PE'
              and job_status_code = 'C')
              
              
              
  
              
              
            
     