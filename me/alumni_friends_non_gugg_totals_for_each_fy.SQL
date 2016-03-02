/***FY03***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) as FY03 from a_dw_pyramid
where date_of_record between '20020701' and '20030630'
and record_type_code IN ('FR','AL','PX','PA')
and associated_amount + associated_amount_match + associated_amount_claim < 25000;


/***FY02***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) as FY02 from a_dw_pyramid
where date_of_record between '20010701' and '20020630'
and record_type_code IN ('FR','AL','PX','PA')
and associated_amount + associated_amount_match + associated_amount_claim < 25000;


/***FY01***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) as FY01 from a_dw_pyramid
where date_of_record between '20000701' and '20010630'
and record_type_code IN ('FR','AL','PX','PA')
and associated_amount + associated_amount_match + associated_amount_claim < 25000;


/***FY00***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) as FY00 from a_dw_pyramid
where date_of_record between '19990701' and '20000630'
and record_type_code IN ('FR','AL','PX','PA')
and associated_amount + associated_amount_match + associated_amount_claim < 25000;


/***FY99***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) as FY99 from a_dw_pyramid
where date_of_record between '19980701' and '19990630'
and record_type_code IN ('FR','AL','PX','PA')
and associated_amount + associated_amount_match + associated_amount_claim < 25000;


/***FY98***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) as FY98 from a_dw_pyramid
where date_of_record between '19970701' and '19980630'
and record_type_code IN ('FR','AL','PX','PA')
and associated_amount + associated_amount_match + associated_amount_claim < 25000;


/***FY97***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) as FY97 from a_dw_pyramid
where date_of_record between '19960701' and '19970630'
and record_type_code IN ('FR','AL','PX','PA')
and associated_amount + associated_amount_match + associated_amount_claim < 25000;


/***FY96***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) as FY96 from a_dw_pyramid
where date_of_record between '19950701' and '19960630'
and record_type_code IN ('FR','AL','PX','PA')
and associated_amount + associated_amount_match + associated_amount_claim < 25000;


/***FY95***/
select sum(associated_amount + associated_amount_match + associated_amount_claim) as FY02 from a_dw_pyramid
where date_of_record between '1994701' and '19950630'
and record_type_code IN ('FR','AL','PX','PA')
and associated_amount + associated_amount_match + associated_amount_claim < 25000;

