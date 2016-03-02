/*** Current Corporate Contacts ***/
select id_number, pref_mail_name, pref_name_sort, b_company_name_1
from a_dw_address_good
where id_number IN
(select contact_id_number
from contact
where contact_code IN
('CC')
and contact_id_number IN
    (select id_number from entity where record_status_code = 'A'))
order by pref_name_sort    