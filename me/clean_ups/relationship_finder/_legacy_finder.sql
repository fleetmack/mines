/*******************************************************************************************/
/*******************************************************************************************/
/*******************************************************************************************/
/*******************************************************************************************/
/*** Find potential relationships for manual review by student worker, research, or advancement services ***/
/*******************************************************************************************/
/*******************************************************************************************/
/*******************************************************************************************/
/*******************************************************************************************/
/*******************************************************************************************************************************/
/**************************************************************************************************** Has a missing parent ***/
select distinct(e.id_number||' '||e.pref_mail_name||' is probably the '||DECODE(e.gender_code,'M','son','daughter')||' of '||e2.id_number||' '||e2.pref_mail_name)
   from entity e,
           relationship  r,
          children      c,
          entity      e2
where e.id_number = r.id_number
   and r.relation_type_code IN ('0G','G0','G1','1G','2G','G2')
   and r.relation_id_number > '0000000000'
   and  r.relation_id_number = c.child_id_number
   and c.child_relation_code IN ('7E','8E','5E','6E','4E','0F','0M','0N')
   and c.id_number = e2.id_number
   and c.id_number NOT IN
        (select c2.id_number from children  c2 where c2.child_id_number = e.id_number);
/**************************************************************************************************** Mother-in-law whose Son/Daughter-in-law is ***/
select distinct(e3.id_number||' '||e3.pref_mail_name||' is probably the '||DECODE(e3.gender_code,'M','son','daughter')||'-in-law of '||e.id_number||' '||e.pref_mail_name)
from entity    e,
        children   c,
        entity    e2,
        entity    e3
where e.id_number = c.id_number
   and  c.child_id_number = e2.id_number
   and  e2.spouse_id_number = e3.id_number
   and e2.spouse_id_number > '0000000000'
   and c.child_relation_code IN ('4E','6E')
   and c.id_number NOT IN
        (select r.id_number from relationship r where r.relation_type_code IN ('G5','G6') and r.relation_id_number = e2.spouse_id_number);

/**************************************************************************************************** Father-in-law whose Son/Daughter-in-law is ***/
select distinct(e3.id_number||' '||e3.pref_mail_name||' is probably the '||DECODE(e3.gender_code,'M','son','daughter')||'-in-law of '||e.id_number||' '||e.pref_mail_name)
from entity    e,
        children   c,
        entity    e2,
        entity    e3
where e.id_number = c.id_number
   and  c.child_id_number = e2.id_number
   and  e2.spouse_id_number = e3.id_number
   and e2.spouse_id_number > '0000000000'
   and c.child_relation_code IN ('5E','7E')
   and c.id_number NOT IN
        (select r.id_number from relationship r where r.relation_type_code IN ('G7','G8') and r.relation_id_number = e2.spouse_id_number);
/*******************************************************************************************************************************/
/******************************************************************************* Find Children who may have a grandparent ***/
select distinct(e.id_number||' '||e.pref_mail_name||' may be a grand'||DECODE(e.gender_code,'M','son','daughter')||' of '|| c2.id_number||' '||e2.pref_mail_name)
  from entity  e, children c1, children c2,
         entity e2
where e.id_number = c1.child_id_number
   and e2.id_number = c2.id_number
   and  c1.id_number = c2.child_id_number
   and e.id_number NOT IN
    (select r.id_number from relationship r where r.relation_type_code in ('0L','2L','9K','L1'));
/*******************************************************************************************************************************/
/********************************************************************************** Find Children who may have a great grandparent ***/
select distinct(e.id_number||' '||e.pref_mail_name||' may be a Great Grand'||DECODE(e.gender_code,'M','son','daughter')||' of '|| r.relation_id_number||' '||e2.pref_mail_name)
from entity   e,
        children  c1,
        relationship  r,
        entity   e2
where e.id_number = c1.child_id_number
and    c1.id_number = r.id_number
and     r.relation_type_code IN ('0L','2L','9K','L1')
and     e2.id_number = r.relation_id_number
and     e.id_number NOT IN
    (select r2.id_number from relationship r2 where r2.relation_type_code in ('H2'));
/*******************************************************************************************************************************/
/*******************************************************************************************************************************/
/********************************* NOTE: THIS WILL NOT ACCOUNT FOR HALF BROTHERS/SISTERS!!! *****************************/
/*************************************** THERE IS NO WAY TO KNOW THAT DISTINCTION ****************************************/
/*******************************************************************************************************************************/
/************************************************************************ Brother whose Brother is ***/
select distinct(e.id_number||' '||e.pref_mail_name||' is probably brothers with '||e2.id_number||' '||e2.pref_mail_name)   relation --adjust me
  from entity e,
          children   c,
          children  c2,
          entity     e2
where e.id_number = c.child_id_number
and     c.id_number = c2.id_number
and     c2.child_id_number <> c.child_id_number
and     e2.id_number = c2.child_id_number
and     c.child_relation_code IN ('7E','6E')   --adjust me
and     c2.child_relation_code IN ('7E','6E') --adjust me
and     c.child_id_number  NOT   IN
    (select r.id_number from relationship r where r.relation_type_code IN ('0G','G0'))  --adjust me
and e.id_number <> e2.spouse_id_number;
/*******************************************************************************************************************************/
/***************************************************************************Brother whose Sister is ***/
select distinct(e.id_number||' '||e.pref_mail_name||' probably has a sister who is '||e2.id_number||' '||e2.pref_mail_name)   relation --adjust me
  from entity e,
          children   c,
          children  c2,
          entity     e2
where e.id_number = c.child_id_number
and     c.id_number = c2.id_number
and     c2.child_id_number <> c.child_id_number
and     e2.id_number = c2.child_id_number
and     c.child_relation_code IN ('7E','6E')   --adjust me
and     c2.child_relation_code IN ('4E','5E') --adjust me
and     c.child_id_number  NOT   IN
    (select r.id_number from relationship r where r.relation_type_code IN ('G1'))  --adjust me
and e.id_number <> e2.spouse_id_number
UNION
select distinct(e2.id_number||' '||e2.pref_mail_name||' probably has a sister who is '||e.id_number||' '||e.pref_mail_name)   relation --adjust me
  from entity e,
          children   c,
          children  c2,
          entity     e2
where e.id_number = c.child_id_number
and     c.id_number = c2.id_number
and     c2.child_id_number <> c.child_id_number
and     e2.id_number = c2.child_id_number
and     c.child_relation_code IN ('4E','5E')   --adjust me
and     c2.child_relation_code IN ('7E','6E') --adjust me
and     c.child_id_number  NOT   IN
    (select r.id_number from relationship r where r.relation_type_code IN ('1G'))  --adjust me
and e.id_number <> e2.spouse_id_number;
/*******************************************************************************************************************************/
/************************************************************************************ Sister whose Sister is ***/
select distinct(e.id_number||' '||e.pref_mail_name||' is probably sisters with '||e2.id_number||' '||e2.pref_mail_name)   relation --adjust me
  from entity e,
          children   c,
          children  c2,
          entity     e2
where e.id_number = c.child_id_number
and     c.id_number = c2.id_number
and     c2.child_id_number <> c.child_id_number
and     e2.id_number = c2.child_id_number
and     c.child_relation_code IN ('4E','5E')   --adjust me
and     c2.child_relation_code IN ('4E','5E') --adjust me
and     c.child_id_number  NOT   IN
    (select r.id_number from relationship r where r.relation_type_code IN ('2G','G2'))  --adjust me
and e.id_number <> e2.spouse_id_number;
/*******************************************************************************************************************************/
/************************************************************************************Brother-in-law whose Brother-in-law is ***/
select distinct(e.id_number||' '||e.pref_mail_name||' is probably brothers-in-law with '||e3.id_number||' '||e3.pref_mail_name)         relation
from entity    e,
        relationship   r,
        entity   e2,
        entity   e3
where e.id_number = r.id_number
and     r.relation_type_code = ('G1')
and     r.relation_id_number = e2.id_number
and     e2.spouse_id_number = e3.id_number
and     e.id_number NOT IN
        (select r2.id_number from relationship r2 where r2.relation_type_code IN ('H1','1H'));
/*******************************************************************************************************************************/
/*************************************** These are PROBABLY as the in-law is listed as daughter-in-law on parent page, but not a spouse ***/
select distinct(e.id_number||' '||e.pref_mail_name||' is probably brothers-in-law with '||e2.id_number||' '||e2.pref_mail_name) relation
from entity   e,
        children  c,
        children c2,
        entity  e2
where e.id_number = c.child_id_number
and    c.id_number = c2.id_number
and    c2.child_id_number <> c.child_id_number
and    c2.child_id_number = e2.id_number
and    c.child_relation_code IN ('7E','6E')
and    c2.child_relation_code IN ('G5','G7')
and    c.child_id_number NOT IN
    (select r.id_number from relationship r  where r.relation_id_number = c2.child_id_number);
/*******************************************************************************************************************************/
/************************************************************************************ Brother-in-law whose Sister-in-law is ***/
select distinct(e.id_number||' '||e.pref_mail_name||' probably has a sister-in-law who is '||e3.id_number||' '||e3.pref_mail_name)         relation
from entity    e,
        relationship   r,
        entity   e2,
        entity   e3
where e.id_number = r.id_number
and     r.relation_type_code IN ('0G','G0')
and     r.relation_id_number = e2.id_number
and     e2.spouse_id_number = e3.id_number
and     e.id_number NOT IN
        (select r2.id_number from relationship r2 where r2.relation_type_code IN ('0H'))
union
select distinct(e3.id_number||' '||e3.pref_mail_name||' probably has a sister-in-law who is '||e.id_number||' '||e.pref_mail_name)         relation
from entity    e,
        relationship   r,
        entity   e2,
        entity   e3
where e.id_number = r.id_number
and     r.relation_type_code IN ('2G','G2')
and     r.relation_id_number = e2.id_number
and     e2.spouse_id_number = e3.id_number
and     e.id_number NOT IN
        (select r2.id_number from relationship r2 where r2.relation_type_code IN ('H0'));
/*******************************************************************************************************************************/
/*** These are PROBABLY as the in-law is listed as daughter-in-law on parent page, but not a spouse ***/
select distinct(e.id_number||' '||e.pref_mail_name||' probably has a sister-in-law who is '||e2.id_number||' '||e2.pref_mail_name) relation
from entity   e,
        children  c,
        children c2,
        entity  e2
where e.id_number = c.child_id_number
and    c.id_number = c2.id_number
and    c2.child_id_number <> c.child_id_number
and    c2.child_id_number = e2.id_number
and    c.child_relation_code IN ('7E','6E')
and    c2.child_relation_code IN ('G6','G8')
and    c.child_id_number NOT IN
    (select r.id_number from relationship r  where r.relation_id_number = c2.child_id_number)
union
select distinct(e2.id_number||' '||e2.pref_mail_name||' probably has a sister-in-law who is '||e.id_number||' '||e.pref_mail_name) relation
from entity   e,
        children  c,
        children c2,
        entity  e2
where e.id_number = c.child_id_number
and    c.id_number = c2.id_number
and    c2.child_id_number <> c.child_id_number
and    c2.child_id_number = e2.id_number
and    c.child_relation_code IN ('5E','4E')
and    c2.child_relation_code IN ('G5','G7')
and    c.child_id_number NOT IN
    (select r.id_number from relationship r  where r.relation_id_number = c2.child_id_number);
/*******************************************************************************************************************************/
/************************************************************************************ Sister in-law whose Sister in-law is ***/
select distinct(e.id_number||' '||e.pref_mail_name||' is probably sisters-in-law with '||e3.id_number||' '||e3.pref_mail_name)  relation
from entity    e,
        relationship   r,
        entity   e2,
        entity   e3
where e.id_number = r.id_number
and     r.relation_type_code = ('1G')
and     r.relation_id_number = e2.id_number
and     e2.spouse_id_number = e3.id_number
and     e.id_number NOT IN
        (select r2.id_number from relationship r2 where r2.relation_type_code IN ('9G','G9'));
/*******************************************************************************************************************************/
/*** These are PROBABLY as the in-law is listed as daughter-in-law on parent page, but not a spouse ***/
select distinct(e.id_number||' '||e.pref_mail_name||' is probably sisters-in-law with '||e2.id_number||' '||e2.pref_mail_name) relation
from entity   e,
        children  c,
        children c2,
        entity  e2
where e.id_number = c.child_id_number
and    c.id_number = c2.id_number
and    c2.child_id_number <> c.child_id_number
and    c2.child_id_number = e2.id_number
and    c.child_relation_code IN ('4E','5E')
and    c2.child_relation_code IN ('G6','G8')
and    c.child_id_number NOT IN
    (select r.id_number from relationship r  where r.relation_id_number = c2.child_id_number);
/*******************************************************************************************************************************/
/************************************************************************************ Step-Brother whose Step-Brother is ***/
--find parents of children who have step children
select distinct(e.id_number||' '||e.pref_mail_name||' is probably step-brothers with '||e2.id_number||' '||e2.pref_mail_name)
from entity  e,
        children  c,
        children  c2,
        entity   e2
where e.id_number = c.child_id_number
and     c.id_number = c2.id_number
and     c.child_id_number <> c2.child_id_number
and     c2.child_id_number = e2.id_number
and     c.child_relation_code IN ('7E','6E')
and     c2.child_relation_code IN ('8E','0M')
and     e.id_number NOT IN
    (select r.id_number from relationship r where r.relation_id_number = c2.child_id_number)
union
--find siblings of individuals who also have step children
select distinct(e.id_number||' '||e.pref_mail_name||' is probably step-brothers with '||e2.id_number||' '||e2.pref_mail_name)
from   entity e,
          relationship  r,
          relationship  r2,
          entity  e2
where e.id_number = r.id_number
and    r.relation_type_code IN ('0G','G0','G1','1G','2G','G2')
and    r.relation_id_number = r2.id_number
and    r2.relation_type_code IN ('3G','G3','0E')
and   e.id_number NOT IN    
    (select r3.id_number from relationship   r3 where r3.relation_type_code IN ('3G','G3'))
union
--find men who have step-parents having children
select distinct (e2.id_number||' '||e2.pref_mail_name||' is probably step-brothers with '||e.id_number||' '||e.pref_mail_name)
from   entity  e,
          children  c,
          children  c2,
          entity      e2
where e.id_number = c.child_id_number
and     c.child_relation_code IN ('8E','0M')
and     c.id_number = c2.id_number
and     c.child_id_number <> c2.child_id_number
and     c2.child_id_number = e2.id_number
and     c2.child_id_number NOT IN
    (select r.id_number from relationship r where r.relation_type_code IN ('G3','3G'));
/*******************************************************************************************************************************/
/************************************************************************************ Step-Sister whose Step-Sister is ***/
select distinct(e.id_number||' '||e.pref_mail_name||' is probably step-sisters with '||e2.id_number||' '||e2.pref_mail_name)
from entity  e,
        children  c,
        children  c2,
        entity   e2
where e.id_number = c.child_id_number
and     c.id_number = c2.id_number
and     c.child_id_number <> c2.child_id_number
and     c2.child_id_number = e2.id_number
and     c.child_relation_code IN ('4E','5E')
and     c2.child_relation_code IN ('0F','0N')
and     e.id_number NOT IN
    (select r.id_number from relationship r where r.relation_id_number = c2.child_id_number)
union
select distinct(e.id_number||' '||e.pref_mail_name||' is probably step-sisters with '||e2.id_number||' '||e2.pref_mail_name)
from   entity e,
          relationship  r,
          relationship  r2,
          entity  e2
where e.id_number = r.id_number
and    r.relation_type_code IN ('0G','G0','G1','1G','2G','G2')
and    r.relation_id_number = r2.id_number
and    r2.relation_type_code IN ('0E','C0','0C')
and   e.id_number NOT IN    
    (select r3.id_number from relationship   r3 where r3.relation_type_code IN ('0E','C0','03'))
union
select distinct (e2.id_number||' '||e2.pref_mail_name||' is probably step-sisters with '||e.id_number||' '||e.pref_mail_name)
from   entity  e,
          children  c,
          children  c2,
          entity      e2
where e.id_number = c.child_id_number
and     c.child_relation_code IN ('0F','0N')
and     c.id_number = c2.id_number
and     c.child_id_number <> c2.child_id_number
and     c2.child_id_number = e2.id_number
and     c2.child_id_number NOT IN
    (select r.id_number from relationship r where r.relation_type_code IN ('C0','0C'));
/*******************************************************************************************************************************/
/**************************************************************** Find children who may have an Aunt/Uncle ***/
select  distinct(e2.id_number||' '||e2.pref_mail_name||' may be the Aunt of '||e.id_number||' '||e.pref_mail_name)
from entity      e,
        children  c,
        relationship r,
        entity        e2
where e.id_number = c.child_id_number
    and c.id_number = r.id_number
    and r.relation_type_code IN ('G1','0H','2G','G2','9G','G9','E0','C0','0C')
    and r.relation_id_number = e2.id_number
    and e.id_number NOT IN
        (select r2.id_number from relationship r2 where r2.relation_type_code IN ('5F','6F'))
union
select distinct(e3.id_number||' '||e3.pref_mail_name||' may be the '||DECODE(e3.gender_code,'M','Uncle','Aunt')||' of '||e.id_number||' '||e.pref_mail_name)
from entity   e,
        relationship   r,
        entity   e2,
        relationship  r2,
        entity   e3
where e.id_number = r.id_number
    and r.relation_id_number = e2.id_number
   and e2.id_number = r2.id_number
   and r2.relation_id_number = e3.id_number
   and e.id_number <> e3.id_number
    and r.relation_type_code IN ('0G','G0','G1','1G','2G','G2')
    and r2.relation_type_code IN ('6F','8F','5F','7F')
    and r.id_number NOT IN
     (select id_number from relationship where relation_type_code IN ('6F','8F','5F','7F'))
    and e.id_number <> e3.spouse_id_number
    and e2.id_number <> e3.spouse_id_number
    and e.id_number <> e2.spouse_id_number
union
select  distinct(e2.id_number||' '||e2.pref_mail_name||' may be the Uncle of '||e.id_number||' '||e.pref_mail_name)
from entity      e,
        children  c,
        relationship r,
        entity        e2
where e.id_number = c.child_id_number
    and c.id_number = r.id_number
    and r.relation_type_code IN ('0G','G0','H1','1H','1G','H0','3G','G3','0E')
    and r.relation_id_number = e2.id_number
    and e.id_number NOT IN
        (select r2.id_number from relationship r2 where r2.relation_type_code IN ('7F','8F'));
/*******************************************************************************************************************************/
/***************************************************************************************** Find children who may have a cousin ***/
select distinct(e.id_number||' '||e.pref_mail_name||' may be cousins with '||e2.id_number||' '||e2.pref_mail_name)
  from entity  e,
          relationship r,
          relationship r2,
          entity  e2
where e.id_number = r.id_number
and r.relation_type_code IN ('6F','8F','5F','7F')
and r.relation_id_number = r2.id_number
and r2.relation_type_code IN ('5E','7E','4E','6E')
and r2.relation_id_number = e2.id_number
and r.id_number NOT IN
    (select r3.relation_id_number from relationship r3 where r3.id_number = r2.relation_id_number)
union
select distinct(e2.id_number||' '||e2.pref_mail_name||' may be cousins with '||e.id_number||' '||e.pref_mail_name)
from entity   e,
        children   c,
        children   c2,
        relationship   r,
        entity     e2
where e.id_number = c.child_id_number
    and c.id_number = r.id_number
    and r.relation_id_number = c2.id_number
    and c2.child_id_number = e2.id_number
    and r.relation_type_code IN ('G1','0H','2G','G2','9G','G9','E0','C0','0C','0G','G0','H1','1H','1G','H0','3G','G3','0E')
    and e.id_number NOT IN
        (select r2.id_number from relationship r2 where relation_type_code IN ('9F','F9'));
/*******************************************************************************************************************************/
/***************************************************************************************  Find those with a great aunt or great uncle ***/
select distinct(e2.id_number||' '||e2.pref_mail_name||' may be the Great '||DECODE(e2.gender_code,'M','Uncle','Aunt')||' of '||e.id_number||' '||e.pref_mail_name)
from  entity   e,
         children  c,
         relationship  r,
         entity     e2
where e.id_number = c.child_id_number
    and c.child_relation_code NOT IN ('G8','G7','G6','G5','8E','0F','0N','0M')
    and c.id_number = r.id_number
    and r.relation_id_number = e2.id_number
   and r.relation_type_code IN  ('6F','8F','5F','7F')
   and e.id_number  IN
      (select r2.id_number from relationship r2 where r2.relation_type_code NOT IN ('H3','H4','8M'));
--nothing below here works yet
/********************************************************************************************************************/
/********************************************************************************************************************/
/********************************************************************************************************************/
/********************************************************************************************************************/
/********************************************************************************************************************/
/********************************************************************************************************************/
/********************************************************************************************************************/
/********************************************************************************************************************/
/********************************************************************************************************************/
/********************************************************************************************************************/
/********************************************************************************************************************/
/********************************************************************************************************************/