 /*** All football alumni ***/
 select distinct(id_number)
from a_dw_address_good
where record_type_code = 'AL'
and id_number IN
(select id_number
from sport
where sport_code = 'FB');

/*** Separate list of all non-alumni donors to football program in last 5 years ***/
select distinct(id_number)
from a_dw_pyramid
where flag_alumni <> '1'
  and alloc IN ('1500','855','2888','743','4962','4435','Z-2888')
  and person_or_org = 'P'
  and year_of_giving >= '2005'
  and id_number NOT IN
        (select id_number
        from sport
        where sport_code = 'FB');

/*** All track & field and cross country alumni ***/
 select distinct(id_number)
from a_dw_address_good
where record_type_code = 'AL'
and id_number IN
(select id_number
from sport
where sport_code IN ('CC','TF'));

/*** Separate list of all non-alumni donors to men’s and women’s track & field and/or cross country program in last 5 years ***/
select distinct(id_number)
from a_dw_pyramid
where flag_alumni <> '1'
and person_or_org = 'P'
and alloc IN ('4105','4309','4346','2884')
and year_of_giving >= '2005'
and id_number NOT IN 
    (select id_number
    from sport
    where sport_code IN ('CC','TF'));

/*** Find Those Who May Be In Multiple Lists ***/

/*** Lists In:  PLAYED TRACK  -- DONATED TO FOOTBALL OR CREEKSIDE BUT DIDN'T PLAY ***/
select distinct(id_number), pref_mail_name, 'TRACK PLAYER, FOOTBALL DONOR' from a_dw_pyramid where flag_alumni <> '1' and person_or_org = 'P' and alloc IN ('1500','855','2888','743','4962','4435','Z-2888') and id_number NOT IN (select id_number from sport where sport_code = 'FB')
and id_number IN (select id_number from sport where sport_code IN ('CC','TF'));

/*** Note: The below one gives 0 returns ***/
/*** Lists In:  PLAYED FOOTBALL -- DONATED TO TRACK/CROSS COUNTRY BUT DIDN'T PLAY ***/
SELECT distinct(id_number), pref_mail_name, 'FOOTBALL PLAYER, TRACK DONOR' from a_dw_address_good where flag_dns <> '1' and flag_omit_from_mail <> '1' and id_number IN (select id_number FROM sport WHERE sport_code = 'FB')
and id_number IN (select distinct(id_number) from a_dw_pyramid where flag_alumni <> '1' and person_or_org = 'P' and alloc IN ('4105','4309','4346','2884') and id_number NOT IN      (select id_number from sport  where sport_code IN ('CC','TF')));

/*** Lists In:  PLAYED FOOTBALL -- PLAYED TRACK/CROSS COUNTRY ***/
select distinct(id_number), pref_mail_name, 'FOOTBALL PLAYER, TRACK PLAYER' from a_dw_address_good WHERE flag_dns <> '1' and flag_omit_from_mail <> '1' and id_number IN (select id_number from sport where sport_code = 'FB')
and id_number in (select id_number FROM sport WHERE sport_code IN ('CC','TF'));

/*** Played Neither sport - donated to both football/creekside AND track/cc ***/
select distinct(id_number), pref_mail_name, 'Non-Athlete, Donated To Football and Track' from a_dw_pyramid where flag_alumni <> '1' and alloc IN ('4105','4309','4346','2884') and year_of_giving >= '2005' and id_number NOT IN  (select id_number from sport where sport_code IN ('CC','TF'))
and id_number IN (select distinct(id_number) from a_dw_pyramid where flag_alumni <> '1'  and person_or_org = 'P' and alloc IN ('1500','855','2888','743','4962','4435','Z-2888')   and year_of_giving >= '2005'   and id_number NOT IN
                        (select id_number        from sport        where sport_code = 'FB'));


