--a. Get all the details from the person table including email ID, phonenumber and phone number type
select * from [Person].[Person]

select p.FirstName,p.LastName,E.EmailAddress,PH.phonenumber,PHT. name from [Person].[Person] p
inner join person.EmailAddress E on E.BusinessEntityID=p.BusinessEntityID
inner join Person.PersonPhone ph on ph.BusinessEntityID=p.BusinessEntityID
inner join Person.PhoneNumberType PHT on PHT.PhoneNumberTypeID=ph.PhoneNumberTypeID

--b. Get the details of the sales header order made in May 2011
select * from [Sales].[SalesOrderHeader]
select * from [Sales].[SalesOrderHeader] where OrderDate between ('2011-05-01') and ('2011-05-31')

--c. Get the details of the sales details order made in the month of May 2011
select * from [Sales].[SalesOrderDetail] 

select * from [Sales].[SalesOrderHeader] SH
inner join [Sales].[SalesOrderDetail] sd on sd.SalesOrderID=SH.SalesOrderID
where OrderDate between ('2011-05-01') and ('2011-05-31')

--d. Get the total sales made in May 2011

select sum(SD.LineTotal) as totalsales from [Sales].[SalesOrderDetail] SD
inner join sales.SalesOrderHeader SH on SH.SalesOrderID=SD.SalesOrderID
where OrderDate between ('2011-05-01') and ('2011-05-31')

--e. Get the total sales made in the year 2011 by month order by increasing sales 

select sum(Linetotal) as totalsales , MONTH(orderdate) as salesmonth from sales.SalesOrderDetail SD
inner join sales.SalesOrderHeader SH on SH.SalesOrderID=SD.SalesOrderID
group by MONTH(OrderDate)
order by MONTH(OrderDate)

--f.Get the total sales made to the customer with FirstName='Gustavo' and lastname='Achong'
select * from Person.Person

select firstname,lastname,sum(linetotal) as totalsales from person.Person P
inner join sales.Customer c 
on p.BusinessEntityID=c.PersonID
inner join Sales.SalesOrderHeader SH 
on SH.CustomerID=c.CustomerID
inner join sales.SalesOrderDetail SD
on SH.SalesOrderID=SD.SalesOrderID
where P.FirstName='Gustavo' and P.LastName='Achong'
group by P.FirstName,P.LastName

