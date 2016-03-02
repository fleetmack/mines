/*** Board member or alum who committed at least $10k in one gift in the past 5 years ... not this year ***/
select DISTINCT ID_NUMBER, pref_mail_name, pref_name_sort, pref_class_year
from a_dw_pyramid
where total_jnt_commitment >= '10000'
and record_status_code = 'A'
and year_of_giving BETWEEN '2005' and '2009'
and alloc = '3795'
and (record_type_code = 'AL' or id_number in (select id_number from committee where committee_code IN ('FBOD','FBOG','FBOGA','FBOGD','FBOGG','FBOGI','FBOGN','BOT','AABOD')))
and id_number in
    (select id_number from a_dw_address_good);