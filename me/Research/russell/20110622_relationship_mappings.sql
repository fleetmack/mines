select r.id_number,  e.pref_mail_name, nvl(dw.p_city,'Unknown'), nvl(dw.p_state_code,'Unknown'),
       t.short_desc relat1_desc, e2.id_number relat1_id, e2.pref_mail_name relat1_name,
       --need to do max(decode) for the relatives

(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'BB') THEN '1' ELSE '0' END) baseball,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'BKB') THEN '1' ELSE '0' END) basketball,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'CC') THEN '1' ELSE '0' END) cross_country,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'FB') THEN '1' ELSE '0' END) football,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'GOLF') THEN '1' ELSE '0' END) golf,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'LAC') THEN '1' ELSE '0' END) lacrosse,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'RG') THEN '1' ELSE '0' END) rugby,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'SB') THEN '1' ELSE '0' END) softball,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'SKI') THEN '1' ELSE '0' END) skiing,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'SWIM') THEN '1' ELSE '0' END) swimming,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'SOC') THEN '1' ELSE '0' END) soccer,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'TEN') THEN '1' ELSE '0' END) tennis,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'TF') THEN '1' ELSE '0' END) track_and_field,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'VB') THEN '1' ELSE '0' END) volleyball,
(CASE WHEN r.id_number IN (select sp.id_number from sport sp where sp.sport_code = 'WR') THEN '1' ELSE '0' END) wrestling,
       
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'ASCSM') THEN '1' ELSE '0' END) ascsm,     
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'BAND') THEN '1' ELSE '0' END) band,   
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'CH') THEN '1' ELSE '0' END) choir, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'OOO') THEN '1' ELSE '0' END) order_of_omega, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'MHA') THEN '1' ELSE '0' END) mcbride,
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'BK') THEN '1' ELSE '0' END) blue_key_honor,
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'HSKKP') THEN '1' ELSE '0' END) kappa_kappa_psi_honor, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSTBP') THEN '1' ELSE '0' END) tau_beta_pi_honor, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'HSPET') THEN '1' ELSE '0' END) pi_epsilon_tau_honor, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'HSSGE') THEN '1' ELSE '0' END) sigma_gamma_epsilon_honor, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'TT') THEN '1' ELSE '0' END) theta_tau_honor, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSAGD') THEN '1' ELSE '0' END) sor_alpha_gamma_delta,
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSAP') THEN '1' ELSE '0' END) sor_alpha_phi, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSPBP') THEN '1' ELSE '0' END) sor_pi_beta_phi, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSSK') THEN '1' ELSE '0' END) sor_sigma_kappa, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSATO') THEN '1' ELSE '0' END) frat_alpha_phi_omega, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSBTP') THEN '1' ELSE '0' END) frat_beta_theta_pi, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSKS') THEN '1' ELSE '0' END) frat_kappa_sigma, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSPGD') THEN '1' ELSE '0' END) frat_phi_gamma_delta, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSSAE') THEN '1' ELSE '0' END) frat_sigma_alpha_epsilon, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSSN') THEN '1' ELSE '0' END) frat_sigma_nu, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSSPE') THEN '1' ELSE '0' END) frat_sigma_phi_epsilon, 
(CASE WHEN r.id_number IN (select sa.id_number from student_activity sa where sa.student_activity_code = 'FSAPO') THEN '1' ELSE '0' END) service_frat_alpha_phi_omega,
--LARGEST GIFT
NVL((select LTRIM(TO_CHAR(max(py.associated_amount+associated_amount_match+associated_amount_claim+associated_amount_joint),'$99,999,999,999.99'),' ')
from a_dw_pyramid py where py.id_number = r.id_number),0) largest_gift,
--LAST GIFT
NVL((select max(py2.date_of_record) from a_dw_pyramid py2 where py2.id_number = r.id_number),'Never') last_gift_date
     
from relationship r, 
     entity e, 
     entity e2, 
     a_dw_address_good dw,
     tms_relationships t
where r.id_number=e.id_number
and e2.id_number = r.relation_id_number
and dw.id_number(+) = e.id_number
and t.relation_type_code = r.relation_type_code        