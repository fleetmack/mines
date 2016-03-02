--I would like a list of all companies located in Canada that have either a contact report, gift or prospect plan associated with it. 
select id_number, pref_mail_Name, pref_name_sort, p_company_name_1, p_company_name_2,
       p_street1,
       p_street2,
       p_street3,
       p_foreign_cityzip,
       p_phone_formatted
from a_dw_address_good
where id_number IN
(--gift associated with
select id_number
from a_dw_address_good
where person_or_org = 'O'
  and p_country_code = 'CD'
  and id_number IN
    (select id_number from a_dw_pyramid)
UNION
--contact report associated with
select id_number
from a_dw_address_good
where person_or_org = 'O'
  and p_country_code = 'CD'
  and id_number IN
    (select id_number from contact_report)
UNION
--prospect plan associated with
select id_number
from a_dw_address_good
where person_or_org = 'O'
  and p_country_code = 'CD'
  and id_number IN
    (select id_number from prospect_entity)
)