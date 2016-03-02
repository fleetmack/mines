--Current PC (FY11 and/or FY12) 
(select id_number
 from a_dw_gift_clubs
where (pc11 = 1 or pc12 = 1)
UNION
--Heritage Society members
select id_number
  from a_dw_gift_clubs
 where heritage_society = 1
--Current Board of Trustees
UNION
select id_number
  from committee
 where committee_code = 'BOT'
   and committee_status_code = 'A'
--Former Board of Trustees   UNION
UNION
select id_number
  from committee
 where committee_code = 'BOT'
   and committee_status_code = 'F'
--Department Heads 
UNION
select id_number
  from mailing_list
 where mail_list_code = 'DEP'
 --Emeritus Presidents
UNION
 select id_number
   from entity
  where id_number IN
 ('0000028839', --bickart
'0000020113', --trefny
'0000013553') --ansel
--MCS members (include those newly-coded as “notified” as well)
UNION
select id_number
  from a_dw_gift_clubs
  where (flag_cs_notif = 1 or flag_cs = 1)
--CSMAA Executive Committee (need to ask Anita who is all here)
UNION
select id_number
  from entity
 where id_number IN
    ('0000012657',--John Howe
     '0000013725',--Paul Wareham
     '0000006526',--Jim Larsen
     '0000032578')--Jafar Tabaian
--Foundation Board of Governors     
UNION
select id_number
  from committee
 where committee_code IN ('FBOG','FBOGA','FBOGD','FBOGE','FBOGG','FBOGN')
   and committee_status_code IN ('A')
--President’s Executive Committee
UNION
select id_number
  from mailing_list
 where mail_list_code IN ('MEC','MSC')
 --Senior Class gift above $50
UNION
select id_number from
(select id_number, pref_mail_name, sum(associated_amount+associated_amount_match+associated_amount_claim+associated_amount_joint)
   from a_dw_pyramid
  where appeal_code = 'SCG11'
group by id_number, pref_mail_name
having sum(associated_amount+associated_amount_match+associated_amount_claim+associated_amount_joint) >= 50)
--Total commitment in FY10 >= $10,000 
UNION
select id_number FROM
(select id_number, pref_mail_name, sum(total_jnt_commitment)
  from a_dw_pyramid
 where person_or_org = 'P'
   and year_of_giving = '2010'
   and flag_non_monthend <> 1
   and flag_alumni <> 1
group by id_number, pref_mail_name
having suM(total_jnt_commitment) >= 10000)
--Total commitment in FY11 >= $10,000 
UNION
select id_number FROM
(select id_number, pref_mail_name, sum(total_jnt_commitment)
  from a_dw_pyramid
 where person_or_org = 'P'
   and year_of_giving = '2011'
   and flag_non_monthend <> 1
   and flag_alumni <> 1
group by id_number, pref_mail_name
having suM(total_jnt_commitment) >= 10000)
--Total commitment in FY12 >= $10,000 
UNION
select id_number FROM
(select id_number, pref_mail_name, sum(total_jnt_commitment)
  from a_dw_pyramid
 where person_or_org = 'P'
   and year_of_giving = '2012'
   and flag_non_monthend <> 1
   and flag_alumni <> 1
group by id_number, pref_mail_name
having suM(total_jnt_commitment) >= 10000)
UNION
select id_number 
  from entity
 where id_number IN ('0000033610')
UNION
--those who we sent a save the date card to
select id_number
  from a_temp_mcs_save_date_2012
--Campaign Blocks 1 & 2
--note: remove this segment per TBK email on 06-27-2011
/***
UNION
select id_number
from demographic_profile
where dp_rating_type_code = 'BLK'
and rank in (01,02)
***/
)
MINUS
select id_number
from entity
where id_number IN ('0000016829','0000054877');