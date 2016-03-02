/***
FY10
What is the total # of YA donors so far this year? 
Of those, what # made a YA PC gift? 
What is the total amount donated by YA so far this year? 
Of that amount, what portion is made up from YA PC gifts? 
 ***/
/**** Q1 ****/
select count(distinct(id_number)) ya_donors_fy10
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2001' AND '2010'
and year_of_giving = '2010';

select count(distinct(id_number)) ya_pc_fy10
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2001' AND '2010'
and year_of_giving = '2010'
and id_number IN
    (select id_number from a_dw_gift_clubs where pc10 = 1);

select sum(commitment_amount) ya_commitment_fy10
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2001' AND '2010'
and year_of_giving = '2010';

select sum(commitment_amount) ya_pc_commitment_fy10
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2001' AND '2010'
and year_of_giving = '2010'
and id_number in
        (select id_number from a_dw_gift_clubs where pc10 = 1);


select sum(associated_amount + associated_amount_match + associated_amount_claim) ya_cash_plus_matching_fy10
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2001' AND '2010'
and year_of_giving = '2010';

select sum(associated_amount + associated_amount_match + associated_amount_claim) ya_pc_cash_plus_matching_fy10
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2001' AND '2010'
and year_of_giving = '2010'
and id_number in
        (select id_number from a_dw_gift_clubs where pc10 = 1);

/***
FY09
What was the total # of YA donors? 
Of those, what # made a YA PC gift? 
What # of these gifts were made in the fall vs. spring semesters? 
What was the total amount donated by YA? (Can we get the amount w. matching gifts and just a raw # as well?) 
Of that amount, what portion was made up from YA PC gifts? 
How many overall gifts were restricted (meaning not to The Mines Fund?) 
How many YA PC gifts were restricted? 
***/
select count(distinct(id_number)) ya_donors_fy09
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2000' AND '2008'
and year_of_giving = '2009';

select count(distinct(id_number)) ya_pc_fy09
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2000' AND '2008'
and year_of_giving = '2009'
and id_number IN
    (select id_number from a_dw_gift_clubs where pc09 = 1);

select count(distinct(id_number)) ya_donors_fall_fy09________
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2000' AND '2008'
and year_of_giving = '2009'
and date_of_record BETWEEN '20080701' AND '20081231';

select count(distinct(id_number)) ya_donors_spring_fy09______
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2000' AND '2008'
and year_of_giving = '2009'
and date_of_record BETWEEN '20090101' AND '20090731';

select count(distinct(id_number)) ya_pc_donors_fall_fy09________
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2000' AND '2008'
and year_of_giving = '2009'
and date_of_record BETWEEN '20080701' AND '20081231'
and id_number IN
    (select id_number from a_dw_gift_clubs where pc09 = 1);

select count(distinct(id_number)) ya_pc_donors_spring_fy09______
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2000' AND '2008'
and year_of_giving = '2009'
and date_of_record BETWEEN '20090101' AND '20090731'
and id_number IN
    (select id_number from a_dw_gift_clubs where pc09 = 1);

select sum(associated_amount + associated_amount_match + associated_amount_claim) ya_cash_plus_matching_fy09
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2000' AND '2008'
and year_of_giving = '2009';

select sum(associated_amount + associated_amount_match + associated_amount_claim) ya_pc_cash_plus_matching_fy09
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2001' AND '2008'
and year_of_giving = '2009'
and id_number in
        (select id_number from a_dw_gift_clubs where pc09 = 1);

select sum(associated_amount) ya_cash_fy09
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2000' AND '2008'
and year_of_giving = '2009';

select sum(associated_amount) ya_pc_cash_fy09
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2001' AND '2008'
and year_of_giving = '2009'
and id_number in
        (select id_number from a_dw_gift_clubs where pc09 = 1);

select count(distinct(id_number)) ya_unrestricted_donors_fy09
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2001' and '2008'
and year_of_giving = '2009'
and alloc = '3795';

select count(distinct(id_number)) ya_restricted_donors_fy09
from a_dw_pyramid
where flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2001' and '2008'
and year_of_giving = '2009'
and alloc <> '3795';