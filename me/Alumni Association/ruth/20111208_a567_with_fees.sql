/*** Activity people, regardless of participation, with fees ***/
select e.id_number, e.pref_mail_name, e.pref_name_sort, a.activity_participation_code, a.fee_amt, a.fee_paid_amt
from activity  a, entity e
where e.id_number = a.id_number
and activity_code = 'A567'
and (fee_amt <> 0 or fee_paid_amt <> 0)