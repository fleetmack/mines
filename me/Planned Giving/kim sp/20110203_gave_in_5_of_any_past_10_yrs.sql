/*** Gave in 5 of the past 10 years ***/
select a.id_number,
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2001')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2002')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2003')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2004')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2005')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2006')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2007')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2008')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2009')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2010')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2011')
then 1 else 0
end) total_years
from a_dw_pyramid  a
group by id_number
having (case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2001')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2002')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2003')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2004')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2005')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2006')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2007')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2008')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2009')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2010')
then 1 else 0
end)+
(case
when a.id_number in (select id_number from a_dw_pyramid where flag_non_monthend <> 1 and flag_alumni <> 1 and year_of_giving = '2011')
then 1 else 0
end) >=5
order by id_number