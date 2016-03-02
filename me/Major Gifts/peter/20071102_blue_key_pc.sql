/*** Blue Key members who were PC in 07 or 08 ***/
select id_number, pref_mail_name, pref_name_sort, pref_class_year
from a_dw_gift_clubs
where (pc07 = 1 or pc08 = 1)
and id_number in
    (select id_number
    from activity
    where activity_code = 'BK')