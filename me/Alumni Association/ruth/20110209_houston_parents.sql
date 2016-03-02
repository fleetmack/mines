/*** Parents of Current Students in Houston -- Invite ***/
select p_email_address
from a_dw_address_good
where p_zipcode BETWEEN '77000-0000' AND '77899-9999'
and p_email_address > ' '
and id_number in
    (select id_number from entity_record_type where record_type_code = 'PA')
and id_number NOT IN
    (select id_number from mailing_list where mail_list_code = 'DNI');


/*** Geology/Geophysics alumni - all ***/
select p_email_address
from a_dw_address_good ad
where ad.p_email_address > ' '
and    ad.record_type_code = 'AL'
and    ad.id_number IN
    (select d.id_number
       from a_dw_degrees   d
     where  d.dept_code IN ('GEOP','GEOL'))
and ad.id_number NOT IN
    (select m.id_number from mailing_list m where m.mail_list_code = 'DNI');