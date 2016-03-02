/*** Young Alumni Memb Details Past 3 Years ***/
select e.id_number, 
       e.pref_mail_name,
       e.pref_name_sort,
       e.pref_class_year,
       (CASE
        WHEN e.id_number IN (select id_number from a_dw_memb where memb_year = '2010') THEN 'X'
        ELSE ' '
        END) fy10,
        (CASE
        WHEN e.id_number IN (select id_number from a_dw_memb where memb_year = '2011') THEN 'X'
        ELSE ' '
        END) fy11,
        (CASE
        WHEN e.id_number IN (select id_number from a_dw_memb where memb_year = '2012') THEN 'X'
        ELSE ' '
        END) fy12,
        (select max(m.memb_type_desc)
           from a_dw_memb m 
          where m.id_number = e.id_number
            and m.memb_year =
                (select max(m2.memb_year) 
                   from a_dw_memb m2 
                  where m2.id_number = e.id_number)) most_recent_memb_type,
       dw.p_company_name_1,
       dw.p_company_name_2,
       dw.p_business_title,
       dw.p_care_of,
       dw.p_street1,
       dw.p_street2,
       dw.p_street3,
       dw.p_cityline,
       dw.p_foreign_cityzip,
       dw.p_country_code,
       dw.p_email_address,
       dw.p_phone_formatted
from entity  e,
     a_dw_address_good dw
where dw.id_number(+) = e.id_number
and e.record_type_code = 'AL'
and e.pref_class_year BETWEEN '2002' AND '2011'
order by fy10 DESC, fy11 DESC, fy12 DESC
