select *
from memb_appeal
where memb_appeal_code IN ('P10SN','P10SS','P10SL')
and response_code  IN ('P')
and id_number IN 
    (select id_number from a_ads_3)
and id_number NOT IN
    (select id_number from a_dw_memb where current_active_member = 1);


select *
from a_ads_3
where id_number in
(select id_number
from memb_appeal
where memb_appeal_code IN ('P10SN','P10SS','P10SL')
and response_code  IN ('P'))