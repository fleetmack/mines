/*** Engineering Allocations ***/
select allocation_code, account, long_name, alloc_dept_code, 
decode(cfae_purpose_code, 'ER','Endowment-Research',
                                        'ED','Endowment-Adademic Divisions',
                                        'CF','Current Operations-Student Aid',
                                        'CD','Current Operations - Academic Divisions',
                                        'CO','Current Operations - Other Restricted',
                                        'CE','Current Operations - Faculty and Staff',
                                        'EF','Endowment - Student Aid',
                                        'CR','Current Operations - Research') as cfae_purpose,
program_code, description
from allocation
where alloc_dept_code = 'EN'
and status_code = 'A'
order by long_name;