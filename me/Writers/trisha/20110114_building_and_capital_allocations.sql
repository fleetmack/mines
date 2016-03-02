/*** Allocations for Buildings/Capital purpses***/
/*** Note:  fund_name = 0001 means that fund may not really be for that, its cfae_purp_code hasn't been reviewed***/
select allocation_code, long_Name, fund_name, to_char(date_added,'MM'||'/'||'DD'||'/'||'YYYY') date_added, to_char(date_added,'YYYYMMDD') date_added_sort
from allocation
where cfae_purpose_code IN ('LP','CP','EP')
order by long_Name