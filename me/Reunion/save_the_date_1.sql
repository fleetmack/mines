/*** Create temp table ***/
/*** Run this same script in 2 weeks when pat asks but change temp table name to temp2 ***/
/*** look for names in temp2 that aren't in this original table .. those are new people ***/
create table temp_pat_save_the_date1
as
(select distinct id_number
 from a_dw_gift_clubs
where pref_class_year IN ('1940','1945','1950','1955','1960','1965','1970','1975')
and (pc04 = '1'
or  pc05 = '1'));
commit;
/