/*** Current Parents ***/    
select count(*) as current_parents
FROM entity
WHERE record_status_code = 'A'
and (record_type_code = 'PA' OR (record_type_code = 'AL' AND id_number IN (SELECT id_number FROM entity_record_type WHERE record_type_code = 'PA')));


/*** Active Parents with Good Address ***/
select count(*) as parents_with_mail_address
FROM entity
WHERE record_status_code = 'A'
and (record_type_code = 'PA' OR (record_type_code = 'AL' AND id_number IN (SELECT id_number FROM entity_record_type WHERE record_type_code = 'PA')))
and id_number IN
    (select id_number from a_dw_address_good);

/*** Current Parents with Email Address ***/
select count(*) parents_with_email_address
FROM a_dw_address_good
WHERE (record_type_code = 'PA' OR (record_type_code = 'AL' AND id_number IN (SELECT id_number FROM entity_record_type WHERE record_type_code = 'PA')))
and p_email_address > ' ';