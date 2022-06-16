

declare @PageNumber int,
		@PageSize int,
		@TotalPage int

set @PageNumber = 1 -- esto cambio cuando le das click
set @PageSize   = 12 --  esto se configura
set @TotalPage  = (select count(*) from [Person].[Address])/@PageSize

select rowNumber,@TotalPage as totalPages,
	   AddressLine1,
	   StateProvinceID 
	   from 
		  (select *, ROW_NUMBER() over(order by AddressID) as rowNumber
		  from [Person].[Address]) as Sales
		  where rowNumber between @PageSize*@PageNumber+1
							and     @PageSize * (@PageNumber+1)
  