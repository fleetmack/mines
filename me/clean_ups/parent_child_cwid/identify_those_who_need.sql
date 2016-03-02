TRUNCATE TABLE adv_work_ids;
/
/***
create table ADV_WORK_IDS(
	Header                        	varchar2(117),
	id_number                     	varchar2(10),
	xsequence                     	Number(10,0),
	xtype                         	varchar2(3),
	other_id                      	varchar2(20),
	added                         	date,
	modified                      	date,
	operator                      	varchar2(32),
	owner                         	varchar2(2),
	pk                            	varchar2(13),
	fk                            	char(1),
	retrieved                     	date);
***/

INSERT INTO ADV_WORK_IDS
(header,
xtype,
added,
other_id)
 (SELECT '0000006013                              '||c.id_number||'A      All iMods IDs                                          _',
'CI1',
sysdate,
ic.other_id
 FROM children   c,
          ids         ic
where c.child_id_number = ic.id_number
    and  ic.ids_type_code = 'CID'
    and ic.other_id NOT IN
    (select ip.other_id from ids ip where ip.ids_type_code = 'CI1')
and ic.id_number IN
    (select ert.id_number from entity_record_type ert where ert.record_type_code IN ('AL','SF','ST','GS')));
commit;