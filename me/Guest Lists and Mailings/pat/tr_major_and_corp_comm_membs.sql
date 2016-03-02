/*** TR Major and Corporate Committee Members ***/
SELECT id_number
FROM COMMITTEE
WHERE COMMITTEE_CODE IN ('TRCRC','TRMGC')
AND COMMITTEE_STATUS_CODE = 'A'