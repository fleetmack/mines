/*** Campus employees who are parents ***/
select id_number
from a_dw_address_good
where id_number in
    (select id_number from entity_record_type where record_type_code = 'PA')
and id_number in
    (select id_number from a_dw_jobs where employer_id_number IN ('0000020910',
                                                                                                         '0000017894',
                                                                                                         '0000019431',
                                                                                                         '0000034805',
                                                                                                         '0000018591')
        and employ_relat_code = 'PE' and job_status_code = 'C')
and flag_omit_from_mail <> '1';
