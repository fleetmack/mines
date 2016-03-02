/*** Sacramento & Palo Alto People ***/
select id_number
from a_dw_address_good
where (record_type_code in ('AL','FR','PA')
          or record_type_code in ('PX') and pref_class_year >= '2007')
and (p_zipcode BETWEEN '94000-0000' and '96399-9999')
and id_number NOT IN 
    (select id_number from mailing_list where mail_list_code IN ('DNM','DNI'));
COMMIT;
/
