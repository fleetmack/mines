select a.id_number,
       a.pref_mail_name,
       a.p_email_address,
       a.p_street1,
       a.p_street2,
       a.p_street3,
       a.p_cityline,
       a.p_phone_formatted,
       d.degree_year,
       d.degree_level_desc,
       d.degree_type_desc,
       d.major_code1_desc,
       d.major_code2_desc,
       j.employer_name1,
       j.employer_name2,
       j.job_title
FROM   a_dw_address_good     a,
       a_dw_jobs            j,
       a_dw_degrees         d
 where d.id_number = a.id_number
   and j.id_number = a.id_number
   and a.record_type_code = 'AL'
   and a.p_state_code = 'CO'
   and a.pref_class_year between '1980' and '2000'
   and d.degree_type = 'G'
   and j.job_status_code = 'C';


