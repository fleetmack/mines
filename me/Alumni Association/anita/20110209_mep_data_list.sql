/*** MEP Grads Spring 2010 and Fall 2010 ***/
select distinct(d.id_number),
        ad.pref_mail_name,
        ad.pref_name_sort,
        d.grad_dt,
        ad.h_street1,
        ad.h_street2,
        ad.h_street3,
        ad.h_city,
        ad.h_state_code,
        ad.h_zipcode,
        ad.h_country_code,
        ad.h_phone_formatted,
        ad.h_email_address,
        ad.b_company_name_1, 
        ad.b_company_name_2,
        ad.b_business_title,       
        ad.b_street1,
        ad.b_street2,
        ad.b_street3,
        ad.b_city,
        ad.b_state_code,
        ad.b_zipcode,
        ad.b_country_code,
        ad.b_phone_formatted,
        ad.b_email_address,
        (CASE
        WHEN d.id_number IN (select m1.id_number from mailing_list m1 where m1.mail_list_code = 'DNS') THEN 'X' ELSE ' '
        END) do_not_solicit,
        (CASE
        WHEN d.id_number IN (select m1.id_number from mailing_list m1 where m1.mail_list_code = 'DNP') THEN 'X' ELSE ' '
        END) do_not_phone,
        (CASE
        WHEN d.id_number IN (select m1.id_number from mailing_list m1 where m1.mail_list_code = 'DNI') THEN 'X' ELSE ' '
        END) do_not_invite,
        (CASE
        WHEN d.id_number IN (select m1.id_number from mailing_list m1 where m1.mail_list_code = 'DNM') THEN 'X' ELSE ' '
        END) do_not_mail,
        (CASE
        WHEN d.id_number IN (select m1.id_number from mailing_list m1 where m1.mail_list_code = 'EXE') THEN 'X' ELSE ' '
        END) do_not_email,
        (CASE
        WHEN d.id_number IN (select d2.id_number from a_dw_degrees d2 where d2.institution_code = '1' and grad_dt < '20100514' and degree_code <> '401') THEN 'X' ELSE ' '
        END) not_first_mines_degree
from a_dw_degrees   d,
        student_activity  s,
        a_dw_address_good  ad
where d.id_number = s.id_number
and ad.id_number(+) = d.id_number
and d.degree_code <> '401'
and d.institution_code = '1'
and s.student_activity_code = 'MEP'
and d.grad_dt IN ('20101217','20100514')