SELECT id_number, record_type_code, record_type_desc, record_status_code, pref_class_year,
        spouse_id, pref_mail_name, mail_mail_name, salutation, pref_name_sort, a_text_ask, flag_dns,
        pfy_giving, highest_5_year, a_comb_seg, ass_pref_mail_name, flag_gift_cfy,
        vol_pref_mail_name, p_email_address, reunion_year
    FROM a_aga_3
  WHERE a_comb_seg IN ('lyb_08',
'lyb_08 – CHK',
'lyb_08 - MEM',
'lyb_2_08',
'lyb_2_08 - MEM',
'lyb_5_08',
'lyb_5_08 - CHK',
'syb_08',
'syb_08 – CHK',
'syb_08 - MEM',
'ya_grad_08',
'frnd_08',
'frnd_mem_08')
   AND flag_gift_cfy <> 1
   AND p_flag_foreign = 1
   AND p_email_address > ' '
   AND id_number NOT IN
    (SELECT id_number
        FROM mailing_list
      WHERE mail_list_code = 'EXE');
