create table _nurs(
Id varchar(9) not null primary key,
FirstName varchar(20) not null,
LastName varchar(20) null
)
create table _baby(
Id varchar(9) not null primary key,
LastName varchar(20) null,
MotherId varchar(9) not null,
BirthDate datetime null,
)
create table _stocVaccine(
Id int not null primary key identity(1,1),
Name varchar(50) not null,
stoc int null check(stoc>0)
)
create table _babyNeedVaccine(
Id int not null primary key identity(1,1),
BabyId varchar(9) null,
NeedVaccineId int null
constraint FK_baby_babyNeedVaccine foreign key (BabyId)
references dbo._baby (Id),
constraint FK_needVaccine_babyNeedVaccine foreign key (NeedVaccineId)
references dbo._stocVaccine (Id)
)
create table _pinkaschisunim(
Id int not null primary key identity(1,1),
BabyId varchar(9) not null,
VaccineId int null,
DateExictue datetime null,
NursId varchar(9) null,
tofaotllevay varchar(10) default('false')
constraint FK_baby_pinkaschisunim foreign key (BabyId)
references dbo._baby (Id),
constraint FK_vaccine_pinkaschisunim foreign key (VaccineId)
references dbo._stocVaccine (Id),
constraint FK_nurs_pinkaschisunim foreign key (NursId)
references dbo._nurs (Id)
)
create table _vaccineAge(
Id int not null primary key identity(1,1),
stocVaccineid int null,
Age int null
constraint FK_needVaccine_vaccineStoc foreign key (stocVaccineid)
references dbo._stocVaccine (Id)
)