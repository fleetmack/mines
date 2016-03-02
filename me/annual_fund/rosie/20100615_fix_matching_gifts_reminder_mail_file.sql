drop table temp_mack_blah;
commit;

create table temp_mack_blah
as
(select a2.id_number, sum(amount_gift) amount_gift
                from a_mgm_3  a2
              group by a2.id_number);
commit;
     
update a_mgm_3    a1
set a1.amount_gift =
    (select t.amount_gift
         from temp_mack_blah t
    where a1.id_number = t.id_number);
commit;


UPDATE      a_mgm_3
   SET      text_amount_gift                          = 'of '||
            LTRIM(TO_CHAR(amount_gift,'$999,999,999,999'),' ');
COMMIT;
/

delete from a_mgm_3
where id_number in
    (select id_number
        from a_mgm_3
       group by id_number
       having count(*) > 1)
and receipt NOT IN
    (select receipt
        from  
            (select id_number, max(receipt) receipt
               from a_mgm_3
               group by id_number));
commit;

--select * from a_mgm_3
--order by id_number;
