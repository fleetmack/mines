/*** Phonathon stuff for Kathy - AA non-2006 members who were memebers in past recent years ***/
select distinct a.id_number     as      hostid,
       decode(a.record_type_code,'AL','Alumni','FR','Friend',' ') as  constituency,
       a.pref_class_year        as      pref_class_year,
       n.prefix                 as      prefix,
       n.first_name             as      first_name,
       n.middle_name            as      middle_name,
       n.last_name              as      last_name,
       n.pers_suffix            as      personal_suffix,
       n.prof_suffix            as      professional_suffix,
       n.salutation             as      salutation,
       ' '                      as      spouse_name,
       ' '                      as      degrees,
       a.p_street1              as      address1,
       a.p_street2              as      address2,
       a.p_street3              as      address3,
       a.p_city                 as      city,
       a.p_state_code           as      state,
       substr(a.p_zipcode,1,5)  as      first_5_of_zip,
       substr(a.p_zipcode,7,4)  as      last_4_of_zip,
       a.p_email_address        as      email,
       'N'                      as      phone_1_type,
       a.p_phone_area_code      as      phone1_area_code,
       substr(p_phone_number,1,3) as    phone1_prefix,
       substr(p_phone_number,4,4) as    phone1_number,
       ' '                      as      phone2_type,
       ' '                      as      phone2_area_code,
       ' '                      as      phone2_prefix,
       ' '                      as      phone2_number,
       0                        as      last_gift,
       ' '                      as      last_gift_date,
       ' '                      as      last_gift_allocation,
       ' '                      as      last_gift_club,
       0                        as      largest_gift,
       ' '                      as      largest_gift_date,
       ' '                      as      largest_gift_allocation,
       ' '                      as      last_pledge,
       ' '                      as      last_pledge_date,
       ' '                      as      employer,
       ' '                      as      occupation,
       0                        as      ask_amount1,
       0                        as      ask_amount2,
       0                        as      ask_amount3,
       ' '                      as      employer2,
       ' '                      as      b_address1,
       ' '                      as      b_address2,
       ' '                      as      b_address3,
       ' '                      as      b_city,
       ' '                      as      b_state_code,
       ' '                      as      b_zipcode,
       ' '                      as      b_email_address,
       ' '                      as      b_phone_formatted       
from a_dw_memb      m,
     name           n,
     a_dw_address_good  a
where n.id_number = m.id_number
and a.id_number   = m.id_number
and m.record_type_code = 'AL'
and n.name_type_code = '00'
and a.p_phone_formatted > '  '
and m.record_status_code = 'A' 
and m.p_flag_foreign = 0
and m.id_number not in
    (select m2.id_number 
       from a_dw_memb   m2
      where  m2.memb_type_code IN ('H','L'))
and m.id_Number not in
    (select m3.id_number
       from a_dw_memb   m3
      where m3.memb_year = '2006')
and m.id_number in
    (select m4.id_number
       from a_dw_memb   m4
      where m4.memb_year IN ('2005', '2004','2003','2002','2001')
        and m4.memb_type_code <> 'C')
and m.id_number not in
    (select m5.id_number
       from mailing_list    m5
      where m5.mail_list_code IN ('MDNS','MDNP'))
            