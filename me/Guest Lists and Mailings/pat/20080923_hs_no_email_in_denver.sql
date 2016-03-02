/*** Heritage Society Members with no email address (note: this will not work in the future as temp_mack_rcptn will be empty ***/
(select id_number
from a_dw_gift_clubs
where heritage_society = '1'
and id_number IN
    (select id_number
        from a_dw_address_good
     where p_zipcode between '80000-0000' and '80599-9999')
and id_number NOT IN
    (select id_number from temp_mack_rcptn))