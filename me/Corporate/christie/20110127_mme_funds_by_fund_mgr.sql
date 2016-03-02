/*** Funds Dr. Kaufman is fund manager for with MME indicator ***/
select distinct a.allocation_code, a.account, a.short_name, a.long_name, t.short_desc, t2.full_desc,
         (CASE 
         WHEN a.allocation_code IN  (select allocation_code from allocation where status_code = 'A' and (program_code IN ('ENM','GMM','MET','XX1','XX3') or alloc_dept_code IN ('MT'))) THEN 'MME'
          ELSE 'Non-MME Fund'
          END) mme_ind
from allocation a,
        tms_cfae_purpose  t,
        tms_fund_code t2
where a.status_code = 'A'
and    a.cfae_purpose_code = t.cfae_purpose_code
and    a.fund_name = t2.fund_code_code
and a.allocation_code IN
    (select allocation_code
    from assignment
    where assignment_id_number = '0000051437'
    and assignment_type IN ('DP','DS'));



/*** All Active MME allocations ***/
select distinct a.allocation_code, a.account, a.short_name, a.long_name, t.short_desc, t2.full_desc
from allocation  a,
        tms_cfae_purpose  t,
        tms_fund_code t2
where a.status_code = 'A'
and    a.cfae_purpose_code = t.cfae_purpose_code
and    a.fund_name = t2.fund_code_code
and a.allocation_code IN
        (select allocatioN_code
        from allocation
        where status_code = 'A'
        and (program_code IN('ENM','GMM','MET','XX1','XX3')
        or alloc_dept_code IN('MT')))
order by t.short_desc, t2.full_desc