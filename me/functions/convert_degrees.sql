CREATE OR REPLACE FUNCTION           ADVANCE.CONVERT_DEGREES 
(degree_code IN VARCHAR2)
RETURN VARCHAR2
IS
    hold_degree_code VARCHAR2(10);
BEGIN
IF length(degree_code) = 1 THEN hold_degree_code := '000000000'||id_num;
ELSIF length(degree_code) = 2 THEN hold_degree_code := '00000000'||id_num;
ELSIF length(degree_code) = 3 THEN hold_degree_code := '0000000'||id_num;
ELSIF length(degree_code) = 4 THEN hold_degree_code := '000000'||id_num;
ELSIF length(degree_code) = 5 THEN hold_degree_code := '00000'||id_num;
ELSIF length(degree_code) = 6 THEN hold_degree_code := '0000'||id_num;
END IF;
RETURN hold_degree_code;
END;