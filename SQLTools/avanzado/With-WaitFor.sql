--WIth
/*
UPDATE 
			Person.Person 
	   SET 
			Suffix = e.NationalIDNumber
	  FROM 
			HumanResources.Employee e
			inner join Person.Person p 
			on p.BusinessEntityID = e.BusinessEntityID
	 WHERE	
			e.JobTitle ='Sales Representative'
*/

With employee as(
		select BusinessEntityID, NationalIDNumber
		from HumanResources.Employee
		where JobTitle ='Sales Representative')
UPDATE  Person.Person set Suffix = e.NationalIDNumber
from Person.Person p
inner join employee e
on e.BusinessEntityID = p.BusinessEntityID


BEGIN TRAN
	UPDATE 
			Person.Person 
	   SET 
			Suffix = e.NationalIDNumber
	  FROM 
			HumanResources.Employee e
			inner join Person.Person p 
			on p.BusinessEntityID = e.BusinessEntityID
	 WHERE	
			e.JobTitle ='Sales Representative'
WAITFOR DELAY '00:00:07'
ROLLBACK TRAN --  EL ROLLBACK DEVUELVE LA TRANSACCION


--------------------------------------------------------------------

SELECT * FROM Person.Person (NOLOCK)
