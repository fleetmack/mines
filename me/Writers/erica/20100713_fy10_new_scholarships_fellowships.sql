/*** FY10 Newly Established Scholarships & Fellowships - both endowed and current ***/
select *
from allocation
where cfae_purpose_code IN ('EF','CF')
and fund_name  in ('0004','0022','0003')
and allocation_code IN
    (select alloc from a_dw_pyramid where year_of_giving = '2010')
and allocation_code NOT IN
    (select alloc from a_dw_pyramid where year_of_giving < '2010')
order by short_name