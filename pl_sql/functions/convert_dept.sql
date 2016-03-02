CREATE OR REPLACE FUNCTION           ADVANCE.CONVERT_DEPT
(dept_code IN VARCHAR2)
RETURN VARCHAR2
IS
    hold_dept VARCHAR2(10);
BEGIN
IF dept_code = 'Chemical Engineering' THEN hold_dept := 'CPR';
ELSIF (dept_code) = 'Chemistry' THEN hold_dept := 'CHEM';
ELSIF (dept_code) = 'Geochemistry' THEN hold_dept := 'CHEM';
ELSIF (dept_code) = 'Economics and Business' THEN hold_dept := 'ECON';
ELSIF (dept_code) = 'Engineering' THEN hold_dept := 'ENG';
ELSIF (dept_code) = 'Environ Science & Engineering' THEN hold_dept := 'ENV';
ELSIF (dept_code) = 'Geology' THEN hold_dept := 'GEOL';
ELSIF (dept_code) = 'Geophysics' THEN hold_dept := 'GEOP';
ELSIF (dept_code) = 'Liberal Arts & Intern'||CHR(39)||'l Study' THEN hold_dept := 'GEOL';
ELSIF (dept_code) = 'Materials Science' THEN hold_dept := 'MATSC';
ELSIF (dept_code) = 'Mathematics' THEN hold_dept := 'MATH';
ELSIF (dept_code) = 'Metallurgical & Materials Eng' THEN hold_dept := 'MET';
ELSIF (dept_code) = 'Mineral Economics' THEN hold_dept := 'ECON';
ELSIF (dept_code) = 'Mining' THEN hold_dept := 'MIN';
ELSIF (dept_code) = 'Petroleum' THEN hold_dept := 'PET';
ELSIF (dept_code) = 'Physics' THEN hold_dept := 'PHY';
END IF;
RETURN hold_dept;
END;