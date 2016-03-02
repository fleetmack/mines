/*** Accounts that are stewarded by Email ***/
select *
from allocation_stewardee
where stewardee_anonymous_code = 'E'
order by allocation_code;