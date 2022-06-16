create table tblData(
idData int primary key identity not null,
[name] varchar(max),
phone varchar(max))

select top 500000 * from tblData

declare @counter int, @TotalCounter int
set @counter=1
set @TotalCounter = 1000000

While @counter <=1000000
	begin
	insert into tblData ([name],phone)values('Luis','Millones')
	set @counter = @counter +1
	end