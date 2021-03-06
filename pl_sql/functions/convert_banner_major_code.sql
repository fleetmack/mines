CREATE OR REPLACE function                          ADVANCE.CONVERT_BANNER_MAJOR_CODE
(degree_desc IN VARCHAR2,major_desc IN VARCHAR2, mines_degree_dept IN VARCHAR2)
RETURN VARCHAR2
IS
    hold_mines_major_code VARCHAR2(4);
BEGIN
IF degree_desc = 'Bachelor of Science' and 
   major_desc = 'Chemistry - Environmental Spec' and
   mines_degree_dept = 'CHEM'
   THEN
   hold_mines_major_code := '356';
   
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Chemistry - Biochem Specialty' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_major_code := '1069'; 
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Chemistry' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_major_code := '351';
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        (
        major_desc = 'Chemical Engineering' or 
        major_desc='Chem & Petr Refining Eng'
        ) and
        mines_degree_dept = 'CPR'
        THEN
        hold_mines_major_code := '465';
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Chemical & Biochem Engineering' and
        mines_degree_dept = 'CPR'
        THEN
        hold_mines_major_code := '469';
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Engineering - Civil' and
        mines_degree_dept = 'CVEV'
        THEN
        hold_mines_major_code := '466';  
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Engineering - Environmental' and
        mines_degree_dept = 'CVEV'
        THEN
        hold_mines_major_code := '996'; 
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Economics - Business' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_major_code := '304';
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Economics - Global Business' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_major_code := '306';        

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Economics' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_major_code := '915';   

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Engineering - Electrical' and
        mines_degree_dept = 'EECS'
        THEN
        hold_mines_major_code := '468'; 
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Math & CS - Computer Science' and
        mines_degree_dept = 'EECS'
        THEN
        hold_mines_major_code := '1086';
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Engineering - Civil' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '466';  

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Engineering - Mechanical' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '478'; 

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Engineering - Environmental' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '996'; 

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Engineering - Electrical' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '468'; 

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Geological Engineering - M/FEx' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '1066'; 

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Geological Engineering - GTch' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '1065';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Geophysical Engineering' and
        mines_degree_dept = 'GEOP'
        THEN
        hold_mines_major_code := '475';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Math & CS - Computer Science' and
        mines_degree_dept = 'MATH'
        THEN
        hold_mines_major_code := '391';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Math & CS - Comput & Appl Math' and
        mines_degree_dept = 'MATH'
        THEN
        hold_mines_major_code := '1067';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Math & CS - Statistics' and
        mines_degree_dept = 'MATH'
        THEN
        hold_mines_major_code := '1068';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Engineering - Mechanical' and
        mines_degree_dept = 'MECH'
        THEN
        hold_mines_major_code := '478'; 
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Metallurgical & Materials Eng' and
        mines_degree_dept = 'MET'
        THEN
        hold_mines_major_code := '1089';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Mining Engineering' and
        mines_degree_dept = 'MIN'
        THEN
        hold_mines_major_code := '9';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Math & CS - Comput & Appl Math' and
        mines_degree_dept = 'MTHST'
        THEN
        hold_mines_major_code := '1067';
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Math & CS - Statistics' and
        mines_degree_dept = 'MTHST'
        THEN
        hold_mines_major_code := '1068';        
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Petroleum Engineering' and
        mines_degree_dept = 'PET'
        THEN
        hold_mines_major_code := '3';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Engineering Physics' and
        mines_degree_dept = 'PHY'
        THEN
        hold_mines_major_code := '471';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Chemistry' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_major_code := '351';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Geochemistry' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_major_code := '540';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_major_code := '1005';

ELSIF   degree_desc = 'Professional Master' and 
        major_desc = 'Environmental Geochemistry' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_major_code := '540';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Chemical Engineering' and
        mines_degree_dept = 'CPR'
        THEN
        hold_mines_major_code := '465';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering - Civil' and
        mines_degree_dept = 'CVEV'
        THEN
        hold_mines_major_code := '466';
        
ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Environmental Sci & Enginrng' and
        mines_degree_dept = 'CVEV'
        THEN
        hold_mines_major_code := '1085';
        
ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'CVEV'
        THEN
        hold_mines_major_code := '1005';
        
ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Mineral Economics' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_major_code := '12';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Mineral & Energy Economics' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_major_code := '1080';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering & Tech Management' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_major_code := '1087';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering - Electrical' and
        mines_degree_dept = 'EECS'
        THEN
        hold_mines_major_code := '468';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering - Systems' and
        mines_degree_dept = 'EECS'
        THEN
        hold_mines_major_code := '488';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Mathematical & Computer Sci' and
        mines_degree_dept = 'EECS'
        THEN
        hold_mines_major_code := '1081';
        
ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering - Civil' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '466';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engr Sys- Mechanical Specialty' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '478';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Geochemistry' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '540';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Nuclear Engineering' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '482';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering - Mechanical' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '478';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering Systems' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '488';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engr Systems - Civil Specialty' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '466';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '1005';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering - Electrical' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '468';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engr Sys- Electrical Specialty' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '468';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering - Systems' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '488';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Environmental Sci & Enginrng' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '13';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'ENV'
        THEN
        hold_mines_major_code := '1005';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Environmental Sci & Enginrng' and
        mines_degree_dept = 'ENV'
        THEN
        hold_mines_major_code := '1085';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Geological Engineering - GTch' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '1065';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Geology' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '2';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Geochemistry' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '540';

ELSIF   degree_desc = 'Master of Engineering' and 
        major_desc = 'Geological Engineering - GTch' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '1062';

ELSIF   degree_desc = 'Master of Engineering' and 
        major_desc = 'Geological Engineer' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '474';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '1005';

ELSIF   degree_desc = 'Professional Master' and 
        major_desc = 'Petroleum Reservoir Systems' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '5';

ELSIF   degree_desc = 'Professional Master' and 
        major_desc = 'Mineral Exp & Mining Geosci' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '1082';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Geophysical Engineering' and
        mines_degree_dept = 'GEOP'
        THEN
        hold_mines_major_code := '475';

ELSIF   degree_desc = 'Professional Master' and 
        major_desc = 'Petroleum Reservoir Systems' and
        mines_degree_dept = 'GEOP'
        THEN
        hold_mines_major_code := '1088';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'GEOP'
        THEN
        hold_mines_major_code := '1005';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Geophysics' and
        mines_degree_dept = 'GEOP'
        THEN
        hold_mines_major_code := '5';

ELSIF   degree_desc = 'Master of Int'||CHR(39)||'l Pol Econ Res' and 
        major_desc = 'Internat'||CHR(39)||'l Pol Econ of Rsrc' and
        mines_degree_dept = 'LAIS'
        THEN
        hold_mines_major_code := '1039';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Math & CS - Comput & Appl Math' and
        mines_degree_dept = 'MATH'
        THEN
        hold_mines_major_code := '1067';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Mathematical & Computer Sci' and
        mines_degree_dept = 'MATH'
        THEN
        hold_mines_major_code := '1081';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Materials Science' and
        mines_degree_dept = 'MATSC'
        THEN
        hold_mines_major_code := '16';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering - Mechanical' and
        mines_degree_dept = 'MECH'
        THEN
        hold_mines_major_code := '478';
        
ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Metallurgical & Materials Eng' and
        mines_degree_dept = 'MET'
        THEN
        hold_mines_major_code := '1089';

ELSIF   degree_desc = 'Master of Engineering' and 
        major_desc = 'Metallurgical & Materials Eng' and
        mines_degree_dept = 'MET'
        THEN
        hold_mines_major_code := '1089';
        
ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Nuclear Engineering' and
        mines_degree_dept = 'MET'
        THEN
        hold_mines_major_code := '482';        

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Mining & Earth Sys Engineering' and
        mines_degree_dept = 'MIN'
        THEN
        hold_mines_major_code := '1090';

ELSIF   degree_desc = 'Master of Engineering' and 
        major_desc = 'Engineer of Mines' and
        mines_degree_dept = 'MIN'
        THEN
        hold_mines_major_code := '9';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Mathematical & Computer Sci' and
        mines_degree_dept = 'MTHST'
        THEN
        hold_mines_major_code := '1081';
        
ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Petroleum Engineering' and
        mines_degree_dept = 'PET'
        THEN
        hold_mines_major_code := '3';

ELSIF   degree_desc = 'Master of Engineering' and 
        major_desc = 'Petroleum Engineering' and
        mines_degree_dept = 'PET'
        THEN
        hold_mines_major_code := '3';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Nuclear Engineering' and
        mines_degree_dept = 'PHY'
        THEN
        hold_mines_major_code := '482';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Applied Physics' and
        mines_degree_dept = 'PHY'
        THEN
        hold_mines_major_code := '80';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Applied Chemistry' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_major_code := '357';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Geochemistry' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_major_code := '540';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Chemical Engineering' and
        mines_degree_dept = 'CPR'
        THEN
        hold_mines_major_code := '465';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engineering - Systems' and
        mines_degree_dept = 'CVEV'
        THEN
        hold_mines_major_code := '488';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Environmental Sci & Enginrng' and
        mines_degree_dept = 'CVEV'
        THEN
        hold_mines_major_code := '1085';
        
ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Mineral Economics' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_major_code := '12';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Mineral & Energy Economics' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_major_code := '1080';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engineering - Electrical' and
        mines_degree_dept = 'EECS'
        THEN
        hold_mines_major_code := '468';
        
ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Mathematical & Computer Sci' and
        mines_degree_dept = 'EECS'
        THEN
        hold_mines_major_code := '1081';        
        
ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engineering - Mechanical' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '478';
        
ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engineering - Civil' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '466';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engineering - Electrical' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '468';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engineering Systems' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '488';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engr Systems - Civil Specialty' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '466';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engr Sys- Electrical Specialty' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '468';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engr Sys- Mechanical Specialty' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_major_code := '478';
        
ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Environmental Sci & Enginrng' and
        mines_degree_dept = 'ENV'
        THEN
        hold_mines_major_code := '996';
        
ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'ENV'
        THEN
        hold_mines_major_code := '1005';       

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Geological Engineering - GTch' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '1065'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Geology' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '2';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Geological Engineering' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '474'; 
        
ELSIF   degree_desc = 'Professional Master' and 
        major_desc = 'Mineral Exploration' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '1066';        

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '1005'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Geochemistry' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_major_code := '540'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Geophysical Engineering' and
        mines_degree_dept = 'GEOP'
        THEN
        hold_mines_major_code := '475'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Geophysics' and
        mines_degree_dept = 'GEOP'
        THEN
        hold_mines_major_code := '5'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Math & CS - Comput & Appl Math' and
        mines_degree_dept = 'MATH'
        THEN
        hold_mines_major_code := '1067'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Materials Science' and
        mines_degree_dept = 'MATSC'
        THEN
        hold_mines_major_code := '16'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engineering - Mechanical' and
        mines_degree_dept = 'MECH'
        THEN
        hold_mines_major_code := '478';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engineering - Systems' and
        mines_degree_dept = 'MECH'
        THEN
        hold_mines_major_code := '488';
        
ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Metallurgical & Materials Eng' and
        mines_degree_dept = 'MET'
        THEN
        hold_mines_major_code := '1089'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Mining Engineering' and
        mines_degree_dept = 'MIN'
        THEN
        hold_mines_major_code := '9'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Mining & Earth Sys Engineering' and
        mines_degree_dept = 'MIN'
        THEN
        hold_mines_major_code := '1090'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Petroleum Engineering' and
        mines_degree_dept = 'PET'
        THEN
        hold_mines_major_code := '3'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Applied Physics' and
        mines_degree_dept = 'PHY'
        THEN
        hold_mines_major_code := '80';
END IF;
RETURN hold_mines_major_code;
END;