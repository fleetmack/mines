drop table a_temp_temp;

create table a_temp_temp as
(select id_number, pref_mail_name, pref_class_year, salutation, gender_code, p_email_address, a_segment, flag_gift_cfy, 0 as email_group, rpad(' ',60) as ass_pref_mail_name
from a_aga_3
where a_comb_seg in ('ya_lyb_10',
'ya_nvr_1_10',
'ya_nvr_1_10 - CHK',
'ya_nvr_1_10 - PM',
'ya_nvr_2_10',
'ya_nvr_2_10 - CHK',
'ya_nvr_2_10 - MEM',
'ya_nvr_2_10 - PM',
'ya_pc_10',
'ya_pc_10 - PM',
'ya_recent_10',
'ya_syb_10',
'ya_syb_10 - CHK',
'ya_syb_10 - PM',
'grad_ya_10',
'grad_ya_10 - CHK')
or pref_class_year = '2000');
commit;
/

/***
(Recent Grads) 2009 recent grads who have not made a gift this fiscal year 
(Non Donors) All 2000-2008 young alumni who have not made a gift this fiscal year. 
(Donors) All 2000-2008 young alumni who have already made a gift this fiscal year between 7/1/09-3/31/10. 
***/
update a_temp_temp
set email_group = 1
where a_segment = 'ya_recent_10'
and email_group = 0
and id_number not in
    (select id_number from a_aga_3 where flag_gift_cfy = '1');
commit;
/


update a_temp_temp
set email_group = 2
where email_group = 0
and pref_class_year between '2000' and '2008'
and flag_gift_cfy = 0;
commit;
/


update a_temp_temp
set email_group = 3
where flag_gift_cfy <> 0
and pref_class_year between '2000' and '2008'
and id_number in
    (select id_number from a_dw_pyramid where flag_alumni <> '1' and flag_non_monthend <> '1' and associated_code <> 'B' and date_of_record between '20090701' and '20100331');
commit;
/

delete from a_temp_temp
where email_group = 0;
commit;
/

delete from a_temp_temp
where p_email_address = ' ';
commit;
/

delete from a_temp_temp
where id_number IN ('0000032991','0000039327');
commit;
/

delete from a_temp_temp
where id_number in 
(select a.id_number
from a_temp_temp a, a_temp_temp b
where a.id_number <> b.id_number
and a.p_email_address = b.p_email_address
and a.gender_code = 'F');
commit;
/

update a_temp_temp t
set t.ass_pref_mail_name = NVL(
(select a.ass_pref_mail_name
from a_dw_assignment_pm a
where t.id_number = a.id_number),' ');
commit;
/

select *
from a_temp_temp
where email_group IN (1,2,3);