/*** People I DNS forgot ... oops ***/
select id_number, e.pref_mail_name, nvl(ass_pref_mail_name,' '), p_email_address, p_phone_formatted
from entity e
left outer join a_dw_assignment_pm Using (id_number)
left outer join a_dw_address_good using (id_number)
where id_number IN
('0000026516','0000020601','0000012742','0000037540','0000039315','0000011470','0000022570','0000019919','0000028012','0000010808','0000037537','0000021164','0000023219','0000041990','0000004991','0000050970','0000007983','0000005509','0000006876','0000009613','0000005615','0000005629','0000006758','0000008705','0000004709','0000009852')