/***
Hi Bryan – I need the following lists pulled for my grant – let me know if you can help
For both fiscal year 2007/2008 and 2006/2007
List major contributors (foundations, businesses, government, individuals) with amounts for the previous two years.  Do not include names of individual donors. 
I would consider a major contributor $10,000 plus during a year.
***/

SELECT  py.id_number, DECODE(py.person_or_org,'P','Individual',py.pref_mail_name), DECODE(py.record_type_code,'AL','IN',
                                                                                                                                                         'FR','IN',
                                                                                                                                                         'PA','IN',
                                                                                                                                                         'PX','IN',
                                                                                                                                                         py.record_type_code),       
                                                                                                                rt.short_desc,                                                                                                                                                         
                                                                                                                sum(py.associated_amount)
FROM a_dw_pyramid   py,
        tms_record_type     rt
WHERE rt.record_type_code = py.record_type_code
     AND py.year_of_giving = '2007'
     AND py.flag_alumni <> '1'
group by py.id_number, DECODE(py.person_or_org,'P','Individual',py.pref_mail_name), DECODE(py.record_type_code,'AL','IN',
                                                                                                                                                         'FR','IN',
                                                                                                                                                         'PA','IN',
                                                                                                                                                         'PX','IN',
                                                                                                                                                         py.record_type_code),
                                                                                                                                                         rt.short_desc
having sum(py.associated_amount) >= 10000
order by DECODE(py.record_type_code,'AL','IN',
                                                                                                                                                         'FR','IN',
                                                                                                                                                         'PA','IN',
                                                                                                                                                         'PX','IN',
                                                                                                                                                         py.record_type_code), DECODE(py.person_or_org,'P','Individual',py.pref_mail_name), rt.short_desc

