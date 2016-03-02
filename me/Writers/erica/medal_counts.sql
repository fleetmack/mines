/*** Distinguished Achievement Medal ***/
select count(id_number) as distinguished_achv_medal_count
from awards_and_honors
where awd_honor_code = 'DA'
and id_number in
    (select id_number
      from entity
      where record_status_code = 'A');
      
      
/*** Mines Medal ***/
select count(id_number) as mines_medal_count
from awards_and_honors
where awd_honor_code = 'MM'
and id_number in
    (select id_number
      from entity
      where record_status_code = 'A');
      
      
/*** van Diest Medal ***/
select count(id_number) as van_diest_medal_count
from awards_and_honors
where awd_honor_code = 'VD'
and id_number in
    (select id_number
      from entity
      where record_status_code = 'A');
      
      
/*** Brown Medal ***/
select count(id_number) as brown_medal_count
from awards_and_honors
where awd_honor_code = 'BM'
and id_number in
    (select id_number
      from entity
      where record_status_code = 'A');