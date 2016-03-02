/*** Attend family weekend and made a donation in the past 3 years ***/
select *
from activity
where activity_code ='C362'
and id_number in
    (select id_number
        from a_dw_pyramid
    where associated_code <> 'B'
      and flag_alumni <> 1
      and flag_non_monthend <> 1
      and year_of_giving IN ('2009','2010','2011'))
order by id_number;