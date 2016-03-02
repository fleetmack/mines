begin
dbms_output.enable(1000000);
end;
/
declare
v_cursor sys_refcursor;
a varchar2(100);
b varchar2(100);
c varchar2(100);
d varchar2(100);
e varchar2(100);
f varchar2(100);
g varchar2(100);
begin test_mack_list(p_recordset => v_cursor);
loop
fetch v_cursor into  a,b,c,d,e,f,g;
exit when v_cursor%notfound;
dbms_output.put_line(a||b||c||d||e||f||g);
end loop;
close v_cursor;
end;