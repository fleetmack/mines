/*** Searches Contact Reports with a string of reunion in it for FY05 ***/
select cr.id_number, 
cr.contacted_name, 
cr.contacted_sort_name,
 cr.summary, 
 cr.description, 
 cr.contact_date, 
tr.full_desc
from contact_report     cr,
     tms_contact_rpt_type   tr
where tr.contact_type = cr.contact_type 
and cr.report_id in
(select r.report_id
   from contact_rpt_credit  r
where r.id_number = '0000035501')
and cr.contact_date >= (to_date('07/01/2004','mm/dd/yyyy'))
and cr.contact_date <= (to_date('06/30/2005','mm/dd/yyyy'))


/*** put this into the filter within powerbuilder to work ***/
/*** summary is a LONG datatype which won't allow this functino to work here ***/
--and lower(cr.summary) like '%reunion%'
