/*** Must be logged on as the owner name for the results this produces to be executed successfully ***/
/*** Drop Temp Table ***/
DROP TABLE TEMP_INDEX_STATS;     
/*** Create Temp Table ***/                                                                                                                               
CREATE TABLE TEMP_INDEX_STATS
 (name  varchar2(30),
  most_repeated_key    number, 
  distinct_keys        number, 
  del_lf_rows          number, 
  lf_rows              number, 
  lf_blks              number, 
  height               number, 
  blks_gets_per_access number, 
  create_date          date);   


/*** Create Result Set To Copy & Paste, then run, to create temp table ***/
SELECT 'ANALYZE INDEX '||index_name|| ' COMPUTE STATISTICS;',
       'ANALYZE INDEX '||index_name|| ' VALIDATE STRUCTURE;',
       'INSERT INTO TEMP_INDEX_STATS (SELECT name, most_repeated_key,distinct_keys,del_lf_rows,lf_rows,lf_blks,height, blks_gets_per_access,sysdate FROM index_stats);'
 FROM dba_indexes
WHERE owner = 'ADVANCE';


/*** Display Data FroM Temp Tables ***/
  SELECT name,
         height,
         most_repeated_key,
         distinct_keys,
         del_lf_rows, 
         lf_rows,                                                                                              
         decode(del_lf_rows,0,0,(del_lf_rows/lf_rows)) "% Deleted Leaf Rows",                                                                                            
         blks_gets_per_access,lf_rows,lf_blks     
    FROM temp_index_stats order by height desc,  "% Deleted Leaf Rows" DESC;                                                                        
                                                                                                                                                                
  SELECT name,
         height,
         most_repeated_key,
         distinct_keys,
         del_lf_rows, 
         lf_rows,                                                                                              
        -- decode(lf_blks,0,0,((lf_rows-del_lf_rows)/(lf_blks))) ILBF, 
         decode(del_lf_rows,0,0,(del_lf_rows/lf_rows)) "% Deleted Leaf Rows",                                                                                            
         blks_gets_per_access,lf_rows,lf_blks     
    FROM temp_index_stats order by "% Deleted Leaf Rows" DESC;   