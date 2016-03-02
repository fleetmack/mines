CREATE OR REPLACE function                         ADVANCE.CONVERT_BANNER_MINOR_CODE
(primary_minor_desc IN VARCHAR2)
RETURN VARCHAR2
IS
    hold_mines_minor_code VARCHAR2(4);
BEGIN
IF primary_minor_desc = 'Bioengineering & Life Sciences'
    THEN hold_mines_minor_code := '1070';
ELSIF primary_minor_desc = 'Chemical Engineering'
    THEN hold_mines_minor_code := '465';
ELSIF primary_minor_desc = 'Chemistry'
    THEN hold_mines_minor_code := '351';
ELSIF primary_minor_desc IN ('Economics','Economics - Business')
    THEN hold_mines_minor_code := '915';
ELSIF primary_minor_desc = 'Energy'
    THEN hold_mines_minor_code := '1084';
    ELSIF primary_minor_desc = 'Engineering'
    THEN hold_mines_minor_code := '10';
ELSIF primary_minor_desc = 'Engineering - Civil'
    THEN hold_mines_minor_code := '466';
ELSIF primary_minor_desc = 'Engineering - Electrical'
    THEN hold_mines_minor_code := '468';
ELSIF primary_minor_desc = 'Engineering - Mechanical'
    THEN hold_mines_minor_code := '478';
ELSIF primary_minor_desc = 'Engineering Physics'
    THEN hold_mines_minor_code := '471';
ELSIF primary_minor_desc = 'Engineering & Tech Management'
    THEN hold_mines_minor_code := '308';
ELSIF primary_minor_desc = 'Environmental Sci & Enginrng'
    THEN hold_mines_minor_code := '1079';
ELSIF primary_minor_desc = 'Geochemistry'
    THEN hold_mines_minor_code := '540';
ELSIF primary_minor_desc = 'Geological Engineering - GTch'
    THEN hold_mines_minor_code := '1065';
ELSIF primary_minor_desc = 'Geology'
    THEN hold_mines_minor_code := '2';
ELSIF primary_minor_desc = 'Geophysical Engineering'
    THEN hold_mines_minor_code := '475';
ELSIF primary_minor_desc = 'Geophysics'
    THEN hold_mines_minor_code := '5';
ELSIF primary_minor_desc = 'Humanitarian Engineering'
    THEN hold_mines_minor_code := '1072';
ELSIF primary_minor_desc = 'Humanitarian Studies & Tech'
    THEN hold_mines_minor_code := '1073';
ELSIF primary_minor_desc = 'Humanities'
    THEN hold_mines_minor_code := '763';
ELSIF primary_minor_desc IN ('International Political Econ','Internat'||CHR(39)||'l Pol Econ of Rsrc')
    THEN hold_mines_minor_code := '1039';
ELSIF primary_minor_desc = 'International Studies'
    THEN hold_mines_minor_code := '1075';
ELSIF primary_minor_desc = 'Materials Science'
    THEN hold_mines_minor_code := '16';
ELSIF primary_minor_desc IN ('Math & CS - Comput & Appl Math','Computational and Applied Math')
    THEN hold_mines_minor_code := '1067';
ELSIF primary_minor_desc = 'Math & CS - Computer Science'
    THEN hold_mines_minor_code := '1083';
ELSIF primary_minor_desc = 'Math & CS - Statistics'
    THEN hold_mines_minor_code := '1068'; 
ELSIF primary_minor_desc = 'McBride Hnrs in Public Affairs'
    THEN hold_mines_minor_code := '1076';
ELSIF primary_minor_desc = 'Metallurgical Engineering'
    THEN hold_mines_minor_code := '479';   
ELSIF primary_minor_desc = 'Metallurgical & Materials Eng'
    THEN hold_mines_minor_code := '479';
ELSIF primary_minor_desc = 'Military Science'
    THEN hold_mines_minor_code := '753';
ELSIF primary_minor_desc = 'Mineral & Energy Economics'
    THEN hold_mines_minor_code := '1080';
ELSIF primary_minor_desc = 'Mineral Economics'
    THEN hold_mines_minor_code := '12';    
ELSIF primary_minor_desc = 'Mining Engineering'
    THEN hold_mines_minor_code := '480';
ELSIF primary_minor_desc = 'Petroleum Engineering'
    THEN hold_mines_minor_code := '3';    
ELSIF primary_minor_desc = 'Public Affairs'
    THEN hold_mines_minor_code := '1077';
ELSIF primary_minor_desc = 'Science, Tech & Society'
    THEN hold_mines_minor_code := '1082';
ELSIF primary_minor_desc = 'Science, Tech, Engin, & Policy'
    THEN hold_mines_minor_code := '1085';
END IF;
RETURN hold_mines_minor_code;
END;