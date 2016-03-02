select id_number, pref_mail_name, sum(associated_amount)
from a_dw_pyramid
where alloc IN ('4826','4619','4978','4075','4002','4474','4463','4101','4002','1674','4704')
and year_of_giving = 1998
group by id_number, pref_mail_name