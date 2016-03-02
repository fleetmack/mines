/*** Sub-$100 Memorial Gift Counts Per Month ***/
select decode(substr(date_of_record,5,2),'01','January',
                                         '02','February',
                                         '03','March',
                                         '04','April',
                                         '05','May',
                                         '06','June',
                                         '07','July',
                                         '08','August',
                                         '09','September',
                                         '10','October',
                                         '11','November',
                                         '12','December') month_of_giving,
                                         count(distinct(receipt))
from a_ack_rcpt
where flag_honor = '1'
  and associated_amount_cfy + associated_amount_cfy_match + associated_amount_cfy_claim <= 100
group by decode(substr(date_of_record,5,2),'01','January',
                                         '02','February',
                                         '03','March',
                                         '04','April',
                                         '05','May',
                                         '06','June',
                                         '07','July',
                                         '08','August',
                                         '09','September',
                                         '10','October',
                                         '11','November',
                                         '12','December')
--having sum(associated_amount_cfy + associated_amount_cfy_match + associated_amount_cfy_claim) <= 100