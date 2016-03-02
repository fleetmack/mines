/*** Corp & Found giving to Scholarships in FY06 ***/
select p.id_number, p.pref_mail_name, p.pref_name_sort, a.long_name, sum(total_commitment)
from a_dw_pyramid   p,
     allocation     a
where p.alloc = a.allocation_code
and p.year_of_giving = '2006'
and p.record_type_code IN ('CF','CP','FD','FO','OO')
and lower(a.long_name) like '%scholars%'
group by p.id_number, p.pref_mail_name, p.pref_name_sort, a.long_name
order by pref_name_sort