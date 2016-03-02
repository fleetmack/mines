/*** Final UG Graduating in Dec10 or May11 ***/
select id_number
from a_temp_hold_ids
where id_number in
    (select id_number from entity_record_type where record_type_code = 'ST')
and id_number not in
    (select id_number from entity_record_type where record_type_code = 'GS');
commit;

select person_or_org,
id_number,
record_type_desc,
pref_class_year,
pref_jnt_mail_name,
jnt_salutation,
p_addr_type_code,
p_company_name_1,
p_company_name_2,
p_business_title,
p_street1,
p_street2,
p_street3,
p_zipcode,
p_cityline,
p_foreign_cityzip,
p_country_desc,
p_flag_foreign,
flag_mines_mag,
pref_name_sort,
record_type_code,
p_country_code
from a_dw_address_good
where id_number IN
    (select id_number from a_temp_hold_ids
           where id_number in
            (select id_number from entity_record_type where record_type_code = 'ST')
            and id_number not in
            (select id_number from entity_record_type where record_type_code = 'GS'));