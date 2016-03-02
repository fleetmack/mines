drop table a_dw_pg;
commit;

create table a_dw_pg
(id_number varchar2(10),
pref_mail_name varchar2(30),
pref_name_sort varchar2(30),
pg_amt  number(12,2),
gift_type varchar2(41),
xcomment varchar2(255),
proposal_title varchar2(255));
commit;

insert into a_dw_pg
/*** IRA - coded on prospect end of things ***/
(select  p2.id_number, e.pref_mail_name, e.pref_name_sort, pg.pg_amt, 'Retirement Plan' gift_type, 
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
and to_char(p1.date_added,'YYYYMMDD') BETWEEN (select cfy_beg from a_dw_fiscal_dates) AND (select cfy_end from a_dw_fiscal_dates));
commit;

INSERT INTO a_dw_pg
/*** Realized Bequests  ***/
(select id_number, pref_mail_name, pref_name_sort, sum(associated_amount), 'Realized Bequest' gift_type, ' ' xcomment, ' ' proposal_title
from a_dw_pyramid
where transaction_type = 'BQ'
and year_of_giving = (select cfy_year from a_dw_fiscal_dates)
group by id_number, pref_mail_name, pref_name_sort);


INSERT INTO a_dw_pg
/***  Charitable Gift Annuity ***/
(select  id_number, pref_mail_name, pref_name_sort, sum(associated_amount), 'Charitable Gift Annuity' gift_type, ' ' xcomment, ' ' proposal_title
from a_dw_pyramid
where year_of_giving = (select cfy_year from a_dw_fiscal_dates)
and receipt in
    (select prim_gift_receipt_number
      from primary_gift
     where prim_gift_transaction_type = 'CA')
group by id_number, pref_mail_name, pref_name_sort);


INSERT INTO a_dw_pg
/*** CRUT - Charitable Remainder Unitrust - can add to this gift over time ***/
(select  id_number, pref_mail_name, pref_name_sort, sum(associated_amount), 'Charitable Remainder Unitrust - CRUT' gift_type, ' ' xcomment, ' ' proposal_title
from a_dw_pyramid
where year_of_giving = (select cfy_year from a_dw_fiscal_dates)
and receipt in
    (select prim_gift_receipt_number
      from primary_gift
     where prim_gift_transaction_type = 'CU')
group by id_number, pref_mail_name, pref_name_sort);

INSERT INTO a_dw_pg
/*** CRAT - Charitable Annuity Trust - cannot add to this gift over time, 1 time deal ***/
(select  id_number, pref_mail_name, pref_name_sort, sum(associated_amount), 'Charitable Remainder Annuity Trust - CRAT' gift_type, ' ' xcomment, ' ' proposal_title
from a_dw_pyramid
where year_of_giving = (select cfy_year from a_dw_fiscal_dates)
and receipt in
    (select prim_gift_receipt_number
      from primary_gift
     where prim_gift_transaction_type = 'CT')
group by id_number, pref_mail_name, pref_name_sort);

INSERT INTO a_dw_pg
/*** Bequest Expectancy - in wills, coded on prospect end of things ***/
(select p2.id_number, e.pref_mail_name, e.pref_name_sort, pg.pg_amt, 'Bequest Expectency' gift_type, pg.xcomment,  proposal_title
--, p1.date_added
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
and to_char(p1.date_added,'YYYYMMDD') BETWEEN (select cfy_beg from a_dw_fiscal_dates) AND (select cfy_end from a_dw_fiscal_dates));

INSERT INTO a_dw_pg
/*** Life Insurance - coded on prospect end of things ***/
(select p2.id_number, e.pref_mail_name, e.pref_name_sort, pg.pg_amt, 'Life Insurance' gift_type,
        pg.xcomment,  proposal_title
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
and to_char(p1.date_added,'YYYYMMDD') BETWEEN (select cfy_beg from a_dw_fiscal_dates) AND (select cfy_end from a_dw_fiscal_dates));
COMMIT;

INSERT INTO a_dw_pg
/*** Life Estate - coded on prospect end of things ***/
(select p2.id_number, e.pref_mail_name, e.pref_name_sort, pg.pg_amt, 'Life Estate' gift_type,
        pg.xcomment,  proposal_title
from proposal  p1,
        prospect_entity   p2,
        planned_gift   pg,
        entity e
where p1.prospect_id = p2.prospect_id
and pg.proposal_id = p1.proposal_id
and p2.id_number = e.id_number
and p1.proposal_type = 'BT'
and p1.active_ind = 'Y'
and pg.sub_type = 'LE'
and to_char(p1.date_added,'YYYYMMDD') BETWEEN (select cfy_beg from a_dw_fiscal_dates) AND (select cfy_end from a_dw_fiscal_dates));
COMMIT;

INSERT INTO a_dw_pg
/*** Life Income - coded on prospect end of things ***/
/*** Note:  This may also be how we have old "pooled income fund" gifts coded ***/
(select p2.id_number, e.pref_mail_name, e.pref_name_sort, pg.pg_amt, 'Life Income' gift_type,
        pg.xcomment,  proposal_title
from proposal  p1,
        prospect_entity   p2,
        planned_gift   pg,
        entity e
where p1.prospect_id = p2.prospect_id
and pg.proposal_id = p1.proposal_id
and p2.id_number = e.id_number
and p1.proposal_type = 'BT'
and p1.active_ind = 'Y'
and pg.sub_type = 'LI'
and to_char(p1.date_added,'YYYYMMDD') BETWEEN (select cfy_beg from a_dw_fiscal_dates) AND (select cfy_end from a_dw_fiscal_dates));
COMMIT;

