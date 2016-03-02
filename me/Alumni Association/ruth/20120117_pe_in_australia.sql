/***
do you have a listing of our PE alums in Perth, Australia, that you could get me? It is likely that Ramona Graves and I are going there in February, and would like to touch base with some of them.
***/

select id_number, pref_mail_name, pref_jnt_mail_name, p_company_name_1, p_business_title, p_street1, p_street2, p_street3, p_foreign_cityzip, p_email_address, p_phone_formatted
from a_dw_address_good
where record_type_code = 'AL'
  and p_country_code   = 'AU'
  and id_number IN
    (select id_number from a_dw_degrees where dept_code = 'PET')
  and id_number NOT IN
    (select id_number from mailing_list where mail_list_code  IN ('DNM','DNS','DNI'))
order by p_foreign_cityzip  