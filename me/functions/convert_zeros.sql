drop table test_function;
commit;

create table test_function
(id_number varchar2(10));
commit;
/
insert into test_function values ('111');
insert into test_function values ('2222');
insert into test_function values ('33333');
commit;

select * 
from test_function;


select convert_zeros(id_number)
from test_function;



CREATE OR REPLACE FUNCTION convert_zeros
(id_num IN VARCHAR2)
RETURN VARCHAR2
IS
    hold_id VARCHAR2(10);
BEGIN
IF length(id_num) = 1 THEN hold_id := '000000000'||id_num;
ELSIF length(id_num) = 2 THEN hold_id := '00000000'||id_num;
ELSIF length(id_num) = 3 THEN hold_id := '0000000'||id_num;
ELSIF length(id_num) = 4 THEN hold_id := '000000'||id_num;
ELSIF length(id_num) = 5 THEN hold_id := '00000'||id_num;
ELSIF length(id_num) = 6 THEN hold_id := '0000'||id_num;
END IF;
RETURN hold_id;
END;
/
