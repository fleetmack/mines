drop table temp_van_kirk;
commit;
/

create table temp_van_kirk
as
(select id_number
   from a_dw_address_good
  where record_type_code = 'AL'
    and id_number IN
        (select id_number
           from a_dw_degrees
          where dept_code = 'PET'
            and institution_code = '1')
    and id_number IN
        (select id_number
           from a_dw_gift_clubs
          where flag_cs = '1'));
commit;
/

insert into temp_van_kirk
(select id_number
   from a_dw_address_good
  where record_type_code = 'AL'
    and id_number in
        (select id_number
           from a_dw_degrees
          where dept_code = 'PET'
            and institution_code = '1')
    and id_number in
        (select id_number
           from a_dw_gift_clubs
          where (gugg06 = '1'
                 or gugg07 = '1')
            and flag_cs <> '1'));
commit;
/

insert into temp_van_kirk
(select id_number
  from a_dw_address_good
 where record_type_code = 'AL'
   and id_number in
    (select id_number
       from a_dw_degrees
      where dept_code = 'PET'
        and institution_code = '1')
   and id_number IN
    (select id_number
       from a_dw_gift_clubs
      where (pc06 = '1'
             or pc07 = '1'))
    and id_number NOT IN
        (select id_number
           from a_dw_gift_clubs
          where (gugg06 = '1'
                  or gugg07 = '1'
                  or flag_cs = '1'))
        and id_number IN
        (select id_number
           from a_dw_pyramid
          where year_of_giving IN ('2006','2007')
            and alloc in
                (select allocation_code
                   from allocation
                  where lower(long_name) like '%petrol%'
                     or program_code = 'PET'
                     or alloc_dept_code = 'PE')));
commit;
/