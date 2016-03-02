select id_number, 
pref_mail_name, 
p_email_address as preferred_email_address, 
h_email_address as home_email_address, 
b_email_address as business_email_address  from a_dw_address_good
where id_number in
(select id_number from activity
where activity_code = 'C230'
and activity_participation_code = 'I')
