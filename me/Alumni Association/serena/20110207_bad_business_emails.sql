/**** Bad Business Emails for Serena ***/
/*** This is where they have an additonal email address other than their bad business one ***/
select distinct f.id_number, 
          e.pref_mail_name, 
          a2.email_address as non_business_email,
          a.email_address as business_email, 
          a.companY_name_1, 
          a.company_name_2, 
          a.business_title,
          a.street1,
          a.street2,
          a.street3,
          a.city,
          a.state_code,
          a.zipcode
from fix_imods_emails  f,
        address               a,
        entity                  e,
        address               a2
where f.id_number = a.id_number
and    a.id_number = a2.id_number
and    a2.email_address > ' '
and    a.addr_type_code = 'B'
and    a2.addr_type_code <> 'B'
and    e.id_number = a.id_number
and    lower(a.email_address) = lower(f.email_address);