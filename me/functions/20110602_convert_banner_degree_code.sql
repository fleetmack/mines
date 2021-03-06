CREATE OR REPLACE function                                         ADVANCE.CONVERT_BANNER_DEGREE_CODE
(degree_desc IN VARCHAR2,major_desc IN VARCHAR2, mines_degree_dept IN VARCHAR2)
RETURN VARCHAR2
IS
    hold_mines_deg_code VARCHAR2(4);
BEGIN
IF degree_desc = 'Bachelor of Science' and 
   major_desc = 'Chemistry - Environmental Spec' and
   mines_degree_dept = 'CHEM'
   THEN
   hold_mines_deg_code := '16';
   
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Chemistry - Biochem Specialty' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_deg_code := '16'; 
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Chemistry' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_deg_code := '16';
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        (
        major_desc = 'Chemical Engineering' or 
        major_desc='Chem & Petr Refining Eng'
        ) and
        mines_degree_dept = 'CPR'
        THEN
        hold_mines_deg_code := '264';
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Chemical & Biochem Engineering' and
        mines_degree_dept = 'CPR'
        THEN
        hold_mines_deg_code := '1026';
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Economics - Business' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_deg_code := '409';
        
ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Economics - Global Business' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_deg_code := '409';        

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Economics' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_deg_code := '409';   

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Engineering - Civil' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '72';  

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Engineering - Mechanical' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '72'; 

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Engineering - Environmental' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '72'; 

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Engineering - Electrical' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '72'; 

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Geological Engineering - M/FEx' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_deg_code := '12'; 

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Geological Engineering - GTch' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_deg_code := '12';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Geophysical Engineering' and
        mines_degree_dept = 'GEOP'
        THEN
        hold_mines_deg_code := '15';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Math & CS - Computer Science' and
        mines_degree_dept = 'MATH'
        THEN
        hold_mines_deg_code := '502';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Math & CS - Comput & Appl Math' and
        mines_degree_dept = 'MATH'
        THEN
        hold_mines_deg_code := '502';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Math & CS - Statistics' and
        mines_degree_dept = 'MATH'
        THEN
        hold_mines_deg_code := '502';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Metallurgical & Materials Eng' and
        mines_degree_dept = 'MET'
        THEN
        hold_mines_deg_code := '505';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Mining Engineering' and
        mines_degree_dept = 'MIN'
        THEN
        hold_mines_deg_code := '10';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Petroleum Engineering' and
        mines_degree_dept = 'PET'
        THEN
        hold_mines_deg_code := '13';

ELSIF   degree_desc = 'Bachelor of Science' and 
        major_desc = 'Engineering Physics' and
        mines_degree_dept = 'PHY'
        THEN
        hold_mines_deg_code := '18';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Chemistry' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_deg_code := '27';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Geochemistry' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_deg_code := '31';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_deg_code := '1023';

ELSIF   degree_desc = 'Professional Master' and 
        major_desc = 'Environmental Geochemistry' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_deg_code := '1007';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Chemical Engineering' and
        mines_degree_dept = 'CPR'
        THEN
        hold_mines_deg_code := '269';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Mineral Economics' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_deg_code := '30';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Mineral & Energy Economics' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_deg_code := '1031';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering & Tech Management' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_deg_code := '1002';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering - Civil' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '386';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engr Sys- Mechanical Specialty' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '84';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Geochemistry' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '31';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Nuclear Engineering' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '1027';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering - Mechanical' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '386';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering Systems' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '386';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engr Systems - Civil Specialty' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '84';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '1023';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering - Electrical' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '386';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engr Sys- Electrical Specialty' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '84';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Engineering - Systems' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '386';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Environmental Sci & Enginrng' and
        mines_degree_dept = 'ENV'
        THEN
        hold_mines_deg_code := '71';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'ENV'
        THEN
        hold_mines_deg_code := '1023';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Geological Engineering - GTch' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_deg_code := '22';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Geology' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_deg_code := '1010';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Geochemistry' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_deg_code := '31';

ELSIF   degree_desc = 'Master of Engineering' and 
        major_desc IN ('Geological Engineering - GTch','Geological Engineer') and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_deg_code := '34';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_deg_code := '1023';

ELSIF   degree_desc = 'Professional Master' and 
        major_desc = 'Petroleum Reservoir Systems' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_deg_code := '1003';

ELSIF   degree_desc = 'Professional Master' and 
        major_desc = 'Mineral Exp & Mining Geosci' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_deg_code := '1006';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Geophysical Engineering' and
        mines_degree_dept = 'GEOP'
        THEN
        hold_mines_deg_code := '1011';

ELSIF   degree_desc = 'Professional Master' and 
        major_desc = 'Petroleum Reservoir Systems' and
        mines_degree_dept = 'GEOP'
        THEN
        hold_mines_deg_code := '1003';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'GEOP'
        THEN
        hold_mines_deg_code := '1023';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Geophysics' and
        mines_degree_dept = 'GEOP'
        THEN
        hold_mines_deg_code := '26';

ELSIF   degree_desc = 'Master of Int'||CHR(39)||'l Pol Econ Res' and 
        major_desc = 'Internat'||CHR(39)||'l Pol Econ of Rsrc' and
        mines_degree_dept = 'LAIS'
        THEN
        hold_mines_deg_code := '1020';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Math & CS - Comput & Appl Math' and
        mines_degree_dept = 'MATH'
        THEN
        hold_mines_deg_code := '503';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Mathematical & Computer Sci' and
        mines_degree_dept = 'MATH'
        THEN
        hold_mines_deg_code := '503';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Materials Science' and
        mines_degree_dept = 'MATSC'
        THEN
        hold_mines_deg_code := '77';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Metallurgical & Materials Eng' and
        mines_degree_dept = 'MET'
        THEN
        hold_mines_deg_code := '506';

ELSIF   degree_desc = 'Master of Engineering' and 
        major_desc = 'Metallurgical & Materials Eng' and
        mines_degree_dept = 'MET'
        THEN
        hold_mines_deg_code := '1017';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Nuclear Engineering' and
        mines_degree_dept = 'MET'
        THEN
        hold_mines_deg_code := '1027';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Mining & Earth Sys Engineering' and
        mines_degree_dept = 'MIN'
        THEN
        hold_mines_deg_code := '1018';

ELSIF   degree_desc = 'Master of Engineering' and 
        major_desc = 'Engineer of Mines' and
        mines_degree_dept = 'MIN'
        THEN
        hold_mines_deg_code := '32';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Petroleum Engineering' and
        mines_degree_dept = 'PET'
        THEN
        hold_mines_deg_code := '23';

ELSIF   degree_desc = 'Master of Engineering' and 
        major_desc = 'Petroleum Engineering' and
        mines_degree_dept = 'PET'
        THEN
        hold_mines_deg_code := '36';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Nuclear Engineering' and
        mines_degree_dept = 'PHY'
        THEN
        hold_mines_deg_code := '1027';

ELSIF   degree_desc = 'Master of Science' and 
        major_desc = 'Applied Physics' and
        mines_degree_dept = 'PHY'
        THEN
        hold_mines_deg_code := '1009';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Applied Chemistry' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_deg_code := '45';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Geochemistry' and
        mines_degree_dept = 'CHEM'
        THEN
        hold_mines_deg_code := '49';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Chemical Engineering' and
        mines_degree_dept = 'CPR'
        THEN
        hold_mines_deg_code := '270';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Mineral Economics' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_deg_code := '48';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Mineral & Energy Economics' and
        mines_degree_dept = 'ECON'
        THEN
        hold_mines_deg_code := '1030';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engineering - Mechanical' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '1028';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engineering - Civil' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '1028';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engineering - Electrical' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '1028';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engineering Systems' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '408';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engr Systems - Civil Specialty' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '408';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engr Sys- Electrical Specialty' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '408';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Engr Sys- Mechanical Specialty' and
        mines_degree_dept = 'ENG'
        THEN
        hold_mines_deg_code := '408';
        
ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Environmental Sci & Enginrng' and
        mines_degree_dept = 'ENV'
        THEN
        hold_mines_deg_code := '88';
        
ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'ENV'
        THEN
        hold_mines_deg_code := '1029';       

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc IN ('Geological Engineering - GTch','Geological Engineering') and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_deg_code := '85';

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Geology' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_deg_code := '40'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Hydrology' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_deg_code := '1029'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Geochemistry' and
        mines_degree_dept = 'GEOL'
        THEN
        hold_mines_deg_code := '49'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Geophysical Engineering' and
        mines_degree_dept = 'GEOP'
        THEN
        hold_mines_deg_code := '82'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Geophysics' and
        mines_degree_dept = 'GEOP'
        THEN
        hold_mines_deg_code := '44'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Math & CS - Comput & Appl Math' and
        mines_degree_dept = 'MATH'
        THEN
        hold_mines_deg_code := '504'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Materials Science' and
        mines_degree_dept = 'MATSC'
        THEN
        hold_mines_deg_code := '78'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Metallurgical & Materials Eng' and
        mines_degree_dept = 'MET'
        THEN
        hold_mines_deg_code := '507'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Mining Engineering' and
        mines_degree_dept = 'MIN'
        THEN
        hold_mines_deg_code := '38'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Mining & Earth Sys Engineering' and
        mines_degree_dept = 'MIN'
        THEN
        hold_mines_deg_code := '1008'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Petroleum Engineering' and
        mines_degree_dept = 'PET'
        THEN
        hold_mines_deg_code := '41'; 

ELSIF   degree_desc = 'Doctor of Philosophy' and 
        major_desc = 'Applied Physics' and
        mines_degree_dept = 'PHY'
        THEN
        hold_mines_deg_code := '102';
END IF;
RETURN hold_mines_deg_code;
END;