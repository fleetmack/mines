create or replace procedure advance.activity_update_past
IS
BEGIN

update activity
     set activity_participation_code = 'NR'
where activity_participation_code = 'I'
and activity_code IN
        (select activity_code
            from activities_yesterday
            where email_number = '4');


update activity
     set activity_participation_code = 'IA'
where activity_participation_code = 'IX'
and activity_code IN
        (select activity_code
            from activities_yesterday
            where email_number = '4');

update tms_activity_table
    set status_code = 'I'
where activity_code IN
    (select activity_code
       from activities_yesterday
    where email_number = '4');
COMMIT;
END;