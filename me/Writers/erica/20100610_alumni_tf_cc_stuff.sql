/***
Bryan, would you please pull me a list of all participants in track & field and cross country with the following information? 
Please use commitment and include match. Yes, please double joints in this case. Thanks!
--Name
--Class year
--Entity number
--Home address info
--Business address info and title
--Major gift capacity
--Echelon rating
--Amount contributed to Alumni Track & Field Endowed Scholarship (B5608)
Lifetime giving
--Prospect manager
***/
SELECT dw.id_number, dw.pref_mail_name, dw.pref_name_sort, dw.pref_class_year, 
dw.p_street1,dw.p_street2, dw.p_street3, dw.p_city, dw.p_state_code, dw.p_zipcode, dw.p_foreign_cityzip, dw.p_email_address, dw.p_phone_formatted,
dw.b_company_name_1, dw.b_company_name_2, dw.b_business_title, dw.b_street1, dw.b_street2, dw.b_street3, dw.b_city, dw.b_state_code, dw.b_zipcode, dw.b_foreign_cityzip, dw.b_email_address, dw.b_phone_formatted,
nvl(ass.ass_pref_mail_name,' ') pm, 
nvl(ass.ass_pref_name_sort,' ') pm_sort,
(select NVL(      
(select t.short_desc
           from tms_dp_rating  t,   demographic_profile  p
        where p.id_number(+) = dw.id_number
           and t.dp_rating_code = p.dp_rating_code
           and p.dp_rating_type_code = 'KMG'),'Unrated') from dual) major_gift_capacity,
(select nvl(
  (select t.short_desc
           from tms_dp_rating  t,   demographic_profile  p
        where p.id_number(+) = dw.id_number
           and t.dp_rating_code = p.dp_rating_code
           and p.dp_rating_type_code = 'ECH'),'Unrated') from dual) echelon_rating,
(select NVL(          
(select sum(total_jnt_commitment) tjc 
                    from a_dw_pyramid  py
                    where py.id_number = dw.id_number
                        and py.alloc = 'B5608'
                        and py.flag_alumni = 0
                        and py.flag_non_monthend = 0
                       ),0) from dual) total_to_track_scholarship,
(select nvl(
(select total_w_pledge  twp
    from a_dw_lt_giving   twp
  where twp.id_number = dw.id_number),0) from dual) total_life_jnt_commit
FROM a_dw_address_good   dw,
           a_dw_assignment_pm   ass
WHERE ass.id_number(+) = dw.id_number
AND dw.record_type_code = 'AL'
AND dw.id_number IN
    (select id_number from sport where sport_code in ('TF','CC'));