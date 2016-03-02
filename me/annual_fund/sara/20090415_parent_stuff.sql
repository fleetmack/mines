drop table temp_mack_parents_sara;
commit;

create table temp_mack_parents_sara
(id_number varchar2(10),
segment varchar2(20),
ask_amt     number);
commit;



/**** Parents Who Attend Parent & Family Day ***/
/*** Use AGA table as ask ***/
insert into temp_mack_parents_sara
(select id_number, 'family_day', a_ask
from a_aga_3
where id_number IN
(select id_number
from activity
where activity_code = 'C319'
and activity_participation_code = 'IA')
and id_number NOT IN
    (select id_number from a_dw_pyramid where year_of_giving = '2009' and flag_alumni <> '1')
and id_number NOT IN
    (select id_number from mailing_list where mail_list_code IN ('DNM','DNS')));
commit;    

/*** Select * FROM appeals WHERE appeal_code = 'F209'
 *   SELECT id_number FROM a_std_3
 * 
select distinct(a_comb_seg)
from a_aga_3
where id_number in
    (select id_number
      from entity_record_type
      where record_type_code = 'PA')
      
/*** Parent Donors .... those who aren't in above group, who have donated in the past, and haven't donated this year ***/
/*** Use AGA table as ask ***/
insert into temp_mack_parents_sara
(select id_number, 'parent_donors', a_ask
from a_aga_3
where id_number IN
    (select id_number
       from entity_record_type
       where record_type_code = 'PA')
and flag_gift_cfy <> '1'      
and id_number IN
    (select id_number from a_dw_pyramid where year_of_giving < '2009' and flag_alumni <> '1')
and id_number NOT IN
    (select id_number from activity where activity_code = 'C319' and activity_participation_code = 'IA')
and id_number NOT IN
    (select id_number from mailing_list where mail_list_code IN ('DNM','DNS')));
    
/*** Parent Nevers ***/
/*** Use 100 as the ask ***/
insert into temp_mack_parents_sara
(select id_number, 'parent_never', 100
from a_aga_3
where id_number IN
    (select id_number
       from entity_record_type
       where record_type_code = 'PA')
and id_number NOT IN
    (select id_number from activity where activity_code = 'C319' and activity_participation_code = 'IA')
and id_number NOT IN
    (select id_number from a_dw_pyramid where flag_alumni <> '1'));
    commit;

    
/***    
    select count(*) from temp_mack_parents_sara;
        select count(distinct(id_number)) from temp_mack_parents_sara;
        select * from  temp_mack_parents_sara;
        ***/
        
/*** Parent Former ***/
insert into temp_mack_parents_sara
(select id_number, 'parent_former', a_ask
 from a_aga_3
where flag_gift_cfy <> '1'
and id_number not in (select id_number from temp_mack_parents_sara)
and id_number IN
    (select id_number from entity_record_type where record_type_code = 'PX'
    and id_number NOT IN (select id_number FROM entity_record_type WHERE record_type_code = 'AL')
    and class_year >= '2006'
    and id_number in
        (select id_number from ids where ids_type_code = 'CI1' and other_id IN
                    (select other_id from ids where ids_type_code = 'CID' and id_number in
                        (select id_number from entity_record_type where record_type_code = 'AL')))
    and id_number IN
        (select id_number from a_dw_pyramid where flag_alumni <> '1')));        
commit;        