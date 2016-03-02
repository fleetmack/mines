/*** All Alumni with no email address **/
select id_number
  from a_dw_address_good
 where record_type_code = 'AL'
   and p_email_address <= ' '
   and id_number NOT IN
        (SELECT id_number FROM mailing_list WHERE mail_list_code IN ('DNM','DNI'))