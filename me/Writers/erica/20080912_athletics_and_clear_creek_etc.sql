SELECT id_number
FROM a_dw_address_good
WHERE id_number IN
('0000002711', --Harry Campbell
'0000016195', --Doug Coors
'0000020601', --Joe Coors
'0000009610', --John Coors
'0000006876', --Marshall Crouch
'0000041566', --Rick Gardner
'0000008927', --Kim Harden
'0000006352', --Bud Isaacs
'0000004269', --John Lockridge
'0000004991', --Steve Mooney
'0000009165', --George Puls
'0000005890', --John Rossi
'0000003153', --Frank Seeton
'0000012742', --Frank Stermole
'0000009207', --Dean Stoughton
'0000021475', --Gary Judd
'0000036856', --Judy Judd
'0000040537', --Margaret Campbell and Edward Johnson
'0000041183', --Duncan Campbell
'0000012081', --Brian Savage
'0000007983', --Charlie McNeil
'0000011023', --FA Foss
'0000020130', --Bruce Allison
'0000005076', --Mike Carr
'0000013911', --Will Fleckenstein
'0000006440', --Bob Writz
'0000006495', --Gary Gantner
'0000002963', --Ted Stockmar
'0000014063', --Greg Wolfe
'0000012538', --Mark Oberle
'0000011020', --Bill Zisch
'0000010156', --Doug Woodel
'0000004677', --Bob Lofgren
'0000010029', --Brady MConaty
'0000009913', --Mark DePuy
'0000034288', --Kay Mueller
'0000036694', --John Scott
'0000023777', --Gary Kring
'0000008523', --Ben Mares
'0000041675', --Jacob Smith (Mayor of Golden)
'0000041533', --Mike Bestor (Golden City Manager)
'0000034933') --Gary Wink (President of Golden Chamber of Commerce)
OR id_number IN
    (select distinct(id_number)
from a_dw_pyramid
where alloc IN ('4340','4398','1500'))
OR id_number IN
    (select id_number
      from mailing_list
     where mail_list_code = 'CAB'
     and mail_list_status_code = 'A')
OR id_number IN
    (select id_number
      FROM committee
    WHERE committee_code IN ('BOT','FBOD','AABOD')
         AND committee_status_code = 'A')