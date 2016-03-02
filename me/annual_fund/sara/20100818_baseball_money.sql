/***
The appeal code is AT10, but I only need information for the segment a_bb (baseball). Totals are fine (# of donors and total $ raised). I don’t need a full blown report.
***/
select *
from a_dw_pyramid
where appeal_code = 'AT10'
and id_number in
    (select id_number from appeals where appeal_code = 'AT10' and xcomment = 'a_bb');