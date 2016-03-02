select a.allocation_code, a.long_name, t.full_desc
from allocation a,
     tms_program t
where a.program_code = t.program_code
and a.cfae_purpose_code = 'EF'
order by t.full_desc