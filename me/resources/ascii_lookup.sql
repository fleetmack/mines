/*** put what you want to look up in the ascii(' '); spot on line 4 ***/

declare
    plus_ascii constant number := ascii('\');
   plus_chr   constant char(1) := chr(plus_ascii);
   begin
    dbms_output.put_line ('Ascii value for '||plus_chr||' is '||plus_ascii||'.');
   end;
