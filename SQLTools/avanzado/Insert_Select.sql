

select * from person.Person
select * from personEjemplo
create table v(
firstName varchar (50),
lastName varchar (50)
)
declare @tablaEjemplo as table (firstName varchar(50),lastName varchar(50)) 
-- INSERT -  SELECT - INNER JOIN
	INSERT INTO 
			@tablaEjemplo
	 SELECT 
			FirstName,LastName  from Person.Person --despues del from puedes 
				-- un subquery como tabla

select * from Person.Person
select * from HumanResources.Employee
--UPDATE - FROM INNER JOIN
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

--DELETE -  FROM

	DELETE
			e
	 FROM 
			Person.BusinessEntity b		
			inner join Person.EmailAddress e   on e.BusinessEntityID = b.BusinessEntityID
			inner join HumanResources.Employee h on h.BusinessEntityID = b.BusinessEntityID
	 WHERE 
			h.JobTitle = 'stocker'

			--*** SELECT INTO ***
--SELECT INTO (insert anything)  COPIA SOLO LOS CAMPOS DE UNA TABLA
	SELECT * INTO dbo.tblCopiaCampos
	from Person.EmailAddress where 1=0

	SELECT * FROM Person.EmailAddress
	SELECT * FROM tblCopiaCampos
--SELECT INTO (insert anything) COPIA TODOS LOS CAMPOS Y FILAS MENOS SUS PK NI INDICES
    SELECT * INTO dbo.tblCopiaCamposYfilas
	from Person.Person 
	SELECT * FROM tblCopiaCamposYfilas
--SELECT INTO (insert tbl in other db) CREA UNA COPIA DE LA TABLA EN OTRA DB	
	SELECT * INTO Northwind..tblEnOtraDb
	FROM Person.Address
--SELECT INTO (insert tbl in other db) CREA UNA COPIA DE LA TABLA EN OTRA DB +CAMPO IDENTITY	
	SELECT Identity(int,1,1)as newCampo,* INTO Northwind..tblEnOtraDbIdentity
	FROM Person.PersonPhone

-- DBCC CLONEDATABASE

DBCC CLONEDATABASE(AdventureWorks2017,AdventureWorks2017Clonado)

	