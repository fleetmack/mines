/*** Pledges to Phonathon Membership ***/
select id_number
from a_dw_address_good
where id_number IN
(select id_number
from memb_appeal
where memb_appeal_code = 'P11S'
and response_code IN ('P'));

/*** Maybe to Phonathon Membership ***/
select id_number
from a_dw_address_good
where id_number IN
(select id_number
from memb_appeal
where memb_appeal_code = 'P11S'
and response_code IN ('P'))
and id_number not in
    (select id_number from mailing_list where mail_list_code = 'DNP');