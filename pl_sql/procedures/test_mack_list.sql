CREATE OR REPLACE PROCEDURE           ADVANCE.TEST_MACK_LIST (p_recordset IN OUT sys_refcursor)
IS
BEGIN
open p_recordset FOR
select ag.id_number,
       ag.pref_mail_name,
       ag.pref_name_sort,
       ag.pref_class_year,
       ag.p_email_address,
       pm.ass_pref_mail_name,
       pm.ass_pref_name_sort       
from a_dw_address_good  ag
left outer join a_dw_assignment_pm pm on pm.id_number = ag.id_number
where ag.record_type_code = 'AL'
  and ag.pref_class_year BETWEEN '1976' and '2006'
  and ag.p_email_address > ' '
  and ag.id_number NOT IN
    (select id_number
       from mailing_list
      where mail_list_code = 'DNS')
  and ag.id_number NOT IN
    (select id_number
       from a_dw_gift_clubs
      where heritage_society = '1');
end test_mack_list;

 