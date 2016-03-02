/*** Yes….it’s a mailing from George Wood just reminding those in the class of 1965 that haven’t
 made a gift that he’s matching all gifts with his own money and that the fiscal year ends on June 30th. 
 It’s going to get appeal code R405, but it’s the only class that’s getting anything. 
 (Traditionally we have done a May reunion follow-up to all May reunion classes but because we’re so short-staffed 
 all we’re doing is 1965). ***/
/*** that is an email from rosie as to what this is ***/
select id_number, a_ask
from a_aga_3
where flag_gift_cfy <> '1'
and record_type_code = 'AL'
and pref_class_year = '1965'