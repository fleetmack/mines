/*** Additional Surveyor People ***/
select id_number
from a_dw_address_good
where record_type_code = 'AL'
and pref_class_year BETWEEN '1976' and '1993'
and id_number in
    (select id_number from a_dw_pyramid
     where year_of_giving between '2006' and '2011'
        and  associated_code <> 'B'
        and flag_alumni <> 1
        and flag_non_monthend <> 1)
and id_number in
(select id_number
from a_dw_pyramid
where flag_non_monthend <> 1
and flag_alumni <> 1
and year_of_giving >= '2001'
group by id_number
having count(*) >= 5
)
and id_number in
(    select id_number
        from a_dnr_retention
    where  cfy+pfy+cfy_minus_2+cfy_minus_3+cfy_minus_4+cfy_minus_5+cfy_minus_6+cfy_minus_7+cfy_minus_8+cfy_minus_9+cfy_minus_10 >= 5)
and id_number in
    (select id_number
        from a_dw_lt_giving
     where total >= 2000)
minus
select id_number
from a_pgn_3;