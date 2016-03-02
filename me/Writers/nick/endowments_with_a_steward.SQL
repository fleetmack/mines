


select  * from a_dw_assignment
where id_number in
    (select id_number 
       from a_dw_stewardship)
order by ass_pref_name_sort;
