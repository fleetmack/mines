select * from a_dw_assignment
where ass_id_number in
(select id_number from committee
where committee_code IN ('PCVDE','PCVH','PCVNT','PCVO','PCVSC'))
