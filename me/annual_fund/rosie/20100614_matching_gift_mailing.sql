/***
As soon as you get a chance, would you mind pulling two lists for me?
The first will be everyone (both current and retired employees) who has made a gift in FY10 and works for a matching gift company, but does not have a match claim on their record – and has a good email address.
The second will be everyone (both current and retired employees) who has made a gift in FY10 and works for a matching gift company, but does not have a match claim on their record – but ONLY has a mail address, no email.
You can save the lists here, as well as see the previous lists to see what info should be pulled:
I:\OIA\oia (shared)\Annual Giving\Mailings\fy10_mail\Matching Gift
***/
select *
from a_aga_3
where flag_omit_from_mail = 0
and flag_dns = 0
and id_number in
        (select id_number
            from a_dw_jobs
            where record_status_code = 'A'
            and employ_relat_code = 'PE'
            and job_status_code IN ('C','R')
            and employer_id_number IN
                (select id_number from matching_policy where active_ind = 'A'))
and flag_gift_cfy = 1

and p_email_address > ' ';

select *
from a_dw_pyramid
where flag_alumni = 0
and flag_non_monthend = 0
and associated_code <> 'B'
and year_of_giving = '2010'
and associated_amount_match = 0
and associated_amount_claim = 0
and id_number in
            (select id_number
            from a_dw_jobs
            where record_status_code = 'A'
            and employ_relat_code = 'PE'
            and job_status_code IN ('C','R')
            and employer_id_number IN
                (select id_number from matching_policy where active_ind = 'A'))









select *
from a_dw_pyramid
where year_of_giving = '2010' 
and id_number = '0000004510';