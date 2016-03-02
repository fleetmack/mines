--2879 = Wrestling Discretionary Fund
--821 = Jack Hancock Endowment
--4097 = Jack Hancock Endowed Scholarship


--Name, address, phone, email, date of gift, gift amount, gift account
/*** Those who gave to any of these in FY08 ***/
SELECT distinct(id_number), pref_mail_name, pref_name_sort
   FROM a_dw_pyramid            d
WHERE alloc IN ('2879','4097','821')
     AND year_of_giving = '2008';
     
/*** Hancock Scholarship since 2002 ***/     
SELECT distinct(id_number), pref_mail_name
   FROM a_dw_pyramid
WHERE alloc IN ('4097','821')
     AND year_of_giving >= '2002';