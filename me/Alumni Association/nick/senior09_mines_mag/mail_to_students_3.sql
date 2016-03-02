select *
from temp_mack_2009_grad_2
where id_number IN
(select id FROM temp_mack_2009_grad)