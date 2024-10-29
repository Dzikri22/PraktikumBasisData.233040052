
SELECT c.custid, c.companyname, o.orderid, orderdate
	FROM Sales.Customers c 
	INNER JOIN Sales.Orders o ON o.custid = c.custid;
