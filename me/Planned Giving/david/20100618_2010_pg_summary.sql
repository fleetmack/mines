/*** Realized Bequests 2010 ***/
select id_number, pref_mail_name, pref_name_sort, sum(associated_amount)
from a_dw_pyramid
where transaction_type = 'BQ'
and year_of_giving = '2010'
group by id_number, pref_mail_name, pref_name_sort
order by pref_name_sort;

/***  Charitable Gift Annuity ***/
/*** EX:  Lonnie Abernethy #38562 ***/
select  id_number, pref_mail_name, pref_name_sort, sum(associated_amount)
from a_dw_pyramid
where year_of_giving = '2010'
and receipt in
    (select prim_gift_receipt_number
      from primary_gift
     where prim_gift_transaction_type = 'CA')
group by id_number, pref_mail_name, pref_name_sort
order by pref_name_sort;

/*** CRUT - Charitable Remainder Unitrust - can add to this gift over time ***/
/*** EX:     ***/
select  id_number, pref_mail_name, pref_name_sort, sum(associated_amount)
from a_dw_pyramid
where year_of_giving = '2010'
and receipt in
    (select prim_gift_receipt_number
      from primary_gift
     where prim_gift_transaction_type = 'CU')
group by id_number, pref_mail_name, pref_name_sort
order by pref_name_sort;

/*** CRAT - Charitable Annuity Trust - cannot add to this gift over time, 1 time deal ***/
/*** EX:    ***/
select  id_number, pref_mail_name, pref_name_sort, sum(associated_amount)
from a_dw_pyramid
where year_of_giving = '2010'
and receipt in
    (select prim_gift_receipt_number
      from primary_gift
     where prim_gift_transaction_type = 'CT')
group by id_number, pref_mail_name, pref_name_sort
order by pref_name_sort;

/*** Bequest Expectancy - in wills, coded on prospect end of things ***/
/*** EX: James Hobbs #4958 ***/
select *
--p2.id_number, e.pref_mail_name, e.pref_name_sort, pg.pg_amt,
        --pg.xcomment, p1.date_added
from proposal  p1,
        prospect_entity   p2,
        planned_gift   pg,
        entity e
where p1.prospect_id = p2.prospect_id
and pg.proposal_id = p1.proposal_id
and p2.id_number = e.id_number
and p1.proposal_type = 'BT'
and p1.active_ind = 'Y'
and pg.sub_type = 'WR'
and to_char(p1.date_added,'YYYYMMDD') BETWEEN '20090701' AND '20100630'
order by p1.date_added;



/*** Life Insurance - coded on prospect end of things ***/
/*** EX:   J. Steven Whisler #13270 ***/
select p2.id_number, e.pref_mail_name, e.pref_name_sort, pg.pg_amt,
        pg.xcomment
from proposal  p1,
        prospect_entity   p2,
        planned_gift   pg,
        entity e
where p1.prospect_id = p2.prospect_id
and pg.proposal_id = p1.proposal_id
and p2.id_number = e.id_number
and p1.proposal_type = 'BT'
and p1.active_ind = 'Y'
and pg.sub_type = 'IP'
and to_char(p1.date_added,'YYYYMMDD') BETWEEN '20090701' AND '20100630';


/*** IRA - coded on prospect end of things ***/
/*** EX:  Dean Stoughton # 9207 ***/
select  p2.id_number, e.pref_mail_name, e.pref_name_sort, pg.pg_amt,
    pg.xcomment, p1.proposal_title
from proposal  p1,
        prospect_entity   p2,
        planned_gift   pg,
        entity e
where p1.prospect_id = p2.prospect_id
and pg.proposal_id = p1.proposal_id
and p2.id_number = e.id_number
and p1.proposal_type = 'BT'
and p1.active_ind = 'Y'
and pg.sub_type = 'RA'
and to_char(p1.date_added,'YYYYMMDD') BETWEEN '20090701' AND '20100630';