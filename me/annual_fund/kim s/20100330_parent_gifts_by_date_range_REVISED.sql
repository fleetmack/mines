/*** Parent Gifts Over Date Range -- Now a PB Report ***/
select distinct dnr.id_number, 
         p.pref_mail_name, 
         p.pref_name_sort, 
         p.date_of_record, 
         DECODE(dnr.record_type_code,'AL','***Alumni',''),
         DECODE(p.transaction_type,'GF','Gift','PP','Pledge Payment','P','Pledge',p.transaction_type),
         p.associated_amount,
         p.associated_amount_match + p.associated_amount_claim match, 
         p.prim_pledge_amount_os,
        decode(dnr.flag_first_gift,1,'***New Donor',' ') new_donor,
        NVL(DECODE(p.record_type_code, 'AL',(select DECODE(r.record_type_code,'PA','Parent Current','PX','Past Parent') FROM entity_record_type r WHERE p.id_number = r.id_number and record_type_code in ('PA','PX')),DECODE(p.record_type_code,'PA','Parent Current','Past Parent')),' ') as record_type
from a_dw_pyramid   p,
        entity_record_type   ert,
         a_dnr_retention   dnr
where ert.id_number = p.id_number
and p.id_number = dnr.id_number
and p.flag_alumni <> '1'
and ert.record_type_code IN ('PA','PX')
and p.date_of_record between '20100301' and '20100309'
and p.date_of_record =
    (select max(p2.date_of_record) from a_dw_pyramid p2 where p.id_number = p2.id_number and p2.date_of_record BETWEEN '20100301' and '20100309')
and p.associated_amount  >= 200