/*** Email addresses and other assorted shit for all Female alumni***/
SELECT   id_number, pref_mail_name, pref_name_sort, salutation, pref_class_year, p_email_address, p_company_name_1,
  h_company_name_2, h_business_title,
  h_street1, h_street2, h_street3, h_city, h_state_code, h_zipcode, h_foreign_cityzip, h_country_code,
  b_company_name_2, b_business_title,
  b_street1, b_street2, b_street3, b_city, b_state_code, b_zipcode, b_foreign_cityzip, b_country_code
FROM a_dw_address_good
WHERE record_type_code = 'AL'
AND p_email_address > ' ' 
AND id_number IN
    (SELECT id_number
        FROM entity
     WHERE gender_code = 'F');