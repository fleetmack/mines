select distinct id_number
FROM employment
WHERE employer_id_number IN ('0000020910', --faculty
                                                    '0000017894', --administrative faculty
                                                    '0000019431', --staff
                                                    '0000034805', --UA
                                                    '0000042725', --Foundation Business office
                                                    '0000018591') --Alumni Association
    AND job_status_code = 'C'
    AND employ_relat_code IN ('PE','CE');