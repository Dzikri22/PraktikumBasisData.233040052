SELECT c.empid, c.firstname, c.lastname, c.titleofcourtesy,
	CASE
		WHEN c.titleofcourtesy IN ('Ms.', 'Mrs.') THEN 'Female'
		WHEN c.titleofcourtesy = 'Mr.' THEN 'Male'
		ELSE 'Unknown'
	END AS 'Gender'
	FROM HR.Employees c;