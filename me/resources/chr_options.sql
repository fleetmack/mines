set serveroutput on;
begin
dbms_output.enable(100000);
for i in 1 ..255 loop
dbms_output.put_line(i||' '||chr(i));
end loop;
end;
/