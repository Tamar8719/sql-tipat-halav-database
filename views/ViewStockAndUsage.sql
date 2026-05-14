create view ViewStockAndUsage as
select sv.Name as name_vaccine,
sv.stoc as stoc,
COUNT(pc.VaccineId) as count
from _stocVaccine sv
join _pinkaschisunim pc
on sv.Id = pc.VaccineId
group by sv.Name, sv.stoc,pc.VaccineId