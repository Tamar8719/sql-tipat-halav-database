create procedure onTime(
@babyId varchar(9), @DateExictue datetime 
)
as
begin
declare @BirthDate datetime=(
select BirthDate
from _baby
where Id = @babyId
)

declare @babyAge int = datediff(month, @BirthDate, @DateExictue)
declare @text varchar(100)
select Id, Age,
case
when @babyAge > Age then 'its too late'
when @babyAge < Age then 'its too early'
else 'good'
end as @text
from _vaccineAge
end