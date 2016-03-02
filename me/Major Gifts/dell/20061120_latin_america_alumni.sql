Select id_number, pref_mail_name, pref_name_sort, pref_class_year
from a_dw_address_good
where p_country_code IN ('AT','SN','GUY','BO','BZ','CL','CM','CR','DR','EC','ELS','GT','HO','MX','NR','PN','PU','UG','VE','MX')
and record_type_code = 'AL'
order by p_country_code, pref_name_sort





--99 	Suriname 	5,683
--105 	Guyana 	4,612
 --   * Argentina
  --  * Bolivia
  --  * Brazil
   -- * Chile
  --  * Colombia
 --   * Costa Rica
    --* Cuba
  --  * Dominican Republic
   -- * Ecuador
 --   * El Salvador
 --   * Guatemala
   -- * Haiti
 --   * Honduras
 --   * Mexico
  --  * Nicaragua
 --   * Panama
 --   * Paraguay
   -- * Peru
 --   * Uruguay
 --   * Venezuela
   -- Mexico
