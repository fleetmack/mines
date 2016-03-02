/*** Count Parent Emails by Student Class year ***/
select count(*) freshmen
from a_dw_address_good
where p_email_address > ' '
and id_number in
    (select id_number from entity_record_type where record_type_code = 'PA' and class_year = '2014' and id_number in
        (select id_number from ids where ids_type_code = 'CI1' and other_id IN
            (select other_id from ids where ids_type_code = 'CID' and id_number IN
                (select id_number FROM entity_record_type where record_type_code = 'ST')))
);

select count(*) sophomores
from a_dw_address_good
where p_email_address > ' '
and id_number in
    (select id_number from entity_record_type where record_type_code = 'PA' and class_year = '2013' and id_number in
        (select id_number from ids where ids_type_code = 'CI1' and other_id IN
            (select other_id from ids where ids_type_code = 'CID' and id_number IN
                (select id_number FROM entity_record_type where record_type_code = 'ST')))
);

select count(*) juniors
from a_dw_address_good
where p_email_address > ' '
and id_number in
    (select id_number from entity_record_type where record_type_code = 'PA' and class_year = '2012' and id_number in
        (select id_number from ids where ids_type_code = 'CI1' and other_id IN
            (select other_id from ids where ids_type_code = 'CID' and id_number IN
                (select id_number FROM entity_record_type where record_type_code = 'ST')))
);

select count(*) seniors
from a_dw_address_good
where p_email_address > ' '
and id_number in
    (select id_number from entity_record_type where record_type_code = 'PA' and class_year = '2011' and id_number in
        (select id_number from ids where ids_type_code = 'CI1' and other_id IN
            (select other_id from ids where ids_type_code = 'CID' and id_number IN
                (select id_number FROM entity_record_type where record_type_code = 'ST')))
);

select count(*) seniors
from a_dw_address_good
where p_email_address > ' '
and id_number in
    (select id_number from entity_record_type where record_type_code = 'PA' and id_number in
        (select id_number from ids where ids_type_code = 'CI1' and other_id IN
            (select other_id from ids where ids_type_code = 'CID' and id_number IN
                (select id_number FROM entity_record_type where record_type_code = 'GS')))
);