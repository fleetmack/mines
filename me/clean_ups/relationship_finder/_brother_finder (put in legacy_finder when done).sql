/**** Mother-in-law whose Son/Daughter-in-law is ***/
select distinct(e3.id_number||' '||e3.pref_mail_name||' is the '||DECODE(e3.gender_code,'M','son','daughter')||'-in-law of '||e.id_number||' '||e.pref_mail_name)
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

/**** Father-in-law whose Son/Daughter-in-law is ***/
select distinct(e3.id_number||' '||e3.pref_mail_name||' is the '||DECODE(e3.gender_code,'M','son','daughter')||'-in-law of '||e.id_number||' '||e.pref_mail_name)
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


/*** Stuff You'll Need -- Brother/Sister
0G	Brother whose Brother is
G0	Brother whose Brother is
G1	Brother whose Sister is
H1	Brother-in-law whose Brother-in-law is
1H	Brother-in-law whose Brother-in-law is
0H	Brother-in-law whose Sister-in-law is
3G	Stepbrother whose Stepbrother is
G3	Stepbrother whose Stepbrother is
E0	Stepbrother whose stepsister is
1G	Sister whose Brother is
2G	Sister whose Sister is
G2	Sister whose Sister is
H0	Sister-in-law whose Brother-in-law is
9G	Sister-in-law whose Sister-in-law is
G9	Sister-in-law whose Sister-in-law is
0E	Stepsister whose stepbrother is
C0	Stepsister whose stepsister is
0C	Stepsister whose stepsister is

/*** Stuff You'll Need -- Son/Daughter 
E7	Son whose Father is
E6	Son whose Mother is
7G	Son-in-law whose Father-in-law is
5G	Son-in-law whose Mother-in-law is
E8	Stepson whose Stepfather is
M0	Stepson whose Stepmother is
E5	Daughter whose Father is
E4	Daughter whose Mother is
8G	Daughter-in-law whose Father-in-law is
6G	Daughter-in-law whose Mother-in-law is
N0	Stepdaughter whose Stepmother is
F0	Stepdaughter whose stepfather is

/*** Stuff You'll Need -- Mother/Father 
5E	Father whose Daughter is
7E	Father whose Son is
G8	Father-in-law whose Daughter-in-law is
G7	Father-in-law whose Son-in-law is
8E	Stepfather whose Stepson is
0F	Stepfather whose stepdaughter is
4E	Mother whose Daughter is
6E	Mother whose Son is
G6	Mother-in-law whose Daughter-in-law is
G5	Mother-in-law whose Son-in-law is
0N	Stepmother whose Stepdaughter is
0M	Stepmother whose stepson is


/*** Next code who is all step-mothers, stepson, etc.



select *
from tms_relationships
 order by short_desc
 ***/