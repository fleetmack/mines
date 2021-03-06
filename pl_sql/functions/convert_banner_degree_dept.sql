CREATE OR REPLACE function
                                        ADVANCE.CONVERT_BANNER_DEGREE_DEPT
(dept_desc IN VARCHAR2)
RETURN VARCHAR2
IS
    hold_degree_dept VARCHAR2(5);
BEGIN
IF dept_desc = 'Chemical Engineering' THEN hold_degree_dept := 'CPR';
ELSIF dept_desc = 'Chemical & Biological Engineer' THEN hold_degree_dept := 'CPR';
ELSIF dept_desc = 'Chemistry' THEN hold_degree_dept := 'CHEM';
ELSIF dept_desc = 'Geochemistry' THEN hold_degree_dept := 'CHEM';
ELSIF dept_desc = 'Civil & Environmental Enginrng' THEN hold_degree_dept := 'CVEV';
ELSIF dept_desc = 'Economics and Business' THEN hold_degree_dept := 'ECON';
ELSIF dept_desc = 'Electrical Enginrg & Comp Sci' THEN hold_degree_dept := 'EECS';
ELSIF dept_desc = 'Engineering' THEN hold_degree_dept := 'ENG';
ELSIF dept_desc = 'Environ Science & Engineering' THEN hold_degree_dept := 'ENV';
ELSIF dept_desc = 'Geology' THEN hold_degree_dept := 'GEOL';
ELSIF dept_desc = 'Geophysics' THEN hold_degree_dept := 'GEOP';
ELSIF dept_desc = 'Liberal Arts & Intern'||CHR(39)||'l Study' THEN hold_degree_dept := 'LAIS';
ELSIF dept_desc = 'Materials Science' THEN hold_degree_dept := 'MATSC';
ELSIF dept_desc = 'Applied Math & Statistics' THEN hold_degree_dept := 'MTHST';
ELSIF dept_desc = 'Mathematics' THEN hold_degree_dept := 'MATH';
ELSIF dept_desc = 'Mechanical Engineering' THEN hold_degree_dept := 'MECH';
ELSIF dept_desc = 'Metallurgical & Materials Eng' THEN hold_degree_dept := 'MET';
ELSIF dept_desc = 'Mineral Economics' THEN hold_degree_dept := 'ECON';
ELSIF dept_desc = 'Mining' THEN hold_degree_dept := 'MIN';
ELSIF dept_desc = 'Petroleum' THEN hold_degree_dept := 'PET';
ELSIF dept_desc = 'Physics' THEN hold_degree_dept := 'PHY';
ELSIF dept_desc = 'Undecided' THEN hold_degree_dept := 'U';
END IF;
RETURN hold_degree_dept;
END;