select p.id_number, p.pref_mail_name, p.alloc, a.long_name, a.cfae_purpose_code, sum(p.associated_amount + p.associated_amount_match + p.associated_amount_claim)
from allocation        a,
              a_dw_pyramid      p
where a.cfae_purpose_code = p.cfae_purp_code
and p.cfae_purp_code IN ('EA','ED','EE','EF','EL','EO','EP','ER','ES','EU')
group by p.id_number, p.pref_mail_name, p.alloc, a.long_name, a.cfae_purpose_code
order by p.alloc






