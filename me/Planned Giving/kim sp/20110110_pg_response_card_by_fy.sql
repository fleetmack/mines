/*** PGR Response Card by FY ***/
/*** PGR Card FY08 ***/
select
(select count(distinct(id_number)) fy08
from activity
where activity_code = 'PGR'
and start_dt between '20070701' and '20080630') card_in_08,
(select count(distinct(id_number)) 
     from activity
   where activity_code = 'PGR'
     and start_dt between '20070701' and '20080630'
     and id_number in
        (select id_number
           from a_dw_pyramid
         where flag_alumni <> 1
             and flag_non_monthend <> 1)) gift_in_08_and_card_in_08,
(select count(distinct(id_number))
    from activity
  where activity_code = 'PGR'
      and start_dt between '20070701' and '20080630'
      and id_number in
        (select id_number
           from a_dw_pg
       where date_of_record between '20070701' and '20080630')) pg_in_08_and_card_in_08,
(select count(distinct(id_number))
    from activity
  where activity_code = 'PGR'
      and start_dt between '20070701' and '20080630'
      and id_number in
        (select id_number
           from a_dw_pg)) pg_ever_and_card_in_08
from dual;

/*** PGR Card FY09 ***/
select
(select count(distinct(id_number)) fy09
from activity
where activity_code = 'PGR'
and start_dt between '20080701' and '20090630') card_in_09,
(select count(distinct(id_number)) 
     from activity
   where activity_code = 'PGR'
     and start_dt between '20080701' and '20090630'
     and id_number in
        (select id_number
           from a_dw_pyramid
         where flag_alumni <> 1
             and flag_non_monthend <> 1)) gift_in_09_and_card_in_09,
(select count(distinct(id_number))
    from activity
  where activity_code = 'PGR'
      and start_dt between '20080701' and '20090630'
      and id_number in
        (select id_number
           from a_dw_pg
       where date_of_record between '20080701' and '20090630')) pg_in_09_and_card_in_09,
(select count(distinct(id_number))
    from activity
  where activity_code = 'PGR'
      and start_dt between '20080701' and '20090630'
      and id_number in
        (select id_number
           from a_dw_pg)) pg_ever_and_card_in_09
from dual;

/*** PGR Card FY10 ***/
select
(select count(distinct(id_number)) fy10
from activity
where activity_code = 'PGR'
and start_dt between '20090701' and '20100630') card_in_10,
(select count(distinct(id_number)) 
     from activity
   where activity_code = 'PGR'
     and start_dt between  '20090701' and '20100630'
     and id_number in
        (select id_number
           from a_dw_pyramid
         where flag_alumni <> 1
             and flag_non_monthend <> 1)) gift_in_10_and_card_in_10,
(select count(distinct(id_number))
    from activity
  where activity_code = 'PGR'
      and start_dt between  '20090701' and '20100630'
      and id_number in
        (select id_number
           from a_dw_pg
       where date_of_record between  '20090701' and '20100630')) pg_in_10_and_card_in_10,
(select count(distinct(id_number))
    from activity
  where activity_code = 'PGR'
      and start_dt between  '20090701' and '20100630'
      and id_number in
        (select id_number
           from a_dw_pg)) pg_ever_and_card_in_10
from dual;