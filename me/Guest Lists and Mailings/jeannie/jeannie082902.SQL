SELECT  NVL(SUM(t.associated_amount),0) + NVL(SUM(t.prim_pledge_amount_os),0)
      FROM  a_dw_commitment_summary_temp    t
     WHERE  t.transaction_type              IN ('MC', 'MG')
       AND  t.record_type_code              = 'OO'
       AND  t.flag_trans_resources          = 1


       select * from entity
       where record_type_code = 'OO'
       and record_status_code = 'A'
       and id_number in
       (select id_number from a_dw_pyramid)
