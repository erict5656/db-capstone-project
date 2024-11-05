SELECT 
    C.CustomerID,
    C.FullName,
    O.OrderID,
    O.TotalCost AS Cost,
    M.MenuName,
    MI.CourseName,
    MI.StarterName
FROM 
    Orders O
JOIN 
    Customers C ON O.CustomerID = C.CustomerID
JOIN 
    Menus M ON O.MenuID = M.MenuID
JOIN 
    MenuItems MI ON M.MenuItemsID = MI.MenuItemsID
WHERE 
    O.TotalCost > 150
ORDER BY 
    O.TotalCost ASC;
