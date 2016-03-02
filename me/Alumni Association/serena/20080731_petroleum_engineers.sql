/*** Petroleum Engineering Grads with Concatenated field of Degrees ***/
select ad.id_number, 
         ad.pref_mail_name, 
         ad.pref_name_sort, 
         ad.p_company_name_1, 
         ad.p_company_name_2,
         ad.p_business_title, 
         ad.p_street1, 
         ad.p_street2, 
         ad.p_street3, 
         ad.p_city, 
         ad.p_state_code, 
         ad.p_zipcode, 
         ad.p_foreign_cityzip, 
         ad.p_email_address,  
         ad.pref_class_year,
         max(decode(d.xsequence,1,d.degree_desc,' '))||
       max(decode(d.xsequence,2,', '||d.degree_desc,' '))||
       max(decode(d.xsequence,3,', '||d.degree_desc,' '))||
       max(decode(d.xsequence,4,', '||d.degree_desc,' ')) as degrees 
from a_dw_address_good      ad, 
        a_dw_degrees                d 
where ad.id_number              = d.id_number
   and d.dept_code                  = 'PET'
   and ad.record_type_code     = 'AL'
   and d.institution_code         = '1'
group by ad.id_number, 
             ad.pref_mail_name, 
             ad.pref_name_sort, 
             ad.p_company_name_1, 
             ad.p_company_name_2,
             ad.p_business_title, 
             ad.p_street1, 
             ad.p_street2, 
             ad.p_street3, 
             ad.p_city, 
             ad.p_state_code, 
             ad.p_zipcode, 
             ad.p_foreign_cityzip, 
             ad.p_email_address,
             ad.pref_class_year
   
   /*** need 2063 above here 
select *
from a_dw_address_good  ad,
        a_dw_degrees            d
where ad.id_number = d.id_number
   and d.dept_code = 'PET'   
***/     
