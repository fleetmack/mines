/*** MEP Data ***/
select  e.id_number,
          e.last_name,
          e.first_name,
          e.middle_name,
          e.pref_mail_name,
          e.pref_name_sort,
          i.other_id cwid,
          e.gender_code,
        DECODE(e.record_type_code, 'AL','Alumni','GS','Current Grad Student','ST','Current Student','SF','Did Not Graduate','Was Never A Student') exit_action,
        dwdc.degrees,
        e.pref_class_year,
        e.record_type_code,
        dw.h_street1,
        dw.h_street2,
        dw.h_city,
        dw.h_state_code,
        dw.h_zipcode,
        dw.h_phone_formatted,
        dw.h_email_address,
        dw.b_company_name_1,
        dw.b_company_name_2,
        dw.b_business_title,
        dw.b_street1,
        dw.b_street2,
        dw.b_cityline,
        dw.b_city,
        dw.b_state_code,
        dw.b_zipcode,
        dw.b_phone_formatted,
        dw.b_email_address,
        max(DECODE(substr(dwd.grad_dt,5,2),'05','Spring'||' '||substr(dwd.grad_dt,1,4),
                                                            '06','Field'||' '||substr(dwd.grad_dt,1,4),
                                                            '08','Summer'||' '||substr(dwd.grad_dt,1,4),
                                                            '12','Fall'||' '||substr(dwd.grad_dt,1,4),
                                                            DECODE(dwd.grad_dt, NULL, 'No Degree', 'Unknown Term'||' '||substr(dwd.grad_dt,1,4))))        exit_term
from entity   e,
        ids       i,
        a_dw_address_good   dw,
        a_dw_degrees   dwd,
        a_dw_degree_count  dwdc
where i.id_number(+) = e.id_number
and    dwdc.id_number(+) = e.id_number
and    dw.id_number(+) = e.id_number
and    dwd.id_number(+) = e.id_number
and    e.record_status_code = 'A'
and    dw.flag_dns <> '1'
and    dw.flag_omit_from_mail <> '1'
and    e.id_number IN
        (select id_number from student_activity where student_activity_code = 'MEP' )
group by e.id_number,
          e.last_name,
          e.first_name,
          e.middle_name,
          e.pref_mail_name,
          e.pref_name_sort,
          i.other_id,
          e.gender_code,
        DECODE(e.record_type_code, 'AL','Alumni','GS','Current Grad Student','ST','Current Student','SF','Did Not Graduate','Was Never A Student'),
        dwdc.degrees,
        e.pref_class_year,
        e.record_type_code,
        dw.h_street1,
        dw.h_street2,
        dw.h_city,
        dw.h_state_code,
        dw.h_zipcode,
        dw.h_phone_formatted,
        dw.h_email_address,
        dw.b_company_name_1,
        dw.b_company_name_2,
        dw.b_business_title,
        dw.b_street1,
        dw.b_street2,
        dw.b_cityline,
        dw.b_city,
        dw.b_state_code,
        dw.b_zipcode,
        dw.b_phone_formatted,
        dw.b_email_address
--NEED 1430 PEOPLE