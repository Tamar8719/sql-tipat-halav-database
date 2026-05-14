create procedure updatePinkaschisunim(
@babyId varchar(9),@vaccinId int, @nursId varchar(9), @tofaotLlevay varchar(10)
)
as
begin
update  _pinkaschisunim
set  BabyId = @babyId, VaccineId =  @vaccinId, 
NursId = @nursId,tofaotLlevay = @tofaotLlevay,
DateExictue = GETDATE(),
countVaccin =  (
select COUNT(BabyId)
from _pinkaschisunim
group by BabyId
having BabyId = @babyId)

update _stocVaccine
set stoc = stoc - 1 
where @vaccinId = Id

end