/***  Sheet 1 ****/
select id_number
from a_dw_address_good
where id_number in
    (select id_number from ids where ids_type_code = 'CID' and other_id IN
        (select id_number from a_temp_hold_ids))
and id_number NOT IN
    (select id_number from a_mines_magazine
        where flag_mines_mag NOT IN (0,3));

--now run std mail and do PB report
--then you have to truncate id's table and do sheet 2

--check against those in list 1!!!
create table a_std_5
as
(select * from a_std_3);
commit;


select id_number
from a_dw_address_good
where id_number in
    (select id_number from ids where ids_type_code = 'CID' and other_id IN
        (select id_number from a_temp_hold_ids))
and id_number NOT IN
    (select id_number from a_mines_magazine
        where flag_mines_mag NOT IN (0,3))
and id_number NOT IN
    (select id_number from a_std_5);

--then do sheet 3 and check against first 2 lists
create table a_std_6
as
(select * from a_std_3);
commit;

truncate table a_temp_hold_ids;
/



select id_number
from a_dw_address_good
where id_number in
    (select id_number from ids where ids_type_code = 'CID' and other_id IN
        (select id_number from a_temp_hold_ids))
and id_number NOT IN
    (select id_number from a_mines_magazine
        where flag_mines_mag NOT IN (0,3))
and id_number NOT IN
    (select id_number from a_std_5)
and id_number NOT IN
    (select id_number from a_std_6)
