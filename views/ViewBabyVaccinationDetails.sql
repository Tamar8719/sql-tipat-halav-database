create view ViewBabyVaccinationDetails as
select b.id as babyId,
       b.LastName as baby_last_name,
       sv.Name as nameVaccine,
       n.FirstName+n.LastName as nurs_name,
       pc.DateExictue as Date_Exictue
from _baby b
join _babyNeedVaccine bv
on b.BirthDate = bv.BabyId
join _stocVaccine sv
on sv.Id = bv.NeedVaccineId
join _pinkaschisunim pc
on pc.VaccineId = sv.Id
join _nurs n
on pc.NursId = n.Id



select*
from _stocVaccine