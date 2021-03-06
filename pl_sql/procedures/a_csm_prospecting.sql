CREATE OR REPLACE PROCEDURE           ADVANCE.A_CSM_PROSPECTING 
(i_geo_code VARCHAR2,
 RC1 IN OUT refcur_pkg.rc)
AS

/*---------------------------------------------------------------------------------------
                          MY SCHEDULED TASKS
The My proposal aging

01/12/2011      JYY(SGHE)    Creation
*/--------------------------------------------------------------------------------------


BEGIN


      OPEN RC1 FOR
      select a.id_number,
       a.pref_mail_name, 
       a.pref_name_sort,
       a.pref_class_year,
       a.record_type_code,
       NVL(d.degrees,' ') as degrees,
       af.donor_continuum as affinity,
       NVL(dp.rp_mgc_code,' ') as rp_mgc_code,
       NVL(dp.rp_mgc_desc,' ') as rp_mgc_desc,
       NVL(dp.rp_mgc_value, 0) as rp_mgc_value,
       NVL(ass.ass_pref_mail_name, ' ') as ass_pref_mail_name,
       nvl(ass.ass_type, ' ') as ass_type,
       a.p_phone_formatted,
       a.p_cell_formatted,
       a.p_email_address,
       a.h_phone_formatted,
       a.h_cell_formatted,
       a.b_phone_formatted,
       a.b_cell_formatted,
       a.b_email_address
  from a_dw_address_good a,
       a_dw_affinity af,
       a_dw_degree_count d,
       a_dw_demop_prof dp,
       a_dw_assignment_pm ass
 where a.id_number = af.id_number
   and a.id_number = d.id_number (+)
   and a.id_number = dp.id_number (+)
   and a.id_number = ass.id_number (+)
   and (a.h_geo_code = i_geo_code
    or a.b_geo_code = i_geo_code)
   and a.person_or_org = 'P'
   and a.id_number NOT IN (SELECT id_number FROM mailing_list WHERE mail_list_code IN ('DNS','DNM'));

END a_csm_prospecting
;
 