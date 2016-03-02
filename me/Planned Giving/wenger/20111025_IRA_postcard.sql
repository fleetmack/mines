/*** IRA Postcard ***/
/***
Anyone with a pref year of ’63 or earlier, or
Anyone who’s made an IRA gift in the past 
Only Domestic
Exclude DNS 
****/
SELECT id_number
  FROM a_dw_address_good
 WHERE record_type_code = 'AL'
   AND pref_class_year <= '1963'
UNION
/*** IRA donors coded on the prospect side of things ***/
select id_number
from entity
where id_number IN
(select distinct id_number
from a_dw_pg
where gift_type = 'Retirement Plan')
UNION
/*** IRA gifts coded on the gift side of things ***/
select distinct id_number
  from a_dw_pyramid
 where receipt IN
    (select prim_gift_receipt_number
        from primary_gift
        where lower(prim_gift_comment) like '%ira%'); 