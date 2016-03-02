/*** IRA donors coded on the prospect side of things ***/
select id_number, pref_mail_name, pref_name_sort
from entity
where id_number IN
(select distinct id_number
from a_dw_pg
where gift_type = 'Retirement Plan'

UNION

/*** IRA gifts coded on the gift side of things ***/
select distinct id_number
  from a_dw_pyramid
 where receipt IN
    (select prim_gift_receipt_number
        from primary_gift
        where lower(prim_gift_comment) like '%ira%'))
order by pref_name_sort;