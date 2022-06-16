
--CONTAINS (TO SPECIFIED SEARCH) 
go
-- UN TEXBOX 
SELECT *  FROM  person.Address A
where CONTAINS(A.AddressLine1,'avenue')--LIKE IS BETTER
go

SELECT *  FROM  person.Address A
where A.AddressLine1 like '%avenue%'--INSTEAD LIKE
go

--option
--1) where  CONTAINS (A.AddressLine1,'avenue')
--2) where  CONTAINS (A.AddressLine1,'"first avenue"')

--CONTAINS/AND/AND NOT/OR
--2 TEXTBOXS 
SELECT *  FROM  person.Address A
where  CONTAINS (A.AddressLine1,'avenue OR port')
--option
--1) where  CONTAINS (A.AddressLine1,'avenue OR port')
--2) where  CONTAINS (A.AddressLine1,'(36 AND avenue) OR port')
--3) where  CONTAINS (A.AddressLine1,'"avenue du" OR port')
--4) where  CONTAINS (A.AddressLine1,'"avenue du" AND port')

--2 TEXTBOXS  BETWEEN
--CONTAINS/NEAR 
--***hay que especicar la opcion NEAR necesita las palabras exactas***
SELECT *  FROM  person.Address A
where  CONTAINS (A.AddressLine1,'"5415 san" NEAR dr')

SELECT *  FROM  person.Address A
where  CONTAINS (A.AddressLine1,'NEAR((21,CENTRALE),6)')

SELECT *  FROM  person.Address A
where  CONTAINS (A.AddressLine1,'NEAR((HILTOn,FACTORY,25),5)')

--FORMSOF INFLECTIONAL
--AGARRA PLURALS (SUSTANTIVOS)
SELECT *  FROM  person.Address A
where  CONTAINS (A.AddressLine1,'FORMSOF(INFLECTIONAL,"centrals")')
--FORMSOF INFLECTIONAL
--AGARRA PLURALS (VERBOS) no importa el tiempo verbal

SELECT *  FROM  person.Address WHERE AddressID=8
update Person.Address set AddressLine1 ='6387 scenic avenue hacer'
where AddressID =8

SELECT *  FROM  person.Address A
where  CONTAINS (A.AddressLine1,'FORMSOF(INFLECTIONAL,"haga")',
Language 3082)

--FREETEXT
select * from person.Address A
where freetext(A.AddressLine1,'"825 99828 routh"')

--POPULATION DE UNA TABLA
ALTER FULLTEXT INDEX ON person.address START FULL POPULATION
ALTER FULLTEXT INDEX ON person.address START UPDATE POPULATION

  