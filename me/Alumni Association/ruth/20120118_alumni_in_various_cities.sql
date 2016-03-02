/***
•	Tulsa/Western AR – 74000-74499;
•	OKC/Western OK – 73000-73999
•	Dallas/Ft. Worth – 75000-76399
•	Houston – 77000-77899
***/

/*** 1 - Tulsa ***/
select id_number
  from a_dw_address_good
 where record_type_code = 'AL'
   and p_zipcode BETWEEN '74000-0000' AND '74499-9999'
   and id_number NOT IN
    (select id_number
       from mailing_list
      where mail_list_code IN ('DNM','DNI'));
 
/*** 2 - Oklahoma City  ***/
select id_number
  from a_dw_address_good
 where record_type_code = 'AL'
   and p_zipcode BETWEEN '73000-0000' AND '73999-9999'
   and id_number NOT IN
    (select id_number
       from mailing_list
      where mail_list_code IN ('DNM','DNI'));

/*** 3 - Dallas ***/
/*** DONE!! Run through program now... ***/
select id_number
  from a_dw_address_good
 where record_type_code = 'AL'
   and p_zipcode BETWEEN '75000-0000' AND '76399-9999'
   and id_number NOT IN
    (select id_number
       from mailing_list
      where mail_list_code IN ('DNM','DNI'));

/*** 4 - Houston ***/
/*** DONE!! Run through program now... ***/
select id_number
  from a_dw_address_good
 where record_type_code = 'AL'
   and p_zipcode BETWEEN '77000-0000' AND '77899-9999'
   and id_number NOT IN
    (select id_number
       from mailing_list
      where mail_list_code IN ('DNM','DNI'));