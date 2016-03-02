select *
from entity_record_type
where record_type_code = 'PA'
and id_number IN
    (select id_number
        from ids
      where ids_type_code = 'CI1'
        and other_id IN
        (select other_id
           from ids
         where ids_type_code = 'CID'
           and id_number in
            (select id_number
               from entity_record_type
            where record_type_code IN ('GS','ST')
               and id_number in
                (select id_number
                    from sport
                    where sport_code = 'WR'))))