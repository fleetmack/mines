/*** Metallurgy Grads since 2005 ***/
select distinct dw.id_number
from a_dw_address_good   dw,
        a_dw_degrees            deg
where dw.id_number = deg.id_number
and dw.record_type_code = 'AL'
and deg.dept_code = 'MET'
and deg.institution_code = '1'
and deg.degree_code <> '401'
and substr(deg.grad_dt,1,4) >= '2005';