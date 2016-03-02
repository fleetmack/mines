/*** 1953 Class Reunion People ***/
select * from a_dw_address_good
where pref_class_year = '1953'
and flag_omit_from_mail = 0
and record_type_code = 'AL';


/*** All Reunion Mail Merges for FY 03 ***/
SELECT * FROM a_dw_address_good
WHERE pref_class_year IN ('1943','1948','1953','1958','1963','1968','1973','1978','1983','1988','1993')
AND record_type_code = 'AL'
AND id_number IN
    (SELECT id_number
       FROM a_dw_gift_clubs
      WHERE pc_cfy = 1)
