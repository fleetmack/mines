SELECT count(*) total_alums_in_alaska
FROM a_dw_address_good
WHERE record_type_code = 'AL'
and p_state_code = 'AK';

SELECT count(*) young_alums_in_alaska
FROM a_dw_address_good
WHERE record_type_code = 'AL'
and p_state_code = 'AK'
and pref_class_year >= '2000';



SELECT count(*) total_alums_in_alaska_donors
FROM a_dw_address_good
WHERE record_type_code = 'AL'
and p_state_code = 'AK'
and id_number IN
    (select id_number from a_dw_pyramid where flag_alumni <> '1');

SELECT count(*) young_alums_in_alaska_donors
FROM a_dw_address_good
WHERE record_type_code = 'AL'
and p_state_code = 'AK'
and pref_class_year >= '2000'
and id_number IN
    (select id_number from a_dw_pyramid where flag_alumni <> '1');


