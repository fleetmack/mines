/*** current visiting committee members ***/
select c.id_number, ct.full_desc, n.pref_name
from committee  c,
     tms_committee_table    ct,
     name       n
where ct.committee_code     = c.committee_code 
and n.id_number = c.id_number
and n.name_type_code = '00'
and c.committee_code in ('VAD','VCEP','VCGC','VCIF','VEB','VENG','VESE','VGE','VGL','VGP','VHON','VHUM','VLAI','VLIB','VME','VMIN','VML','VMME','VMS','VMSC','VPE','VPH','VPHY')
and c.committee_status_code = 'A'
