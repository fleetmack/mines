/*** Invitees to the Denver PC reception ***/
/*** requires a_std_rcptn_3 to have the contents of waht you made for Ruth today in the a_std_rcptn_mom thing ***/

/*** YO YO YO YO YO YO CHECKITOUT YO YO YO -- all these id# are in a_hold_spond_dec_ppl .... use them to load activity once it's created then ditch that table ***/

select id_number, pref_mail_name, pref_name_sort, pref_class_year, record_type_code
from a_std_rcptn_3
where id_number IN (select id_number from a_dw_gift_clubs where pc10 = '1' or pc11 = '1' or pc12 = '1')
or    id_number IN (select id_number from a_aga_3 where a_ask >= 1000)