CREATE OR REPLACE PROCEDURE         ADVANCE.CSM_MAPABLE_LISTING
(i_geo_desc VARCHAR2,
 RC1 IN OUT refcur_pkg.rc)
AS

/*---------------------------------------------------------------------------------------
                          MY SCHEDULED TASKS
The My proposal aging

01/12/2011      JYY(SGHE)    Creation
*/--------------------------------------------------------------------------------------


BEGIN


      OPEN RC1 FOR
      SELECT id_number,
             pref_mail_name as name, 
             'H' as addr_type_code,
             ' ' as employment, 
             DECODE(h_street2,' ',h_street1, h_street2||', '||h_street1) as street1, 
             h_city as city, 
             h_state_code as state_code, 
             h_zipcode as zipcode, 'US' country,
             h_phone_formatted as phone,
             h_cell_formatted as cell,
             NVL((select d.rp_mgc_desc from a_dw_demop_prof d where d.id_number = a.id_number),' ') as rating,
             NVL((select d.ass_pref_mail_name from a_dw_assignment_pm d where d.id_number = a.id_number),' ') as manager,
             h_geo_desc as geo_desc
        FROM a_dw_address_good a
       WHERE h_geo_desc = i_geo_desc
         AND person_or_org = 'P'
         AND h_street1 not like 'PO%'
         AND id_number NOT IN (SELECT id_number FROM mailing_list WHERE mail_list_code IN ('DNS','DNM'))
         
      UNION
      
      SELECT id_number,
             pref_mail_name as name, 
             'B' as addr_type_code,
             b_company_name_1||', '||b_business_title as company_title,
             DECODE(b_street2,' ',b_street1, b_street2||', '||b_street1) as street1, 
             b_city as city, 
             b_state_code as state_code, 
             b_zipcode as zipcode, 'US' country,
             b_phone_formatted as phone,
             b_cell_formatted as cell,
             NVL((select d.rp_mgc_desc from a_dw_demop_prof d where d.id_number = a.id_number),' ') as rating,
             NVL((select d.ass_pref_mail_name from a_dw_assignment_pm d where d.id_number = a.id_number),' ') as manager,
             b_geo_desc as geo_desc
        FROM a_dw_address_good a
       WHERE b_geo_desc = i_geo_desc
         AND person_or_org = 'P'
         AND b_street1 not like 'PO%'
         AND id_number NOT IN (SELECT id_number FROM mailing_list WHERE mail_list_code IN ('DNS','DNM'))
         ;

END csm_mapable_listing
;
