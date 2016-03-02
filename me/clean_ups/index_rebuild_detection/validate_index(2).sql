spool c:\temp\index_spool.txt
                                                                                 
set pagesize 20                                                                                                                                                 
set linesize 120  
set timing on                                                                                                                                              
col name format a30 heading "Index Name";                                                                                                                       
col most_repeated_key format 999,999,999 heading "Most|Repeated|Key";                                                                                           
col distinct_keys format 999,999,999 heading "Distinct|Keys";                                                                                                   
col del_lf_rows format 999,999,999 heading "Delete|leaf|Rows";                                                                                                  
col height format 999 heading "Depth";                                                                                                                          
col blks_gets_per_access format 999,999,999 heading "Blocks Gets|Per Access";                                                                                   
col ILBF format 999,999.99 heading "(ILBF)Rows|LeafBlock";                                                                                                      
DROP TABLE TEMP_INDEX_STATS;                                                                                                                                    
CREATE TABLE TEMP_INDEX_STATS( name  varchar2(30), most_repeated_key    number, distinct_keys        number, del_lf_rows          number, lf_rows
              number, lf_blks              number, height               number, blks_gets_per_access number, create_date          date);                        
                                                                                                                                                                
!echo INDEX_NAME                                                                                                                      
ANALYZE INDEX INDEX_NAME VALIDATE STRUCTURE;                                                                                             
INSERT INTO TEMP_INDEX_STATS (SELECT name, most_repeated_key,distinct_keys,del_lf_rows,lf_rows,lf_blks,height, blks_gets_per_access,sysdate FROM index_stats);  
    
! REPEAT THE ANALYZE AND INSERT FOR EVERY INDEX
                                                                                                                                                                
  SELECT name,height,most_repeated_key,distinct_keys,del_lf_rows,                                                                                               
         decode(lf_blks,0,0,((lf_rows-del_lf_rows)/(lf_blks))) ILBF,                                                                                            
         blks_gets_per_access,lf_rows,lf_blks     FROM temp_index_stats order by height;                                                                        
                                                                                                                                                                
  SELECT name,height,most_repeated_key,distinct_keys,del_lf_rows,                                                                                               
         decode(lf_blks,0,0,((lf_rows-del_lf_rows)/(lf_blks))) ILBF,                                                                                            
         blks_gets_per_access,lf_rows,lf_blks     FROM temp_index_stats order by del_lf_rows;                                                                   
                                                                                                                                                                
exit;                                                                                                                                                           
