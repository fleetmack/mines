/*** Golf stats for Ruth Jones ***/
select dw.id_number,
       dw.pref_mail_name,
       dw.b_company_name_1,
       (CASE
        WHEN fee_paid_amt >= 300 THEN fee_paid_amt
        ELSE 0
        END) fee,
        fee_paid_amt
from activity  a,
     a_dw_address_good dw
where a.id_number = dw.id_number
and a.activity_code = 'A548'
order by a.id_number

--select * from activity where activity_code = 'A548'