/*** Athletic Appeal by Sport ***/
/*** Yes, this double-counts those who played multiple sports ***/
select nvl(t.short_desc,'Donor Played No Sport'), '$'||sum(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint) "Total"
from a_dw_pyramid       dw,
        sport                       s,
        tms_sport               t
where s.id_number(+)      = dw.id_number
and t.sport_code(+) = s.sport_code
and dw.appeal_code = 'AT09'
group by t.short_desc
order by t.short_desc;


/*** Total Sum Without double-counting ****/
select sum(associated_amount + associated_amount_match + associated_amount_claim + associated_amount_joint)
from a_dw_pyramid
where appeal_code = 'AT09';