/*** Graduating Senior Parents who have not given this year ***/
/*** Note: requires pulling an up-to-date list from discoverer and loading that list into a_temp_hold_ids ***/
SELECT dw.id_number
FROM a_dw_address_good   dw
WHERE dw.id_number IN (select ert1.id_number FROM entity_record_type ert1 where ert1.record_type_code = 'PA')
AND dw.id_number IN (select ip.id_number from ids ip where dw.id_number = ip.id_number and ip.ids_type_code = 'CI1' and ip.other_id IN
                                        (select i2.id_number from a_temp_hold_ids i2))
AND dw.flag_dns <> '1'
AND dw.flag_omit_from_mail <> '1'
AND dw.id_number NOT IN
    (select dwj.id_number from a_dw_jobs  dwj where dwj.employ_relat_code = 'PE' and dwj.job_status_code = 'C' and dwj.employer_id_number IN ('0000020910','0000017894','0000019431'))
AND dw.id_number NOT IN
    (select e2.spouse_id_number FROM entity e2 WHERE e2.id_number IN
        (select dwj2.id_number from a_dw_jobs  dwj2 where dwj2.employ_relat_code = 'PE' and dwj2.job_status_code = 'C' and dwj2.employer_id_number IN ('0000020910','0000017894','0000019431')))
AND dw.id_number NOT IN
    (select a.id_number from a_dw_pyramid a where a.date_of_record BETWEEN '20090701' and '20100630' and flag_alumni <> '1');

/*** Non-Graduating Seniors Parents who have not given this year ***/
SELECT dw.id_number
FROm a_dw_address_good   dw
WHERE dw.id_number IN (select ert1.id_number FROM entity_record_type ert1 where ert1.record_type_code = 'PA')
AND dw.id_number NOT IN (select ip.id_number from ids ip where dw.id_number = ip.id_number and ip.ids_type_code = 'CI1' and ip.other_id IN
                                        (select i2.id_number from a_temp_hold_ids i2))
AND dw.flag_dns <> '1'
AND dw.id_number NOT IN
    (select dwj.id_number from a_dw_jobs  dwj where employ_relat_code = 'PE' and job_status_code = 'C' and employer_id_number IN ('0000020910','0000017894','0000019431'))
AND dw.id_number NOT IN
    (select e2.spouse_id_number FROM entity e2 WHERE e2.id_number IN
        (select dwj2.id_number from a_dw_jobs  dwj2 where dwj2.employ_relat_code = 'PE' and dwj2.job_status_code = 'C' and dwj2.employer_id_number IN ('0000020910','0000017894','0000019431')))
AND dw.flag_omit_from_mail <> '1'
AND dw.id_number NOT IN
    (select a.id_number from a_dw_pyramid a where a.date_of_record BETWEEN '20090701' and '20100630' and flag_alumni <> '1');

/***
1) Graduating Seniors Parents who Have not givein in FY10
2) All other parents who have not given in FY10
***/