CREATE OR REPLACE function
        ADVANCE.CONVERT_BANNER_DEGREE_LEVEL
(degree_desc IN Varchar2)
RETURN varchar2
IS
    hold_deg_level VARCHAR2(1);
BEGIN
IF degree_desc = 'Master of Engineering' THEN hold_deg_level := 'M';
ELSIF degree_desc = 'Master of Int'||CHR(39)||'l Pol Econ Res' THEN hold_deg_level := 'M';
ELSIF degree_desc = 'Master of Science' THEN hold_deg_level := 'M';
ELSIF degree_desc = 'Professional Master' THEN hold_deg_level := 'M';
ELSIF degree_desc = 'Bachelor of Science' THEN hold_deg_level := 'B';
ELSIF degree_desc = 'Doctor of Philosophy' THEN hold_deg_level := 'D';
END IF;
RETURN hold_deg_level;
END;