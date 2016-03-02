/*** all allocations with either "minority" or "MEP" in the title ***/
/*** use to calculate how much given to minority funds since a given date - import to pyramid query***/
select allocation_code, long_name
from allocation
where lower(long_name) like '%mep%'
or lower(long_name) like '%minority%'