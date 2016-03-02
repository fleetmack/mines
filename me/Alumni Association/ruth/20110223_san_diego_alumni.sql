/*** San Diego Alumni for calling to invite to something ***/
select id_number, pref_mail_name, pref_name_sort, pref_class_year, p_phone_formatted, p_email_address
from a_dw_address_good
where record_type_code = 'AL'
and p_zipcode BETWEEN '91900-0000' and '92199-9999'
and id_number NOT IN
    (select id_number
        from mailing_list
     where mail_list_code IN ('DNP','DNI'))
order by p_phone_formatted DESC;