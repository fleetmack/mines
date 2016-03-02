select a.id_number,
       a.pref_mail_name,
       a.ass_pref_mail_name,
       a.ass_type_desc,
       ad.p_city,
       ad.p_state_code,
       ad.p_zipcode
  from a_dw_assignment      a,
       a_dw_address_good    ad
 where a.id_number = ad.id_number
   and (a.ass_id_number = 29811        /***Jennifer Ramirez***/
    or a.ass_id_number = 33246        /***Traci Lanier***/
    or a.ass_id_number = 33733        /***Lisa Olson***/
    or a.ass_id_number = 29764        /***Laura Mesack***/
    or a.ass_id_number = 33714        /***Karen Shaw***/
    or a.ass_id_number = 35082        /***Heather Kenney***/
    or a.ass_id_number = 29710)        /***Traci Weller***/
order by a.ass_id_number, a.ass_type_desc

