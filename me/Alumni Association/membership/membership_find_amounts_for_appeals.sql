/*** USE ME to see who replied to a certain appeal with pledge status and get their payment info!!! ***/                                     
select e.id_number, p.memb_number, m.memb_type_code, p.sched_date, p.sched_amt, p.balance_amt, p.sched_status_code, m.memb_appeal_code 
from memb m,
     memb_pay_schedule p,
     memb_entity e,
     memb_appeal a
where m.memb_number = e.memb_number
and e.memb_number = p.memb_number
and m.memb_number = p.memb_number
and a.id_number  = e.id_number
--and e.id_number = '0000013993'
and a.response_code = 'P'
and m.memb_appeal_code in ('P08SS','P08SL')     
and a.memb_appeal_code in ('P08SS','P08SL') 
and m.memb_appeal_code = a.memb_appeal_code
and m.memb_year = '2008'
and p.sched_date BETWEEN '20080101' and '20081231'
order by e.id_number