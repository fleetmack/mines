/*** Those Alumni with a preferred address in Euorpe ****/
/*** Euorpean countries as defined by a list Anita gave me ***/
/*** Missing country codes from TMS tables that should be added if we add them are the next commented line ***/
/*** Andorra, Holy See (Vatican City), Liechtenstein, Monaco, San Marino, Albania ***/
select t.short_desc, count(id_number)
from a_dw_address_good      a,
       tms_country      t
where a.p_country_code = t.country_code 
and a.p_country_code IN
    ('RU',  --Russia
    'AI', --Austria
    'BL', --Belgium
    'DK', --Denmark
    'FI', --Finland
    'FR', --France
    'GE', --German
    'GR', --Greece
    'IC', --Iceland
    'IE', --Ireland
    'IT', --Italy
    'LU', --Luxembourg
    'ML', --Malta
    'NL', --Netherlands
    'NO', --Norway
    'PO', --Portugal
    'SP', --Spain
    'SW', --Sweden
    'SZ', --Switzerland
    'UK', --United Kingdom
    'AR', --Armenia
    'AZER', --Azerbaijan
    'BEL', --Belarus
    'BS', --Bosnia/Herzegovina
    'BUL', --Bulgaria
    'CT', --Croatia
    'CZ', --Czech Republic
    'ES', --Estonia
    'HU', --Hungary
    'LA', --Latvia
    'LI', --Lithuania
    'PL', --Poland
    'RO', --Romania
    'SL', --Slovokia
    'UKR', --Ukraine
    'TR', --Turkey
    'ST', --Scotland
    'WL') --Wales
    and record_type_code = 'AL'
group by t.short_desc
order by t.short_desc;