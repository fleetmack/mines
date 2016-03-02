/*** Parent Gifts Over Date Range -- Now a PB Report ***/
select p.id_number, 
         p.pref_mail_name, 
         p.pref_name_sort, 
         p.date_of_record, 
         DECODE(dnr.record_type_code,'AL','Alumni',''),
         DECODE(p.transaction_type,'GF','Gift','PP','Pledge Payment','P','Pledge',p.transaction_type),
         p.associated_amount,
         p.associated_amount_match + p.associated_amount_claim match, 
         p.prim_pledge_amount_os,
        decode(dnr.flag_first_gift,1,'New Donor',' ') new_donor,
        min(decode(ert.record_type_code,'AL','Past Parent',(DECODE(ert.record_type_code,'PX','Past Parent','PA','Current Parent')))) record_type
from a_dw_pyramid   p,
        entity_record_type   ert,
         a_dnr_retention   dnr
where ert.id_number = p.id_number
and p.id_number = dnr.id_number
and p.flag_alumni <> '1'
and p.date_of_record between '20100301' and '20100331'
and ert.record_type_code IN ('PA','PX')
group by p.id_number, 
            p.pref_mail_name, 
            p.pref_name_sort, 
            p.date_of_record, 
            DECODE(dnr.record_type_code,'AL','Alumni',''),
            DECODE(p.transaction_type,'GF','Gift','PP','Pledge Payment','P','Pledge',p.transaction_type),
            p.associated_amount,
            p.associated_amount_match + p.associated_amount_claim , 
            p.prim_pledge_amount_os, 
            decode(dnr.flag_first_gift,1,'New Donor',' ')
order by min(decode(ert.record_type_code,'AL','Past Parent',(DECODE(ert.record_type_code,'PX','Past Parent','PA','Current Parent')))), p.pref_name_sort