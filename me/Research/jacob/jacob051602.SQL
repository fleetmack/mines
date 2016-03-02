/***selects all grads of chemistry or geochemistry***/

select * from degrees 
where institution_code in '1'
and (major_code1 in ('351','7','540')
or major_code2 in ('351','7','540')
or major_code3 in ('351','7','540'))
and id_number in
(select id_number from entity where record_status_code = 'A')
