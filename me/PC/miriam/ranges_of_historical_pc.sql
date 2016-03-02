/*** People who have been PC for 10-14 years ***/
select id_number, pref_mail_name, pref_name_sort, cityline
  from a_dw_gift_clubs_pc
 where consecutive_pc between '10' and '14';
 
 
/*** People who have been PC for 15-19 years ***/
select id_number, pref_mail_name, pref_name_sort, cityline
  from a_dw_gift_clubs_pc
 where consecutive_pc between '15' and '19';
 
/*** People who have been PC for > 20  years ***/
select id_number, pref_mail_name, pref_name_sort, cityline
  from a_dw_gift_clubs_pc
 where consecutive_pc >= '20';