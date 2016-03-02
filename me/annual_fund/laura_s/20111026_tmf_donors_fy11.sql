/*** How many donors to TMF in 2011 ***/
/*** Cash or Commit, either way ***/
/*** count joint as 2 donors ***/
/**** simple enough ****/
select distinct id_number
from a_dw_pyramid
where alloc = '3795'
and year_of_giving = '2011'