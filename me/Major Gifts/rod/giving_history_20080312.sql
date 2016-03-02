/********************* Rod's Fundraising History By Year ***********************************/
select '$'||sum(associated_amount + associated_amount_match + associated_amount_claim)  "FY08 Giving",
       '$'||sum(total_commitment) "FY08 Commitment"
from a_dw_pyramid
where id_number in
    (select id_number
       from a_dw_assignment
      where ass_id_number = '0000033218')
  and date_of_record BETWEEN '20070701' and '20080630';
  
select '$'||sum(associated_amount + associated_amount_match + associated_amount_claim)  "FY07 Giving",
       '$'||sum(total_commitment) "FY07 Commitment"
from a_dw_pyramid
where id_number in
    (select id_number
       from a_dw_assignment
      where ass_id_number = '0000033218')
  and date_of_record BETWEEN '20060701' and '20070630';
  
select '$'||sum(associated_amount + associated_amount_match + associated_amount_claim)  "FY06 Giving",
       '$'||sum(total_commitment) "FY06 Commitment"
from a_dw_pyramid
where id_number in
    (select id_number
       from a_dw_assignment
      where ass_id_number = '0000033218')
  and date_of_record BETWEEN '20050701' and '20060630';
  
select '$'||sum(associated_amount + associated_amount_match + associated_amount_claim)  "FY05 Giving",
       '$'||sum(total_commitment) "FY05 Commitment"
from a_dw_pyramid
where id_number in
    (select id_number
       from a_dw_assignment
      where ass_id_number = '0000033218')
  and date_of_record BETWEEN '20040701' and '20050630';
  
select '$'||sum(associated_amount + associated_amount_match + associated_amount_claim)  "FY04 Giving",
       '$'||sum(total_commitment) "FY04 Commitment"
from a_dw_pyramid
where id_number in
    (select id_number
       from a_dw_assignment
      where ass_id_number = '0000033218')
  and date_of_record BETWEEN '20030701' and '20040630';
  
select '$'||sum(associated_amount + associated_amount_match + associated_amount_claim)  "FY03 Giving",
       '$'||sum(total_commitment) "FY03 Commitment"
from a_dw_pyramid
where id_number in
    (select id_number
       from a_dw_assignment
      where ass_id_number = '0000033218')
  and date_of_record BETWEEN '20020701' and '20030630';