/***PC 03 giving total in 2002-2003***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) as PC03_Giving
from a_dw_pyramid
where date_of_record between '20020701' and '20030630'
and id_number in
    (select id_number
       from a_dw_gift_clubs
      where pc03 =1);


/***last 5 years***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) 
from a_dw_pyramid
where (date_of_record between '20020701' and '20030630'
            and flag_alumni = 0
            and id_number in
            (select id_number
               from a_dw_gift_clubs
               where pc03 =1))
or (date_of_record between '20010701' and '20020630'
         and flag_alumni = 0
         and id_number in
            (select id_number
               from a_dw_gift_clubs
               where pc02 =1))
or (date_of_record between '20000701' and '20010630'
         and flag_alumni = 0
         and id_number in
            (select id_number
               from a_dw_gift_clubs
               where pc01 =1))
or (date_of_record between '19990701' and '20000630'
         and flag_alumni = 0
         and id_number in
            (select id_number
               from a_dw_gift_clubs
               where pc00 =1))
or (date_of_record between '19980701' and '19990630'
         and flag_alumni = 0
         and id_number in
            (select id_number
               from a_dw_gift_clubs
               where pc99 =1));



