/*** Combine Rows for Something ***/
select id_number,
       max(decode(xsequence,1,date_of_record2,null))||', '||
       max(decode(xsequence,2,date_of_record2,null))||', '||
       max(decode(xsequence,3,date_of_record2,null))||', '||
       max(decode(xsequence,4,date_of_record2,null))||', '||
       max(decode(xsequence,5,date_of_record2,null))||', '||
       max(decode(xsequence,6,date_of_record2,null))||', '||
       max(decode(xsequence,7,date_of_record2,null))||', '||
       max(decode(xsequence,8,date_of_record2,null)) as dates_of_record
from a_temp_temp
where  id_number = '0000031785'
group by id_number
