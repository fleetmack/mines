/***select * from tms_committee_table
where lower(full_desc) like '%transforming%';
***/
select *
from committee
where committee_code IN ('TRCAM',
'TRCC',
'TRCRC',
'TRMGC',
'TRPGC',
'TRRC',
'TRSC')
and committee_status_code = 'A'
order by id_number
