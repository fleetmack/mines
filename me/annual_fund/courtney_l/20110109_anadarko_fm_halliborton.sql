/*** please exclude all those listed as do not email, or do not invite to events. 

On this list, we want to know who is a current donor to Mines, who their PM is, contact info, and if they are taking advantage of a match at their company or not.   Please also include if they are lifetime members or PC members. 

) what constitutes a "current donor"... a FY12 gift? yes
b) what kind of contact info?  Email, phone, mail?  Will need to know what this is being used for as I need to know who to eliminate (people marked as do not solicit, do not invite to events, do not phone, do not email, etc.).  please include all contact info, and include categories so that I can see DNS, do not invite to events, do not mail, etc. so that I can see who is DNS, etc. I will filter them out myself
c) For "taking advantage of a match" -- does that simply mean do they work for a matching company? Please include if we’ve received a MG form from them or if there is a claim in our system that they have contributed a match
d) "if they are PC members"... I assume you just mean this fiscal year? (aside from the lifetime ones) FY ’11 and FY ‘12
e) Does this list need to be in Excel format or more of a readable report?  Excel Format is great thanks
***/


--1) Anadarko everywhere #18187
select distinct dw.id_number, dw.pref_mail_name, dw.pref_name_sort, dw.pref_class_year,
       ag.p_street1, ag.p_street2, ag.p_street3, ag.p_cityline, ag.p_foreign_cityzip, ag.p_phone_formatted, ag.p_email_address,
     (CASE
        WHEN dw.id_number IN (select id_number from a_dw_pyramid where year_of_giving = '2012' and flag_non_monthend <> '1') THEN 'Y'
        ELSE 'M'
        END) fy12_giving,
     (CASE
         WHEN dw.id_number IN (select id_number from a_dw_gift_clubs where pc11= '1') THEN 'Y'
         ELSE 'N'
         END) pc11,
     (CASE
         WHEN dw.id_number IN (select id_number from a_dw_gift_clubs where pc12= '1') THEN 'Y'
         ELSE 'N'
         END) pc12,
      dw.matching_status_ind,
      (CASE
         WHEN ag.id_number IN (select id_number from a_dw_pyramid where associated_amount_match > 0 or associated_amount_claim > 0) THEN 'Y'
         ELSE 'N'
         END) has_given_matching_gift,
      nvl((select ass.ass_pref_mail_name from a_dw_assignment_pm ass where ass.id_number = ag.id_number),' ') pm
from a_dw_jobs  dw,
     a_dw_address_good  ag
where ag.id_number(+) = dw.id_number
  and dw.employer_id_number = '0000018187'
  and dw.record_type_code = 'AL'
  and dw.job_status_code = 'C'
  and dw.employ_relat_code = 'PE'
  and dw.id_number NOT IN
    (select id_number from mailing_list where mail_list_code = 'DNI');
  
--2) Halliburton in Houston  # 18111 
select distinct dw.id_number, dw.pref_mail_name, dw.pref_name_sort, dw.pref_class_year,
       ag.p_street1, ag.p_street2, ag.p_street3, ag.p_cityline, ag.p_foreign_cityzip, ag.p_phone_formatted, ag.p_email_address,
     (CASE
        WHEN dw.id_number IN (select id_number from a_dw_pyramid where year_of_giving = '2012' and flag_non_monthend <> '1') THEN 'Y'
        ELSE 'N'
        END) fy12_giving,
     (CASE
         WHEN dw.id_number IN (select id_number from a_dw_gift_clubs where pc11= '1') THEN 'Y'
         ELSE 'N'
         END) pc11,
     (CASE
         WHEN dw.id_number IN (select id_number from a_dw_gift_clubs where pc12= '1') THEN 'Y'
         ELSE 'N'
         END) pc12,
         (CASE
         WHEN ag.id_number IN (select id_number from a_dw_pyramid where associated_amount_match > 0 or associated_amount_claim > 0) THEN 'Y'
         ELSE 'N'
         END) has_given_matching_gift,
      dw.matching_status_ind,
      nvl((select ass.ass_pref_mail_name from a_dw_assignment_pm ass where ass.id_number = ag.id_number),' ') pm
from a_dw_jobs  dw,
     a_dw_address_good ag
where ag.id_number(+) = dw.id_number
  and dw.employer_id_number = '0000018111'
  and dw.record_type_code = 'AL'
  and dw.job_status_code = 'C'
  and ag.p_zipcode BETWEEN '77000-0000' AND '77899-9999'
  and ag.id_number NOT IN
    (select id_number from mailing_list where mail_list_code = 'DNI');
  
--3) Freeport McMoran in Arizona : #19118  
select distinct dw.id_number, dw.pref_mail_name, dw.pref_name_sort, dw.pref_class_year,
       ag.p_street1, ag.p_street2, ag.p_street3, ag.p_cityline, ag.p_foreign_cityzip, ag.p_phone_formatted, ag.p_email_address,
     (CASE
        WHEN dw.id_number IN (select id_number from a_dw_pyramid where year_of_giving = '2012' and flag_non_monthend <> '1') THEN 'Y'
        ELSE 'N'
        END) fy12_giving,
     (CASE
         WHEN dw.id_number IN (select id_number from a_dw_gift_clubs where pc11= '1') THEN 'Y'
         ELSE 'N'
         END) pc11,
     (CASE
         WHEN dw.id_number IN (select id_number from a_dw_gift_clubs where pc12= '1') THEN 'Y'
         ELSE 'N'
         END) pc12,
      dw.matching_status_ind,
      (CASE
         WHEN ag.id_number IN (select id_number from a_dw_pyramid where associated_amount_match > 0 or associated_amount_claim > 0) THEN 'Y'
         ELSE 'N'
         END) has_given_matching_gift,
      nvl((select ass.ass_pref_mail_name from a_dw_assignment_pm ass where ass.id_number = ag.id_number),' ') pm
from a_dw_jobs dw,
     a_dw_address_good ag
where ag.id_number(+) = dw.id_number
  and dw.employer_id_number = '0000019118'
  and dw.record_type_code = 'AL'
  and dw.job_status_code = 'C'
  and ag.id_number NOT IN
    (select id_number from mailing_list where mail_list_code = 'DNI'); 
  
--4) All alumni in AZ . Please include zip codes for all of AZ
select distinct ag.id_number, ag.pref_mail_name, ag.pref_name_sort, ag.pref_class_year,
       ag.p_street1, ag.p_street2, ag.p_street3, ag.p_cityline, ag.p_foreign_cityzip, ag.p_phone_formatted, ag.p_email_address,
     (CASE
        WHEN ag.id_number IN (select id_number from a_dw_pyramid where year_of_giving = '2012' and flag_non_monthend <> '1') THEN 'Y'
        ELSE 'N'
        END) fy12_giving,
     (CASE
         WHEN ag.id_number IN (select id_number from a_dw_gift_clubs where pc11= '1') THEN 'Y'
         ELSE 'N'
         END) pc11,
     (CASE
         WHEN ag.id_number IN (select id_number from a_dw_gift_clubs where pc12= '1') THEN 'Y'
         ELSE 'N'
         END) pc12,
      nvl(dw.matching_status_ind,'N') work_for_matching_co,
     (CASE
         WHEN ag.id_number IN (select id_number from a_dw_pyramid where associated_amount_match > 0 or associated_amount_claim > 0) THEN 'Y'
         ELSE 'N'
         END) has_given_matching_gift,
      nvl((select ass.ass_pref_mail_name from a_dw_assignment_pm ass where ass.id_number = ag.id_number),' ') pm
  from a_dw_address_good  ag,
       a_dw_jobs          dw
 where dw.id_number(+)     = ag.id_number
   and ag.record_type_code = 'AL'
   and ag.p_state_code     = 'AZ'
   and dw.employ_relat_code(+) = 'PE'
   and dw.job_status_code(+)   = 'C'
   and ag.id_number NOT IN
    (select id_number from mailing_list where mail_list_code = 'DNI');  