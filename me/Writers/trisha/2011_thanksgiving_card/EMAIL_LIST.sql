/*** Those who received the mailing + those who donated in FY11 or FY12 ***/
select dw.id_number, dw.pref_name_sort, dw.pref_mail_name, e.first_Name, e.last_name, e.salutation, dw.p_email_address
  from a_dw_address_good  dw,
       entity e
 where e.id_number = dw.id_number
   and dw.p_email_address > ' '
   and dw.id_number IN 
  (select id_number
     from a_temp_hold_ids)
UNION
select dw.id_number, dw.pref_name_sort, dw.pref_mail_name, e.first_Name, e.last_name, e.salutation, dw.p_email_address
  from a_dw_address_good dw,
       entity e
 where dw.id_number = e.id_number
   and dw.p_email_address > ' '
   and dw.person_or_org = 'P'
   and dw.id_number IN
    (select id_number
       from a_dw_pyramid
      where year_of_giving IN ('2011','2012')
        and flag_alumni <> '1'
        and flag_non_monthend <> '1')   
ORDER BY pref_name_sort        