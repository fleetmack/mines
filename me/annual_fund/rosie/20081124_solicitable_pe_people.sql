  /*** Put This In a_aga_mail_list_1_editable_segments to show all domestic, non-marquez-hall solicitables ***/
  SELECT "ADVANCE"."A_AGA_3"."RECORD_TYPE_CODE",   
         "ADVANCE"."A_AGA_3"."ID_NUMBER",   
         "ADVANCE"."A_AGA_3"."RECORD_TYPE_DESC",   
         "ADVANCE"."A_AGA_3"."RECORD_STATUS_CODE",   
         "ADVANCE"."A_AGA_3"."PREF_CLASS_YEAR",   
         "ADVANCE"."A_AGA_3"."SPOUSE_ID",   
         "ADVANCE"."A_AGA_3"."PREF_MAIL_NAME",   
         "ADVANCE"."A_AGA_3"."MAIL_MAIL_NAME",   
         "ADVANCE"."A_AGA_3"."SALUTATION",   
         "ADVANCE"."A_AGA_3"."PREF_NAME_SORT",   
         "ADVANCE"."A_AGA_3"."P_CARE_OF",   
         "ADVANCE"."A_AGA_3"."P_COMPANY_NAME_1",   
         "ADVANCE"."A_AGA_3"."P_COMPANY_NAME_2",   
         "ADVANCE"."A_AGA_3"."P_BUSINESS_TITLE",   
         "ADVANCE"."A_AGA_3"."P_STREET1",   
         "ADVANCE"."A_AGA_3"."P_STREET2",   
         "ADVANCE"."A_AGA_3"."P_STREET3",   
         "ADVANCE"."A_AGA_3"."P_CITYLINE",   
         "ADVANCE"."A_AGA_3"."P_FOREIGN_CITYZIP",   
         "ADVANCE"."A_AGA_3"."P_COUNTRY_DESC",   
         "ADVANCE"."A_AGA_3"."P_FLAG_FOREIGN",   
         "ADVANCE"."A_AGA_3"."P_ZIPCODE",   
         "ADVANCE"."A_AGA_3"."P_STATE_CODE",   
         "ADVANCE"."A_AGA_3"."A_TEXT_ASK",   
         "ADVANCE"."A_AGA_3"."A_TEXT_YA_ASK",   
         "ADVANCE"."A_AGA_3"."FLAG_DNS",   
         "ADVANCE"."A_AGA_3"."PFY_GIVING",   
         "ADVANCE"."A_AGA_3"."HIGHEST_5_YEAR",   
         "ADVANCE"."A_AGA_3"."A_COMB_SEG",   
         "ADVANCE"."A_AGA_3"."ASS_PREF_MAIL_NAME",   
         "ADVANCE"."A_AGA_3"."FLAG_GIFT_CFY",   
         "ADVANCE"."A_AGA_3"."VOL_PREF_MAIL_NAME",   
         "ADVANCE"."A_AGA_3"."FLAG_MPMS",   
         "ADVANCE"."A_AGA_3"."REUNION_YEAR",   
         "ADVANCE"."A_AGA_3"."MATCHED_PFY_TEXT",   
         "ADVANCE"."A_AGA_3"."MEM_FIRST",   
         "ADVANCE"."A_AGA_3"."MEM_LAST"  
    FROM "ADVANCE"."A_AGA_3"  
   WHERE ADVANCE.A_AGA_3.FLAG_DEL_SPOUSE2 = 0  and 
		ADVANCE.A_AGA_3.p_flag_foreign <> 1 and
         ADVANCE.A_AGA_3.ID_NUMBER in 
(select id_number from a_dw_degrees
where dept_code = 'PET'
and institution_code = '1')
and advance.a_aga_3.id_number NOT IN
	(select id_number
 from a_dw_pyramid
where alloc IN ('5478','5378'))