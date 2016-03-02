update degrees   d1
    set   d1.degree_code = (select t1.mines_deg_code from temp_fix_deg t1 where d1.id_number = t1.id_number and d1.xsequence = t1.xsequence),
           d1.major_code1 = (select t1.mines_major_code1 from temp_fix_deg t1 where d1.id_number = t1.id_number and d1.xsequence = t1.xsequence),
           d1.dept_code = (select t1.mines_degree_dept from temp_fix_deg t1 where d1.id_number = t1.id_number and d1.xsequence = t1.xsequence),
           d1.date_modified = sysdate
where  exists
    (select t1.mines_deg_code from temp_fix_deg t1 where d1.id_number = t1.id_number and d1.xsequence = t1.xsequence);


delete from temp_student_load_orig t
where mines_major_code2 is   null
and t.id_number in
    (select dw.id_number from degrees dw
        where t.mines_deg_code = dw.degree_code
        and t.mines_major_code1 = dw.major_code1
        and t.mines_degree_dept = dw.dept_code);

select * from temp_student_load_orig
where mines_deg_code is not null;