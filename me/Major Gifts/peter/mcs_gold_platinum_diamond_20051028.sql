/*** MSC Members for Gold, Platinum, and Diamond ***/
select decode(cs_gold,'1','Gold'),
       decode(cs_diamond,'1','Diamond'),
       decode(cs_platinum,'1','Platinum')
from a_dw_gift_clubs    g,
     a_dw_address_good  a
where a.id_number = g.id_number
and (cs_gold = '1'
or    cs_platinum = '1'
or    cs_diamond = '1')