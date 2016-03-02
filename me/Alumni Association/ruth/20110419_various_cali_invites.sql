/*** Los Angeles ***/
select id_number
from a_dw_address_good
where record_type_code = 'AL'
and p_zipcode BETWEEN '90000-0000' AND '91899-9999'
and id_number NOT IN
    (select id_number from mailing_list where mail_list_code IN ('DNI','DNM'));

/*** Fresno ***/
select id_number
from a_dw_address_good
where record_type_code = 'AL'
and p_zipcode BETWEEN '93650-0000' AND '93888-9999'
and id_number NOT IN
    (select id_number from mailing_list where mail_list_code IN ('DNI','DNM'));

/*** Bakersfield ***/
select id_number
from a_dw_address_good
where record_type_code = 'AL'
and p_zipcode BETWEEN '93200-0000' AND '93399-9999'
and id_number NOT IN
    (select id_number from mailing_list where mail_list_code IN ('DNI','DNM'));