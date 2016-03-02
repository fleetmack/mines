/***Friends and Alumni in Houston ***/
select count(id_number) from a_dw_address_good
where record_type_code in ('FR','AL')
and flag_omit_from_mail = 0
and p_zipcode between '77000-0000' and '77799-9999';



/***Friends and Alumni in Dallas ***/
select count(id_number) from a_dw_address_good
where record_type_code in ('FR','AL')
and flag_omit_from_mail = 0
and (p_zipcode between '75000-0000' and '75499-9999'
or p_zipcode between '75700-0000' and '75899-9999'
or p_zipcode between '76000-0000' and '76299-9999'
or p_zipcode between '76400-0000' and '76499-9999'
or p_zipcode between '76600-0000' and '76799-9999');



/***Friends and Alumni in Oklahoma and Witchita ***/
select count(id_number) from a_dw_address_good
where record_type_code in ('FR','AL')
and flag_omit_from_mail = 0
and (p_zipcode between '73000-0000' and '73199-9999'
or p_zipcode between '74000-0000' and '74199-9999'
or p_zipcode between '74300-0000' and '74499-9999'
or p_zipcode between '74600-0000' and '74699-9999'
or p_zipcode between '74800-0000' and '74899-9999'or
p_zipcode between '67000-0000' and '67299-9999');
