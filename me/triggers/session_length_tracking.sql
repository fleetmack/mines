drop table a_track_adv_sess;
commit;

create table a_track_adv_sess 
(name varchar2(30), 
on_time date, 
off_time date,
action varchar2(10),
sid      varchar2(20),
total_on_time number(20,4));
commit;

create or replace trigger track_logon
after logon on database
begin
   insert into a_track_adv_sess (name, on_time, action, sid) values (user, sysdate, 'LOGON',   sys_context('USERENV','SESSIONID'));
    commit;
end tr_logon;

create or replace trigger track_logoff
before logoff on database
begin
  update a_track_adv_sess t
      set t.off_time = sysdate
    where t.sid = sys_context('USERENV','SESSIONID');
   commit;
  update a_track_adv_sess t
      set t.total_on_time = datediff('hh',t.on_time,t.off_time)
     where t.sid = sys_context('USERENV','SESSIONID');
commit;
end tr_logon;