select distinct p.pledge_donor_id, 
       n.pref_name,
       n.name_sort,
       p.pledge_allocation_name,
       a.short_name,
       p.pledge_amount,
       ps.payment_schedule_amount,
       ps.payment_schedule_pledge_nbr,
       to_char(to_date(min(ps.payment_schedule_date),'YYYYMMDD'),'MM/DD/YYYY') as start_date,
       to_char(to_date(max(ps.payment_schedule_date),'YYYYMMDD'),'MM/DD/YYYY') as end_date
from pledge             p,
     payment_schedule   ps,
     name               n,
     allocation         a
where p.pledge_pledge_number = ps.payment_schedule_pledge_nbr
  and p.pledge_donor_id     = n.id_number
  and a.allocation_code     = p.pledge_allocation_name
  and n.name_type_code      = '00'
  and p.pledge_pledge_type = 'PD'
  and ps.payment_schedule_pledge_nbr IN
    (select payment_schedule_pledge_nbr
       from payment_schedule
      where payment_schedule_status = 'U')
  and ps.payment_schedule_amount IN
        (select max(payment_schedule_amount)
           from payment_schedule
          where payment_schedule_pledge_nbr = ps.payment_schedule_pledge_nbr)
     group by p.pledge_donor_id, n.pref_name, n.name_sort, p.pledge_allocation_name, a.short_name, p.pledge_amount, ps.payment_schedule_amount, ps.payment_schedule_pledge_nbr
order by n.name_sort









