/*** Albuquerque People for external email for invite ***/
select id_number,
       pref_mail_name,
       pref_name_sort,
       pref_class_year,
       p_email_address,
       p_cityline
  from a_dw_address_good
 where record_type_code = 'AL'
   and p_zipcode BETWEEN '87000-0000' AND '87299-9999'
   and p_email_address > ' '
   and id_number NOT IN
    (select id_number from mailing_list where mail_list_code in ('DNI','DNM'))
order by p_cityline;