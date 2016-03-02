/***Phoenix Alumni and Friends ***/
select id_number from a_dw_address_good
where flag_omit_from_mail = '0'
and record_type_code in ('FR','AL')
and (p_zipcode between '85000-0000' and '85099-9999'
or p_zipcode between '85200-0000' and '85399-9999'
or p_zipcode between '86300-0000' and '86399-9999');



/***Tucson Alumni and Friends ***/
select id_number from a_dw_address_good
where flag_omit_from_mail = '0'
and record_type_code in ('FR','AL')
and p_zipcode between '85600-0000' and '85799-9999';

