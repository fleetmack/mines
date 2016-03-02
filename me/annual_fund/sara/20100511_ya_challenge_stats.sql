/*** How much cash in YA Challenge ***/
select sum(associated_amount)  cash
from a_dw_pyramid
where record_type_code = 'AL'
and pref_class_year >= '2000'
and flag_alumni <> '1'
and flag_memorial <> '1'
and date_of_record >= '20100401'
and associated_code <> 'B';

/*** How much cash plus matching gifts in YA Challenge ***/
select sum(associated_amount + associated_amount_match + associated_amount_claim)  cash_plus_matching_gifts
from a_dw_pyramid
where record_type_code = 'AL'
and pref_class_year >= '2000'
and flag_alumni <> '1'
and flag_memorial <> '1'
and date_of_record >= '20100401'
and associated_code <> 'B';

/*** How Much Pledged ***/
select sum(commitment_amount)  committed
from a_dw_pyramid
where record_type_code = 'AL'
and pref_class_year >= '2000'
and flag_alumni <> '1'
and flag_memorial <> '1'
and date_of_record >= '20100401'
and associated_code <> 'B';

/*** How many unique donors have made YA challenge pledge ***/
select count(distinct(id_number)) total_donors_who_pledged
from a_dw_pyramid
where transaction_type = 'P'
and record_type_code = 'AL'
and pref_class_year >= '2000'
and flag_alumni <> '1'
and flag_memorial <> '1'
and date_of_record >= '20100401'
and associated_code NOT IN  ('B','J');

/*** 2nd YA pledgers to the challenge ***/
select count(distinct(a1.id_number)) second_pledgers
from a_dw_pyramid a1
where a1.record_type_code = 'AL'
and a1.pref_class_year >= '2000'
and a1.associated_code NOT IN ('B','J')
and a1.flag_memorial <> '1'
and a1.transaction_type = 'P'
and a1.date_of_record >= '20100401'
and a1.flag_non_monthend <> '1'
and a1.flag_alumni <> '1'
and a1.id_number  IN
      (select a2.id_number from a_dw_pyramid a2 where a2.date_of_record between '20090701' and '20100331' and a2.associated_code NOT IN ('B','J') and a2.flag_alumni <> '1' and a2.flag_memorial <> '1');

/*** NEW YA given to the challenge ***/
select count(distinct(a1.id_number)) new_pledgers
from a_dw_pyramid  a1
where a1.record_type_code = 'AL'
and a1.pref_class_year >= '2000'
and a1.date_of_record >= '20100401'
and associated_code NOT IN  ('B','J')
and a1.transaction_type = 'P'
and a1.flag_memorial <> '1'
and a1.flag_non_monthend <> '1'
and a1.flag_alumni <> '1'
and a1.id_number NOT IN
    (select a2.id_number from a_dw_pyramid a2 where a2.date_of_record between '20090701' and '20100331' and a2.associated_code NOT IN ('B','J') and a2.flag_alumni <> '1' and a2.flag_memorial <> '1');

/*** How many unique donors have given YA challenge cash ***/
select count(distinct(id_number)) total_donors_who_gave_cash
from a_dw_pyramid
where transaction_type <> 'P'
and record_type_code = 'AL'
and pref_class_year >= '2000'
and flag_alumni <> '1'
and flag_memorial <> '1'
and flag_non_monthend <> '1'
and date_of_record >= '20100401'
and associated_code NOT IN  ('B','J');

/*** NEW YA given to the challenge ***/
select count(distinct(a1.id_number)) new_gifts
from a_dw_pyramid  a1
where a1.record_type_code = 'AL'
and a1.pref_class_year >= '2000'
and a1.date_of_record >= '20100401'
and associated_code NOT IN  ('B','J')
and a1.transaction_type <> 'P'
and a1.flag_memorial <> '1'
and a1.flag_non_monthend <> '1'
and a1.flag_alumni <> '1'
and a1.id_number NOT IN
    (select a2.id_number from a_dw_pyramid a2 where a2.date_of_record between '20090701' and '20100331' and a2.associated_code NOT IN ('B','J') and a2.flag_alumni <> '1' and a2.flag_memorial <> '1');

/*** 2nd YA donors to the challenge ***/
select count(distinct(a1.id_number)) second_gifts
from a_dw_pyramid a1
where a1.record_type_code = 'AL'
and a1.pref_class_year >= '2000'
and a1.associated_code NOT IN ('B','J')
and a1.flag_memorial <> '1'
and a1.transaction_type <> 'P'
and a1.date_of_record >= '20100401'
and a1.flag_non_monthend <> '1'
and a1.flag_alumni <> '1'
and a1.id_number  IN
      (select a2.id_number from a_dw_pyramid a2 where a2.date_of_record between '20090701' and '20100331' and a2.associated_code NOT IN ('B','J') and a2.flag_alumni <> '1' and a2.flag_memorial <> '1');

/*** How many unique donors overall to YA challenge ***/
select count(distinct(id_number)) total_donors_all
from a_dw_pyramid
where record_type_code = 'AL'
and pref_class_year >= '2000'
and flag_alumni <> '1'
and flag_memorial <> '1'
and flag_non_monthend <> '1'
and date_of_record >= '20100401'
and associated_code NOT IN  ('B','J');

/*** NEW YA given to the challenge ***/
select count(distinct(a1.id_number)) total_new_ya_people
from a_dw_pyramid  a1
where a1.record_type_code = 'AL'
and a1.pref_class_year >= '2000'
and a1.date_of_record >= '20100401'
and associated_code NOT IN  ('B','J')
and a1.flag_memorial <> '1'
and a1.flag_non_monthend <> '1'
and a1.flag_alumni <> '1'
and a1.id_number NOT IN
    (select a2.id_number from a_dw_pyramid a2 where a2.date_of_record between '20090701' and '20100331' and a2.associated_code NOT IN  ('B','J') and a2.flag_alumni <> '1' and a2.flag_memorial <> '1');

/*** 2nd YA all to the challenge ***/
select count(distinct(a1.id_number)) total_second_ya_people
from a_dw_pyramid a1
where a1.record_type_code = 'AL'
and a1.pref_class_year >= '2000'
and a1.associated_code NOT IN ('B','J')
and a1.flag_memorial <> '1'
and a1.date_of_record >= '20100401'
and a1.flag_non_monthend <> '1'
and a1.flag_alumni <> '1'
and a1.id_number  IN
      (select a2.id_number from a_dw_pyramid a2 where a2.date_of_record between '20090701' and '20100331' and a2.associated_code NOT IN ('B','J') and a2.flag_alumni <> '1' and a2.flag_memorial <> '1');

/*** PC All (Gifts and Pledges) this fiscal year ***/
select count(distinct(a1.id_number)) ya_chall_all_pc_cfy
from a_dw_pyramid  a1
where a1.record_type_code = 'AL'
and a1.pref_class_year >= '2000'
and a1.date_of_record >= '20100401'
and a1.flag_non_monthend <> '1'
and a1.flag_alumni <> '1'
and a1.associated_code NOT IN ('B','J')
and a1.id_number in
    (select g.id_number from a_dw_gift_clubs g where g.pc10 = '1');

/***  PC Pledges since YA Challenge and are PC this year ***/
select distinct(a1.id_number) ya_chall_pledge_pc_cfy
from a_dw_pyramid  a1
where a1.record_type_code = 'AL'
and a1.pref_class_year >= '2000'
and a1.transaction_type = 'P'
and a1.date_of_record >= '20100401'
and a1.flag_non_monthend <> '1'
and a1.flag_alumni <> '1'
and a1.associated_code NOT IN ('B','J')
and a1.id_number in
    (select g.id_number from a_dw_gift_clubs g where g.pc10 = '1');

/***  PC Gifts since YA Challenge  and are PC this year ***/
select count(distinct(a1.id_number)) ya_chall_gift_pc_cfy
from a_dw_pyramid  a1
where a1.record_type_code = 'AL'
and a1.pref_class_year >= '2000'
and a1.transaction_type <> 'P'
and a1.date_of_record >= '20100401'
and a1.flag_non_monthend <> '1'
and a1.flag_alumni <> '1'
and a1.associated_code NOT IN ('B','J')
and a1.id_number in
    (select g.id_number from a_dw_gift_clubs g where g.pc10 = '1');

/************** all above here are correct ********/
/*** PC All (Gifts and Pledges) since YA Challenge ***/
select count(distinct(id_number)) total_pc_since_ya_chall
from a_ack_rcpt  a1
where a1.record_type_code = 'AL'
and a1.pref_class_year >= '2000'
and a1.date_of_record >= '20100401'
and a1.flag_pc_this_gift = '1'
and a1.flag_memorial <> '1'
and a1.flag_behalf <> '1';

/*** PC Gifts since YA Challenge ****/
select count(distinct(id_number)) total_pc_gift_since_ya_chall
from a_ack_rcpt  a1
where a1.record_type_code = 'AL'
and a1.transaction_type <> 'P'
and a1.pref_class_year >= '2000'
and a1.date_of_record >= '20100401'
and a1.flag_pc_this_gift = '1'
and a1.flag_memorial <> '1'
and a1.flag_behalf <> '1';


/*** PC Pledges since YA Challenge ****/
select distinct(id_number) total_pc_pledge_since_ya_chall
from a_ack_rcpt  a1
where a1.record_type_code = 'AL'
and a1.transaction_type = 'P'
and a1.pref_class_year >= '2000'
and a1.date_of_record >= '20100401'
and a1.flag_pc_this_gift = '1'
and a1.flag_memorial <> '1'
and a1.flag_behalf <> '1';

--Can you tell me how many new YA have given for the challenge, as well as how many made 2nd gifts? Also, how many people made a gift at a YAPC level? 
