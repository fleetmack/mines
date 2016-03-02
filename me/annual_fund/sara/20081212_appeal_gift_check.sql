/*** Find people from certain segments who gave before their appeal was entered ***/
SELECT *
FROM a_aga_3
where a_comb_seg IN
 ('ya_lyb_09',
'ya_nvr_1_09',
'ya_nvr_1_09 - PM',
'ya_nvr_2_09',
'ya_nvr_2_09 - CHK',
'ya_pc_09',
'ya_pc_09 - PM',
'ya_syb_09',
'ya_syb_09 - PM')
and id_number NOT IN  ('0000009100','0000012568')
and flag_gift_cfy = '1'
and flag_del_spouse2 = 0
and id_number IN
    (select id_number
    from a_dw_pyramid
    where date_of_record > '20081115')
    
    
    

/***
 ('par_09',
'par_09 - CHK',
'par_09 - PM',
'par_al_09',
'par_al_09 - CHK',
'par_al_09 - PM',
'par_f_09',
'par_f_09 - PM',
'par_nvr_09',
'par_nvr_09 - CHK')
***/