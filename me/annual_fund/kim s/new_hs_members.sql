/*** New HS Members in FY08 ***/
select *
from gift_clubs
where gift_club_code = 'HS'
and gift_club_start_date BETWEEN '20070701' AND '20080630';



SELECT pref_mail_name
FROM entity
WHERE id_number IN
('0000003501',
'0000005948',
'0000004289',
'0000040574',
'0000010653',
'0000009493',
'0000004787',
'0000006195',
'0000007137',
'0000003799',
'0000038662',
'0000006137',
'0000042560')