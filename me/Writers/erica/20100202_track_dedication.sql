/*** List 1 - Facility - Donors to Account #1500 ***/
drop table temp_erica_list1;
commit;

create table temp_erica_list1
as
(select id_number
from a_dw_address_good
where id_number IN
(select id_number
from a_dw_pyramid
where alloc = '1500')
and id_number not in
    (select id_number
       from mailing_list
     where mail_list_code IN ('DNI','DNM'))
or id_number in ('0000012742','0000023777','0000003586')); --stermole, kring, sloan
commit;


/*** List 2 - General - Nobody in list 1, and these people: 
Donors (no time limit) to accounts:	
B5608	
2884	
4105	
4346	
Plus the following donors:	
4991	Steve and Gayle Mooney
4677	Bob Lofgren
3205	Tony Corbetta
***/
drop table temp_erica_list2;
commit;

create table temp_erica_list2
as
(select id_number
from a_dw_address_good
where ((id_number IN ('0000004991','0000004677','0000003205')
            or id_number IN
                (select id_number
                   from a_dw_pyramid
                where alloc IN ('B5608','2884','4105','4346')))
and id_number not in
    (select id_number
       from mailing_list
     where mail_list_code IN ('DNI','DNM'))
or id_number in
    ('0000004269', --john lockridge
'0000010029', --brady mconaty
'0000009207', --dean stoughton
'0000009165',--george puuls iii
'0000008927', --kim harden
'0000010436', --leslie penello
'0000016000', --duane maue
'0000005903',--charles shultz
'0000006294', --steve chesebro
'0000006734', --denis mcinerny
'0000038696', --marcia simmons
'0000040536', --terry young
'0000006178', --dyke howell
'0000006432', --ronald weiszmann
'0000006645', --paul brennecke
'0000002711', --harry campbell
'0000040537', --margaret campbell
'0000005264', --hershal ferguson
'0000025196', --genevieve darden
'0000005890', --john rossi
'0000036211', --patricia bradley
'0000005076', --michael carr
'0000007632', --richard gardner
'0000007160', --roberg mckee iii
'0000027953')) --janice tesone
and id_number not in
    (select id_number from temp_erica_list1));
commit;
--note ... has 2 who are either DNS or DNI, and has 15 who also gave to #1500


/*** List 3 - Reunion - nobody in lists 1 or 2, and these people: 
Track & field and cross country alumni not included on FACILITY or GENERAL lists
***/
drop table temp_erica_list3;
commit;

create table temp_erica_list3
as
(select id_number
from a_dw_address_good
where record_type_code = 'AL'
and id_number IN
    (select id_number from sport where sport_code IN ('TF','CC'))
and id_number NOT IN
    (select id_number from temp_erica_list1)
and id_number NOT IN
    (select id_number from temp_erica_list2)
and id_number not in
    (select id_number
       from mailing_list
     where mail_list_code IN ('DNI','DNM'))
);
commit;

/*** List 4 - Parents and Other - nobody in lists 1, 2, or 3, and these people
Erica to add:	
BOG		done			
BOT	    done
Dan & Beth Dwyer  erica_add
Jill and Kevin Knussmann 2740 Deframe, Golden, CO 80401	 erica_add
Julie and Charlie Kindel 2100 W. Lake Sammammish Parkway SE, Bellevue, WA 98002	  erica_add
CSMAA exec committee	done per anita
Department heads					done
President's executive committee					done
past Mines presidents			done		
***/
drop table temp_erica_list4;
commit;

create table temp_erica_list4
as
(
select distinct id_number
from a_dw_address_good
where (
id_number in  (select id_number from committee where committee_code IN ('FBOG','FBOGA','FBOGD','FBOGG','FBOGI','FBOGN','BOT') and committee_status_code = 'A') --BOG
OR id_number in (select id_number from mailing_list where mail_list_code IN ('DEP','MEC') and mail_list_status_code = 'A')  ---president exec committee, department heads
OR id_number in ('0000015828', --Julie Hoagland
                            '0000012657', --John Howe
                            '0000027499', --Rob Carlson
                            '0000007861') --Harry Briscoe                            aa exec committee, per anita add these ones
/***
athletics oversight committee					
***/
OR id_number in
--current track and cross country parents, as follows:	
('0000020113', --Scoggins
'0000020113', --Trefny
'0000028839', --bickart
'0000013553', --ansell
'0000008240', --mcbride
'0000034933', --Gary Wink
'0000041043', --Anna Martinez-Barnish
'0000027012', --Rick Wendlandt
'0000025279', --Graham Davis
'0000033756', --Alexandra Newman
'0000032902', --John McCray
'0000051445', --Patrick Kohl
'0000051062', --Mike Mooney
'0000051050', --Dan Fox
'0000040042', --Dave Hieronymous
'0000013070', --John and Pattie Stermole
'0000041229', --Start of all Track and CC Parents
'0000043544',	
'0000038550',	
'0000048193',	
'0000048198',
'0000049026',
'0000049924',
'0000053514',
'0000047906',
'0000049640',
'0000014251',
'0000048188',
'0000041768',
'0000039723',
'0000049880',
'0000049189',
'0000053430',
'0000048946',
'0000053852',
'0000048370',
'0000049114',
'0000049286',
'0000053567',
'0000049116',
'0000053740',
'0000048382',
'0000053451',
'0000049477',
'0000053452',
'0000047871',
'0000050539',
'0000052966',
'0000053984',
'0000051645',
'0000047840',
'0000048788',
'0000053063',
'0000048595',
'0000053863',
'0000049127',
'0000053570',
'0000048063',
'0000049615',
'0000050724',
'0000048573',
'0000047980',
'0000049180',
'0000053635',
'0000048149',
'0000010369',
'0000053266',
'0000049636',
'0000052919',
'0000048301',
'0000009401',
'0000053779',
'0000048258',
'0000048594',
'0000048691',
'0000052989',
'0000049790',
'0000049891',
'0000048905',
'0000053316',
'0000010876',
'0000048226',
'0000053332',
'0000053693',
'0000049089',
'0000049666',
'0000048951',
'0000053139',
'0000048510',
'0000052923',
'0000053447',
'0000048652',
'0000048056',
'0000039954',
'0000025319',
'0000048807',
'0000048965',
'0000040271',
'0000053285',
'0000053495',
'0000041771',
'0000048873',
'0000042752',
'0000048838',
'0000048978',
'0000049793',
'0000049908',
'0000053505',
'0000053459',
'0000053020',
'0000053841',
'0000048872',
'0000049173',
'0000053234',
'0000053284',
'0000053233',
'0000049329'))
and id_number NOT IN (select id_number from temp_erica_list3)
and id_number NOT IN (select id_number from temp_erica_list2)
and id_number NOT IN (select id_number from temp_erica_list1)
and id_number not in
    (select id_number
       from mailing_list
     where mail_list_code IN ('DNI','DNM'))
);


/*** Find Duplicates  
--do this for table 1,2,3, and 4
alter table temp_erica_list4
add spouse_id_number varchar2(10);

--do this for table 1,2,3, and 4
update temp_erica_list4  t1
set t1.spouse_id_number = 
    (select e.spouse_id_number from entity e where e.id_number = t1.id_number);
commit;

select e1.id_number, e2.pref_mail_name
from temp_erica_list1  e1,  entity e2
where e1.id_number = e2.id_number
and e1.spouse_id_number > ' '
and (e1.spouse_id_number in (select e4.id_number from temp_erica_list2 e4)
     or e1.spouse_id_number in (select e5.id_number from temp_erica_list3 e5)
     or e1.spouse_id_number in (select e6.id_number from temp_erica_list4 e6));


select e1.id_number, e2.pref_mail_name
from temp_erica_list2  e1,  entity e2
where e1.id_number = e2.id_number
and e1.spouse_id_number > ' '
and (e1.spouse_id_number in (select e3.id_number from temp_erica_list1 e3)
  or e1.spouse_id_number in (select e5.id_number from temp_erica_list3 e5)
     or e1.spouse_id_number in (select e6.id_number from temp_erica_list4 e6));


select e1.id_number, e2.pref_mail_name
from temp_erica_list3  e1,  entity e2
where e1.id_number = e2.id_number
and e1.spouse_id_number > ' '
and (e1.spouse_id_number in (select e3.id_number from temp_erica_list1 e3)
     or e1.spouse_id_number in (select e4.id_number from temp_erica_list2 e4)
     or e1.spouse_id_number in (select e6.id_number from temp_erica_list4 e6));


select e1.id_number, e2.pref_mail_name
from temp_erica_list4  e1,  entity e2
where e1.id_number = e2.id_number
and e1.spouse_id_number > ' '
and (e1.spouse_id_number in (select e3.id_number from temp_erica_list1 e3)
     or e1.spouse_id_number in (select e4.id_number from temp_erica_list2 e4)
     or e1.spouse_id_number in (select e5.id_number from temp_erica_list3 e5));
***/