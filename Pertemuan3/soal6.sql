
SELECT e.empid, e.FirstName, e.LastName
	FROM HR.Employees e
	LEFT JOIN Sales.Orders o ON e.empid = o.empid AND o.OrderDate >= '20160501'
	WHERE o.empid IS NULL;
