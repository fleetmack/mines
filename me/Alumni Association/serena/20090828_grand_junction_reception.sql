/*** friends, parents and alumni?  Please include preferred mailing address information as well as phone numbers and email addresses (both business and home email, please).
81400-81699 and all of 84500
***/
select id_number
from a_dw_address_good
where (record_type_code in ('AL','FR','PA')
          or record_type_code in ('PX') and pref_class_year >= '2007')
and (p_zipcode BETWEEN '81400-0000' and '81699-9999'
           or p_zipcode between '84500-0000' and '84599-9999')
and id_number NOT IN 
    (select id_number from mailing_list where mail_list_code IN ('DNM','DNI'))