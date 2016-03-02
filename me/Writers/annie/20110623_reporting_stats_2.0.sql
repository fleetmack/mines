/*** 1) All commitments to us the past 10 years ***/
/*** DONE! ***/
drop table a_temp_annie_commitments;
commit;

create table a_temp_annie_commitments
as
(select py.id_number, py.record_type_code, py.transaction_type,  py.pref_mail_name, py.pref_name_sort, 
DECODE(py.transaction_type, 'MG','MG','MC','MG',py.person_or_org) as person_or_org, 
decode(substr(commitment_date,5,2),'07',substr(commitment_date,1,4)+1,
                                                                '08',substr(commitment_date,1,4)+1,
                                                                '09',substr(commitment_date,1,4)+1,
                                                                '10',substr(commitment_date,1,4)+1,
                                                                '11',substr(commitment_date,1,4)+1,
                                                                '12',substr(commitment_date,1,4)+1,
                                                                        substr(commitment_date,1,4)) commitment_fiscal_year,
py.commitment_date,  py.commitment_amount_summ, py.cfae_purp_desc,
DECODE((substr(commitment_date,5,2)),'07','1',
                                                               '08','1',
                                                               '09','1',
                                                            '10','2',
                                                            '11','2',
                                                            '12','2',
                                                            '01','3',
                                                            '02','3',
                                                            '03','3',
                                                            '04','4',
                                                            '05','4',
                                                            '06','4') quarter,
to_char(to_date(commitment_date,'YYYYMMDD'),'Month') month, 
receipt
from a_dw_pyramid py
where py.commitment_date >= '20010701'
and py.flag_alumni <> '1'
and py.flag_non_monthend <> '1');
commit;

--fixes so person or org says P when a company has given "on behalf" of an individual
update a_temp_annie_commitments t
   set t.person_or_org = 'P'
 where t.person_or_org <> 'P'
 and t.receipt IN
    (select gc.receipt_number
       from gift_codes  gc
      where gc.gift_code = 'CI');
      
--this will probably never happen, would be if a person paid off a corporate pledge
update a_temp_annie_commitments t
   set t.person_or_org = 'O'
 where t.person_or_org <> 'O'
 and t.receipt IN
    (select gc.receipt_number
       from gift_codes  gc
      where gc.gift_code = 'CC');    

--select * from a_temp_annie_commitments   

/*** 2) All cash received by the foundation (outright and PP) split into cfae codes - last 10 years ***/
/*** DONE! ***/
/*** First Way ***/
select py.year_of_giving, py.cfae_purp_desc, tms.short_desc, sum(py.associated_amount)
from a_dw_pyramid py,  
        tms_transaction_type  tms
where tms.transaction_type_code = py.transaction_type
and py.year_of_giving >= '2002'
and py.flag_alumni <> '1'
and py.flag_non_monthend <> '1'
and py.associated_code <> 'B'
and py.transaction_type NOT IN ('MC','P')
group by py.year_of_giving, py.cfae_purp_desc, tms.short_desc
order by py.year_of_giving, py.cfae_purp_desc;
/*** Second Way -- gives NPV instead of the latter on deferred gifts ***/
select py.year_of_giving, py.cfae_purp_desc, tms.short_desc, 
sum(DECODE(net_present_value,0.00,py.associated_amount+py.associated_amount_joint,net_present_value)) amount
from a_dw_pyramid py,  
        tms_transaction_type  tms
where tms.transaction_type_code = py.transaction_type
and py.year_of_giving >= '2002'
and py.flag_alumni <> '1'
and py.flag_non_monthend <> '1'
and py.associated_code <> 'B'
and py.associated_code = 'P'
and py.transaction_type NOT IN ('MC','P')
group by py.year_of_giving, py.cfae_purp_desc, tms.short_desc
order by py.year_of_giving, py.cfae_purp_desc;

/*** 3) PC Commitments (count and $) over last 10 FY ***/
/*** DONE!!! ***/
select '2002 PC Members: '||(select count(id_number) from a_dw_gift_clubs where pc02 = 1)||' @ '||
    (select ltrim(to_char(sum(associated_amount+associated_amount_match+associated_amount_claim),'$999,999,999,999'),' ')
       from a_dw_pyramid 
     where date_of_record BETWEEN '20010701' and '20020630' 
        and flag_alumni = 0
        and flag_non_monthend = 0
        and id_number IN
        (select id_number from a_dw_gift_clubs where pc02 =1)) pc02
from dual;
select '2003 PC Members: '||(select count(id_number) from a_dw_gift_clubs where pc03 = 1)||' @ '||
    (select ltrim(to_char(sum(associated_amount+associated_amount_match+associated_amount_claim),'$999,999,999,999'),' ')
       from a_dw_pyramid 
     where date_of_record BETWEEN '20020701' and '20030630' 
        and flag_alumni = 0
        and flag_non_monthend = 0
        and id_number IN
        (select id_number from a_dw_gift_clubs where pc03 =1)) pc03
from dual;
select '2004 PC Members: '||(select count(id_number) from a_dw_gift_clubs where pc04 = 1)||' @ '||
    (select ltrim(to_char(sum(associated_amount+associated_amount_match+associated_amount_claim),'$999,999,999,999'),' ')
       from a_dw_pyramid 
     where date_of_record BETWEEN '20030701' and '20040630' 
        and flag_alumni = 0
        and flag_non_monthend = 0
        and id_number IN
        (select id_number from a_dw_gift_clubs where pc04 =1)) pc04
from dual;
select '2005 PC Members: '||(select count(id_number) from a_dw_gift_clubs where pc05 = 1)||' @ '||
    (select ltrim(to_char(sum(associated_amount+associated_amount_match+associated_amount_claim),'$999,999,999,999'),' ')
       from a_dw_pyramid 
     where date_of_record BETWEEN '20040701' and '20050630' 
        and flag_alumni = 0
        and flag_non_monthend = 0
        and id_number IN
        (select id_number from a_dw_gift_clubs where pc05 =1)) pc05
from dual;
select '2006 PC Members: '||(select count(id_number) from a_dw_gift_clubs where pc06 = 1)||' @ '||
    (select ltrim(to_char(sum(associated_amount+associated_amount_match+associated_amount_claim),'$999,999,999,999'),' ')
       from a_dw_pyramid 
     where date_of_record BETWEEN '20050701' and '20060630' 
        and flag_alumni = 0
        and flag_non_monthend = 0
        and id_number IN
        (select id_number from a_dw_gift_clubs where pc06 =1)) pc06
from dual;
select '2007 PC Members: '||(select count(id_number) from a_dw_gift_clubs where pc07 = 1)||' @ '||
    (select ltrim(to_char(sum(associated_amount+associated_amount_match+associated_amount_claim),'$999,999,999,999'),' ')
       from a_dw_pyramid 
     where date_of_record BETWEEN '20060701' and '20070630' 
        and flag_alumni = 0
        and flag_non_monthend = 0
        and id_number IN
        (select id_number from a_dw_gift_clubs where pc07 =1)) pc07
from dual;
select '2008 PC Members: '||(select count(id_number) from a_dw_gift_clubs where pc08 = 1)||' @ '||
    (select ltrim(to_char(sum(associated_amount+associated_amount_match+associated_amount_claim),'$999,999,999,999'),' ')
       from a_dw_pyramid 
     where date_of_record BETWEEN '20070701' and '20080630' 
        and flag_alumni = 0
        and flag_non_monthend = 0
        and id_number IN
        (select id_number from a_dw_gift_clubs where pc08 =1)) pc08
from dual;
select '2009 PC Members: '||(select count(id_number) from a_dw_gift_clubs where pc09 = 1)||' @ '||
    (select ltrim(to_char(sum(associated_amount+associated_amount_match+associated_amount_claim),'$999,999,999,999'),' ')
       from a_dw_pyramid 
     where date_of_record BETWEEN '20080701' and '20090630' 
        and flag_alumni = 0
        and flag_non_monthend = 0
        and id_number IN
        (select id_number from a_dw_gift_clubs where pc09 =1)) pc09
from dual;
select '2010 PC Members: '||(select count(id_number) from a_dw_gift_clubs where pc10 = 1)||' @ '||
    (select ltrim(to_char(sum(associated_amount+associated_amount_match+associated_amount_claim),'$999,999,999,999'),' ')
       from a_dw_pyramid 
     where date_of_record BETWEEN '20090701' and '20100630' 
        and flag_alumni = 0
        and flag_non_monthend = 0
        and id_number IN
        (select id_number from a_dw_gift_clubs where pc10 =1)) pc10
from dual;
select '2011 PC Members: '||(select count(id_number) from a_dw_gift_clubs where pc11 = 1)||' @ '||
    (select ltrim(to_char(sum(associated_amount+associated_amount_match+associated_amount_claim),'$999,999,999,999'),' ')
       from a_dw_pyramid 
     where date_of_record BETWEEN '20100701' and '20110630' 
        and flag_alumni = 0
        and flag_non_monthend = 0
        and id_number IN
        (select id_number from a_dw_gift_clubs where pc11 =1)) pc11
from dual;
select '2012 PC Members: '||(select count(id_number) from a_dw_gift_clubs where pc12 = 1)||' @ '||
    (select ltrim(to_char(sum(associated_amount+associated_amount_match+associated_amount_claim),'$999,999,999,999'),' ')
       from a_dw_pyramid 
     where date_of_record BETWEEN '20110701' and '20120630' 
        and flag_alumni = 0
        and flag_non_monthend = 0
        and id_number IN
        (select id_number from a_dw_gift_clubs where pc12 =1)) pc12
from dual;

/*** 4) Total commitments and cash by BOT and participation rate FY 2010, 2011, 2012 without behalf ****/
/******************** 2012 ***********************************/
/*** Total commitments and cash by BOT and participation rate FY 2012 without behalf ****/
select 'Without Behalf Gifts ', round((
 (  select
            count(distinct(id_number)) from a_dw_pyramid
            where year_of_giving = '2012'
                and flag_alumni = 0
                and flag_non_monthend = 0
                and associated_code <> 'B'
                and id_number IN 
                    (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))
                    ) /
                    (select count(id_number) from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))
                    )
                    *100,0)||'%'
                     percent_12_bot_participation,
(select sum(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint)
    from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
     and associated_code <> 'B'
     and year_of_giving = '2012'
     and id_number IN
    (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))) total_cash_bot_2012,
(select sum(total_jnt_commitment)
   from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
    and associated_code <> 'B'
     and year_of_giving = '2012'
     and id_number IN
     (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))) total_commit_bot_2012
from dual;
select 'With Behalf Gifts ', round((
 (  select
            count(distinct(id_number)) from a_dw_pyramid
            where year_of_giving = '2012'
                and flag_alumni = 0
                and flag_non_monthend = 0
                and id_number IN 
                    (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))
                    ) /
                    (select count(id_number) from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))
                    )
                    *100,0)||'%'
                     percent_12_bot_participation,
(select sum(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint)
    from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
     and year_of_giving = '2012'
     and id_number IN
    (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))) total_cash_bot_2012,
(select sum(total_jnt_commitment)
   from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
     and year_of_giving = '2012'
     and id_number IN
     (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))) total_commit_bot_2012
from dual;






/******************** 2011 ***********************************/
/*** Total commitments and cash by BOT and participation rate FY 2011 without behalf ****/
select 'Without Behalf Gifts ', round((
 (  select
            count(distinct(id_number)) from a_dw_pyramid
            where year_of_giving = '2011'
                and flag_alumni = 0
                and flag_non_monthend = 0
                and associated_code <> 'B'
                and id_number IN 
                    (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))
                    ) /
                    (select count(id_number) from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))
                    )
                    *100,0)||'%'
                     percent_11_bot_participation,
(select sum(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint)
    from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
     and associated_code <> 'B'
     and year_of_giving = '2011'
     and id_number IN
    (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))) total_cash_bot_2011,
(select sum(total_jnt_commitment)
   from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
    and associated_code <> 'B'
     and year_of_giving = '2011'
     and id_number IN
     (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))) total_commit_bot_2011
from dual;
/*** Total commitments and cash by BOT and participation rate FY 2011 with behalf ****/
select 'With Behalf Gifts ', round((
 (  select
            count(distinct(id_number)) from a_dw_pyramid
            where year_of_giving = '2011'
                and flag_alumni = 0
                and flag_non_monthend = 0
                and id_number IN 
                    (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))
                    ) /
                    (select count(id_number) from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))
                    )
                    *100,0)||'%'
                     percent_11_bot_participation,
(select sum(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint)
    from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
     and year_of_giving = '2011'
     and id_number IN
    (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))) total_cash_bot_2011,
(select sum(total_jnt_commitment)
   from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
     and year_of_giving = '2011'
     and id_number IN
     (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))) total_commit_bot_2011
from dual;

/******************** 2010 ***********************************/
/*** Total commitments and cash by BOT and participation rate FY 2010 without behalf ****/
/*** DONE! ***/
select 'Without Behalf Gifts ', round((
 (  select
            count(distinct(id_number)) from a_dw_pyramid
            where year_of_giving = '2010'
                and flag_alumni = 0
                and flag_non_monthend = 0
                and associated_code <> 'B'
                and id_number IN 
                    (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))
                    ) /
                    (select count(id_number) from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))
                    )
                    *100,0)||'%'
                     percent_10_bot_participation,
(select sum(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint)
    from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
     and associated_code <> 'B'
     and year_of_giving = '2010'
     and id_number IN
    (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))) total_cash_bot_2010,
(select sum(total_jnt_commitment)
   from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
    and associated_code <> 'B'
     and year_of_giving = '2010'
     and id_number IN
     (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))) total_commit_bot_2010
from dual;
/*** Total commitments and cash by BOT and participation rate FY 2010 with behalf ****/
select 'With Behalf Gifts ', round((
 (  select
            count(distinct(id_number)) from a_dw_pyramid
            where year_of_giving = '2010'
                and flag_alumni = 0
                and flag_non_monthend = 0
                and id_number IN 
                    (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))
                    ) /
                    (select count(id_number) from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))
                    )
                    *100,0)||'%'
                     percent_10_bot_participation,
(select sum(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint)
    from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
     and year_of_giving = '2010'
     and id_number IN
    (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))) total_cash_bot_2010,
(select sum(total_jnt_commitment)
   from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
     and year_of_giving = '2010'
     and id_number IN
     (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' AND committee_role_code NOT IN ('SR','FT'))) total_commit_bot_2010
from dual;


/*** 5) Total commitments and cash by CSM BOG and participation rate FY 2011***/
/*** 2012 ***/
select round((
(  select
            count(distinct(id_number)) from a_dw_pyramid
            where year_of_giving = '2012'
                and flag_alumni = 0
                and flag_non_monthend = 0
             --   and associated_code <> 'B'
                and id_number IN 
                    (select id_number from committee where committee_code = 'FBOG' and committee_status_code = 'A' and committee_role_code <> 'H' )
                    ) /
                    (select count(id_number) from committee where committee_code = 'FBOG' and committee_status_code = 'A' and committee_role_code <> 'H')
                    )*100,0)||'%' percent_12_bog_participation,
(select ltrim(to_char(sum(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint),'$999,999,999,999'),' ')
    from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
    -- and associated_code <> 'B'
     and year_of_giving = '2011'
     and id_number IN
    (select id_number from committee where committee_code = 'FBOG' and committee_status_code = 'A' and committee_role_code <> 'H')) total_cash_bog_2012,
(select ltrim(to_char(sum(total_jnt_commitment),'$999,999,999,999'),' ')
   from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
    -- and associated_code <> 'B'
     and year_of_giving = '2012'
     and id_number IN
     (select id_number from committee where committee_code = 'FBOG' and committee_status_code = 'A' and committee_role_code <> 'H')) total_commit_bog_2012
from dual;


/*** 2011 ***/
select round((
(  select
            count(distinct(id_number)) from a_dw_pyramid
            where year_of_giving = '2011'
                and flag_alumni = 0
                and flag_non_monthend = 0
             --   and associated_code <> 'B'
                and id_number IN 
                    (select id_number from committee where committee_code = 'FBOG' and committee_status_code = 'A' and committee_role_code <> 'H' )
                    ) /
                    (select count(id_number) from committee where committee_code = 'FBOG' and committee_status_code = 'A' and committee_role_code <> 'H')
                    )*100,0)||'%' percent_11_bog_participation,
(select ltrim(to_char(sum(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint),'$999,999,999,999'),' ')
    from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
    -- and associated_code <> 'B'
     and year_of_giving = '2011'
     and id_number IN
    (select id_number from committee where committee_code = 'FBOG' and committee_status_code = 'A' and committee_role_code <> 'H')) total_cash_bog_2011,
(select ltrim(to_char(sum(total_jnt_commitment),'$999,999,999,999'),' ')
   from a_dw_pyramid
  where flag_alumni = 0
     and flag_non_monthend = 0
    -- and associated_code <> 'B'
     and year_of_giving = '2011'
     and id_number IN
     (select id_number from committee where committee_code = 'FBOG' and committee_status_code = 'A' and committee_role_code <> 'H')) total_commit_bog_2011
from dual;

/*** Details of BOG gifts ***/
/*** 2012 ***/
select py.id_number, py.transaction_type,  py.pref_mail_name, py.pref_name_sort, py.person_or_org, py.year_of_giving, py.commitment_date, py.cfae_purp_desc,
DECODE((substr(commitment_date,5,2)),'07','1',
                                                               '08','1',
                                                               '09','1',
                                                            '10','2',
                                                            '11','2',
                                                            '12','2',
                                                            '01','3',
                                                            '02','3',
                                                            '03','3',
                                                            '04','4',
                                                            '05','4',
                                                            '06','4') quarter,
DECODE((substr(commitment_date,5,2)),'01','January',
'02','February',
'03','March',
'04','April',
'05','May',
'06','June',
'07','July',
'08','August',
'09','September',
'10','October',
'11','November',
'12','December') month,
ltrim(to_char((associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint),'$999,999,999,999'),' ') cash,
ltrim(to_char((total_jnt_commitment),'$999,999,999,999'),' ') commit
from a_dw_pyramid py
where py.year_of_giving >= '2012'
and py.flag_alumni = 0
and py.flag_non_monthend = 0
and py.id_number IN
     (select id_number from committee where committee_code = 'FBOG' and committee_status_code = 'A' and committee_role_code <> 'H')
order by pref_name_sort;

/*** 2011 ***/
select py.id_number, py.transaction_type,  py.pref_mail_name, py.pref_name_sort, py.person_or_org, py.year_of_giving, py.commitment_date, py.cfae_purp_desc,
DECODE((substr(commitment_date,5,2)),'07','1',
                                                               '08','1',
                                                               '09','1',
                                                            '10','2',
                                                            '11','2',
                                                            '12','2',
                                                            '01','3',
                                                            '02','3',
                                                            '03','3',
                                                            '04','4',
                                                            '05','4',
                                                            '06','4') quarter,
DECODE((substr(commitment_date,5,2)),'01','January',
'02','February',
'03','March',
'04','April',
'05','May',
'06','June',
'07','July',
'08','August',
'09','September',
'10','October',
'11','November',
'12','December') month,
ltrim(to_char((associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint),'$999,999,999,999'),' ') cash,
ltrim(to_char((total_jnt_commitment),'$999,999,999,999'),' ') commit
from a_dw_pyramid py
where py.year_of_giving >= '2011'
and py.flag_alumni = 0
and py.flag_non_monthend = 0
and py.id_number IN
     (select id_number from committee where committee_code = 'FBOG' and committee_status_code = 'A' and committee_role_code <> 'H')
order by pref_name_sort;









/*** Details of BOT gifts ***/
/*** 2012 ***/
select py.id_number, py.transaction_type,  py.pref_mail_name, py.pref_name_sort, py.person_or_org, py.year_of_giving, py.commitment_date, py.cfae_purp_desc, py.associated_code,
DECODE((substr(commitment_date,5,2)),'07','1',
                                                               '08','1',
                                                               '09','1',
                                                            '10','2',
                                                            '11','2',
                                                            '12','2',
                                                            '01','3',
                                                            '02','3',
                                                            '03','3',
                                                            '04','4',
                                                            '05','4',
                                                            '06','4') quarter,
DECODE((substr(commitment_date,5,2)),'01','January',
'02','February',
'03','March',
'04','April',
'05','May',
'06','June',
'07','July',
'08','August',
'09','September',
'10','October',
'11','November',
'12','December') month,
ltrim(to_char((associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint),'$999,999,999,999'),' ') cash,
ltrim(to_char((total_jnt_commitment),'$999,999,999,999'),' ') commit
from a_dw_pyramid py
where py.year_of_giving >= '2012'
and py.flag_alumni = 0
and py.flag_non_monthend = 0
and py.id_number IN
     (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' and committee_role_code <> 'H')
order by pref_name_sort;

/*** 2011 ***/
select py.id_number, py.transaction_type,  py.pref_mail_name, py.pref_name_sort, py.person_or_org, py.year_of_giving, py.commitment_date, py.cfae_purp_desc, py.associated_code,
DECODE((substr(commitment_date,5,2)),'07','1',
                                                               '08','1',
                                                               '09','1',
                                                            '10','2',
                                                            '11','2',
                                                            '12','2',
                                                            '01','3',
                                                            '02','3',
                                                            '03','3',
                                                            '04','4',
                                                            '05','4',
                                                            '06','4') quarter,
DECODE((substr(commitment_date,5,2)),'01','January',
'02','February',
'03','March',
'04','April',
'05','May',
'06','June',
'07','July',
'08','August',
'09','September',
'10','October',
'11','November',
'12','December') month,
ltrim(to_char((associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint),'$999,999,999,999'),' ') cash,
ltrim(to_char((total_jnt_commitment),'$999,999,999,999'),' ') commit
from a_dw_pyramid py
where py.year_of_giving >= '2011'
and py.flag_alumni = 0
and py.flag_non_monthend = 0
and py.id_number IN
     (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' and committee_role_code <> 'H')
order by pref_name_sort;



/*** 2010 ***/
select py.id_number, py.transaction_type,  py.pref_mail_name, py.pref_name_sort, py.person_or_org, py.year_of_giving, py.commitment_date, py.cfae_purp_desc, py.associated_code,
DECODE((substr(commitment_date,5,2)),'07','1',
                                                               '08','1',
                                                               '09','1',
                                                            '10','2',
                                                            '11','2',
                                                            '12','2',
                                                            '01','3',
                                                            '02','3',
                                                            '03','3',
                                                            '04','4',
                                                            '05','4',
                                                            '06','4') quarter,
DECODE((substr(commitment_date,5,2)),'01','January',
'02','February',
'03','March',
'04','April',
'05','May',
'06','June',
'07','July',
'08','August',
'09','September',
'10','October',
'11','November',
'12','December') month,
ltrim(to_char((associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint),'$999,999,999,999'),' ') cash,
ltrim(to_char((total_jnt_commitment),'$999,999,999,999'),' ') commit
from a_dw_pyramid py
where py.year_of_giving >= '2010'
and py.flag_alumni = 0
and py.flag_non_monthend = 0
and py.id_number IN
     (select id_number from committee where committee_code = 'BOT' and committee_status_code = 'A' and committee_role_code <> 'H')
order by pref_name_sort;