/*** PC members in FY11 by society ***/
SELECT e.id_number, 
       e.pref_mail_name,
       e.pref_name_sort,
       e.report_Name,
       (CASE
        WHEN joint_total_pfy < 2500 THEN 'Member'
        WHEN joint_total_pfy BETWEEN 2500 AND 4999.99 THEN 'Supporting Member'
        WHEN joint_total_pfy BETWEEN 5000 AND 9999.99 THEN 'Sustaining Member'
        WHEN joint_total_pfy BETWEEN 10000 AND 24999.99 THEN 'Investing Member'
        WHEN joint_total_pfy >= 25000 THEN 'Guggenheim Member'
        END) membership
  FROM a_dw_gift_clubs dw,
       entity e
 WHERE e.id_number = dw.id_number
   AND dw.pc11 = '1'
ORDER BY membership 
   
   
   
   
   --member             < 2500
   --supporting memeber 2500 - 4999
   --sustaining memeber 5000 - 9999
   --investing memeber 10000 - 24999
   --guggenheim member 25000+
