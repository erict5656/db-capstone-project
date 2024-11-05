SELECT 
    M.MenuName
FROM 
    Menus M
WHERE 
    M.MenuID = ANY (
        SELECT 
            O.MenuID
        FROM 
            Orders O
        WHERE 
            O.Quantity > 2
    );
