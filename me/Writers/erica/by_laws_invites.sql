/*** By-Laws Meetings ***/
/**************************************************/
/******************* List 1 ***********************/
/******* PC07 and/or PC08 Alumni In Denver Area ***/
/************* No Alumni Faculty ******************/
/**************************************************/
SELECT dw.id_number, e.pref_mail_name, e.pref_name_sort, e.salutation, dwa.p_phone_formatted, dwa.p_cityline
  FROM a_dw_gift_clubs      dw,
       entity               e,
       a_dw_address_good    dwa
 WHERE e.id_number          = dw.id_number
   AND dw.id_number         = dwa.id_number
   AND dwa.p_zipcode BETWEEN '80000' and '80505'
   AND dw.record_type_code = 'AL'
   AND (dw.pc07 = '1' OR dw.pc08 = '1')
   AND dw.id_number NOT IN
    (SELECT id_number
       FROM employment
      WHERE employer_id_number = '0000019431'
        AND job_status_code = 'C'
        AND employ_relat_code = 'PE');
        
        
/**************************************************/
/******************* List 2 ***********************/
/******** Mines Faculty who are Alumni ************/
/**************************************************/
    (SELECT e.id_number, en.pref_mail_name, e.job_title, en.pref_name_sort, en.salutation, dwa.p_cityline, dwa.p_phone_formatted
       FROM employment  e,
            entity      en,
            a_dw_address_good   dwa
      WHERE e.id_number = en.id_number
        AND dwa.id_number(+) = en.id_number
        AND e.employer_id_number = '0000019431'
        AND e.job_status_code = 'C'
        AND e.employ_relat_code = 'PE'
        AND en.record_type_code = 'AL');

/**************************************************/
/******************* List 3 ***********************/
/******** All Alumni in Denver Area ***************/
/**************************************************/
SELECT id_number
  FROM a_dw_address_good
 WHERE record_type_code = 'AL'
   AND p_zipcode BETWEEN '80000' AND '80599';