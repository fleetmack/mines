select distinct(p.id_number), pref_mail_name, min(ps.payment_schedule_date) as start_date,max(ps.payment_schedule_date) as end_date
from a_dw_pyramid           p,
     payment_schedule      ps
where ps.payment_schedule_pledge_nbr = p.receipt
  and p.receipt IN
    (select ps2.payment_schedule_pledge_nbr
       from payment_schedule    ps2
      where ps2.payment_schedule_status = 'U')
  and p.id_number IN
    (select p2.id_number
       from a_dw_pyramid        p2
      where p2.transaction_type = 'PY')
group by p.id_number, p.pref_mail_name

  
