/***residents of thailand of some sort***/
select * from a_dw_address_good

where (p_country_code = 'TH'
or    b_country_code = 'TH'
or    h_country_code = 'TH')
order by pref_name_sort

/*** those with Thailand in their job title***/
select * from a_dw_jobs
where lower(job_title) like '%thailand%'

