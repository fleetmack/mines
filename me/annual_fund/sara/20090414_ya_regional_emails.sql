/*** Illinois YA ***/
select id_number
--id_number, pref_mail_name, pref_name_sort, salutation, p_cityline, p_email_address, p_foreign_cityzip
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year >= '2000'
and p_state_code = 'IL'
and p_email_address > ' ';

/*** Houston YA ***/
select id_number
--id_number, pref_mail_name, pref_name_sort, salutation, p_cityline, p_email_address, p_foreign_cityzip
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year >= '2000'
and p_zipcode BETWEEN '77000-0000' AND '77599-9999'
and p_email_address > ' ';

/*** Alaska YA ***/
select id_number
--id_number, pref_mail_name, pref_name_sort, salutation, p_cityline, p_email_address, p_foreign_cityzip
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year >= '2000'
and p_state_code = 'AK'
and p_email_address > ' ';

/*** Colorado YA ***/
select id_number
--id_number, pref_mail_name, pref_name_sort, salutation, p_cityline, p_email_address, p_foreign_cityzip
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year >= '2000'
and p_state_code = 'CO'
and p_email_address > ' ';

/*** California YA ***/
select id_number
--id_number, pref_mail_name, pref_name_sort, salutation, p_cityline, p_email_address, p_foreign_cityzip
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year >= '2000'
and p_state_code = 'CA'
and p_email_address > ' ';

/*** International YA ***/
select id_number
--id_number, pref_mail_name, pref_name_sort, salutation, p_cityline, p_email_address, p_foreign_cityzip
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year >= '2000'
and p_flag_foreign = '1'
and p_email_address > ' '
order by pref_name_sort;

/*** Current YA PC Donors ***/
select id_number
--id_number, pref_mail_name, pref_name_sort, salutation, p_cityline, p_email_address, p_foreign_cityzip
--distinct(id_number)
from a_dw_address_good
where record_type_code = 'AL'
and record_status_code = 'A'
and pref_class_year >= '2000'
and id_number IN
(select id_number from a_dw_gift_clubs where pc09 = '1')
/*** Next part is for appeal loading only ***/
and id_number  NOT IN
    (select id_number FROM appeals WHERE appeal_code = 'YRE09');
    
    /*** These people are NOT in one of the other segments ... only in the YA PC DONORS Segment ... so if Sara doesn't want to double-up emails to them, these are the ones she wnats ***/
    /***
     * ID_NUMBER
0000033655
0000032932
0000034821
0000035088
0000035595
0000036322
0000036616
0000036467
0000038064
0000038076
0000040390
0000040121
0000039466
0000040458
0000040862
0000042955
0000042850
0000050224
***/