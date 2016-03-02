/*** How many donors gave in each of the past 5 years, not counting CFY ***/
select id_number, pref_mail_name, pref_name_sort, pref_class_year
from entity
where id_number in
(select id_number
from a_dw_5_year_give_summ
where pfy_cash > 0
and cfym2_cash > 0
and cfym3_cash > 0
and cfym4_cash > 0
and cfym5_cash > 0
and id_number in
    (select id_number
       from entity
     where record_type_code = 'AL'
         and pref_class_year BETWEEN '1990' AND '2003'))
order by pref_class_year;

/*** Same as above, different age group ***/
select count(*)
from a_dw_5_year_give_summ
where pfy_cash > 0
and cfym2_cash > 0
and cfym3_cash > 0
and cfym4_cash > 0
and cfym5_cash > 0
and id_number in
    (select id_number
       from entity
     where record_type_code = 'AL'
         and pref_class_year BETWEEN '1980' AND '1989');