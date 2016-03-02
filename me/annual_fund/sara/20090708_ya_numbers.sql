/*** How many young alums donated last year ***/
select count(distinct(id_number)) ya_09_distinct_donor_count
from a_dw_pyramid
where year_of_giving = '2009'
and flag_alumni <> '1'
and record_type_code = 'AL'
and pref_class_year BETWEEN '2000' AND '2008';


/*** How much young alums gave last year ***/
select '$'||sum(associated_amount + associated_amount_joint + associated_amount_claim + associated_amount_claim) ya_09_giving
from a_dw_pyramid
where year_of_giving = '2009'
and flag_alumni <> '1'
and record_type_code = 'AL'
and transaction_type <> 'P'
and pref_class_year BETWEEN '2000' AND '2008';

/*** Distinct Young PC people ***/
select count(distinct(id_number)) young_pc_09_count
from a_dw_gift_clubs
where pc09 = '1'
and id_number IN
    (select id_number from entity where record_type_code = 'AL' and pref_class_year BETWEEN '2000' AND '2008');

/***
I am trying to get some FY09 numbers for young alumni. I know all the gifts are completely in but 
I need some #’s today. Could you let me know how many YA made a gift (2000-2008), what the total 
was and how many of those were at the YAPC level?
***/

