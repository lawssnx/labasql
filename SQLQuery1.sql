USE Restaurant_New;

--1
--SELECT * 
--FROM Product
--WHERE Name = 'курка';

--2
--SELECT * 
--FROM Position 
--WHERE Name = 'Офіціант';

--3
--SELECT FullName 
--FROM Employee;

--4
--SELECT 
--    TableNo AS "Номер столика", 
--    Date AS "Дата замовлення", 
--    EmployeeID AS "Ідентифікатор співробітника"
--FROM Bill
--ORDER BY Date, TableNo;

--5
--SELECT 
--    P.PositionID AS "ID Посади", 
--    P.Name AS "Назва Посади", 
--    E.EmployeeID AS "ID Співробітника", 
--    E.FullName AS "ПІБ Співробітника"
--FROM Position P, Employee E;

--6
--SELECT 
--    D.DishID AS "ID Страви", 
--    D.Name AS "Назва Страви", 
--    P.ProductID AS "ID Продукта", 
--    P.Name AS "Назва Продукта"
--FROM Dish D, Product P;

--7
--SELECT 
--    D.DishID AS "ID_Страви", 
--    D.Name AS "Назва_Страви", 
--    P.ProductID AS "ID_Продукта", 
--    P.Name AS "Назва_Продукта"
--FROM Dish AS D
--CROSS JOIN Product AS P;

--8
--Неявний синтаксис з’єднання (старий стиль синтаксису з'єднання)
--SELECT 
--    E.FullName AS "ПІБ_Співробітника", 
--    P.Name AS "Посада"
--FROM Employee E, Position P
--WHERE E.PositionID = P.PositionID;

--2. Неявний синтаксис з використанням псевдонімів
--SELECT 
--    E.FullName AS "ПІБ_Співробітника", 
--    P.Name AS "Посада"
--FROM Employee AS E, Position AS P
--WHERE E.PositionID = P.PositionID;

--Явний синтаксис з’єднання (SQL ANSI:1992 синтаксис з’єднання)
--SELECT 
--    E.FullName AS "ПІБ_Співробітника", 
--    P.Name AS "Посада"
--FROM Employee E
--JOIN Position P ON E.PositionID = P.PositionID;

--Явний синтаксис з використанням псевдонімів
--SELECT 
--    E.FullName AS "ПІБ_Співробітника", 
--    P.Name AS "Посада"
--FROM Employee AS E
--JOIN Position AS P ON E.PositionID = P.PositionID;

--9
--Неявний синтаксис з’єднання (старий стиль)
--SELECT 
--    E.FullName, 
--    E.EmployeeID 
--FROM Employee E, Bill B 
--WHERE E.EmployeeID = B.EmployeeID 
--  AND B.TableNo = 1;

--Неявний синтаксис з використанням псевдонімів
--SELECT 
--    E.FullName AS "ПІБ_Співробітника", 
--    E.EmployeeID AS "Ідентифікатор_Співробітника" 
--FROM Employee AS E, Bill AS B 
--WHERE E.EmployeeID = B.EmployeeID 
--  AND B.TableNo = 1;

--Явний синтаксис з’єднання (SQL ANSI:1992)
--SELECT 
--    E.FullName, 
--    E.EmployeeID 
--FROM Employee E 
--JOIN Bill B ON E.EmployeeID = B.EmployeeID 
--WHERE B.TableNo = 1;

--Явний синтаксис з використанням псевдонімів
--SELECT 
--    E.FullName AS "ПІБ_Співробітника", 
--    E.EmployeeID AS "Ідентифікатор_Співробітника" 
--FROM Employee AS E 
--JOIN Bill AS B ON E.EmployeeID = B.EmployeeID 
--WHERE B.TableNo = 1;

--10
--SELECT 
--    E.FullName AS "ПІБ", 
--    P.Name AS "Назва_Посади", 
--    E.BirthPlace AS "Місто_Народження", 
--    E.Salary AS "Оклад"
--FROM Employee E
--JOIN Position P ON E.PositionID = P.PositionID
--WHERE E.BirthPlace IN ('Київ', 'Одесса')
--ORDER BY E.FullName;

--11
--SELECT 
--    E.FullName AS "ПІБ", 
--    P.Name AS "Назва_Посади", 
--    E.BirthPlace AS "Місто_Народження", 
--    E.BirthDate AS "Дата_Народження"
--FROM Employee E
--JOIN Position P ON E.PositionID = P.PositionID
--WHERE (E.Bonus BETWEEN 300 AND 800 OR E.Bonus = 0)
--ORDER BY E.FullName, E.Bonus;

--12
--SELECT 
--    D.Name AS "Назва_Страви", 
--    O.DishQuantity AS "Кількість_Замовлених_Страв", 
--    B.Date AS "Дата_Замовлення", 
--    E.FullName AS "ПІБ", 
--    P.Name AS "Назва_Посади"
--FROM Orders O
--JOIN Bill B ON O.BillID = B.BillID
--JOIN Employee E ON B.EmployeeID = E.EmployeeID
--JOIN Position P ON E.PositionID = P.PositionID
--JOIN Dish D ON D.DishID = O.OrderID 
--ORDER BY E.FullName;

--13
--SELECT 
--    D.Name AS "Назва_Страви", 
--    O.DishQuantity AS "Кількість_Замовлених_Страв", 
--    B.TableNo AS "№_Столику"
--FROM Orders O
--JOIN Bill B ON O.BillID = B.BillID
--JOIN Dish D ON D.DishID = O.OrderID
--WHERE B.Amount > 55
--    AND B.Date BETWEEN '2024-09-15' AND '2024-09-20';

--14
--SELECT 
--    E.FullName AS "ПІБ_Співробітника", 
--    P.Name AS "Назва_Посади", 
--    B.Date AS "Дата_Замовлення"
--FROM Employee E
--JOIN Position P ON E.PositionID = P.PositionID
--JOIN Bill B ON E.EmployeeID = B.EmployeeID
--WHERE B.TableNo NOT IN (1, 2)
--ORDER BY E.FullName;

--15
--SELECT 
--    E.FullName AS "ПІБ_Співробітника", 
--    P.Name AS "Назва_Посади", 
--    B.TableNo AS "№_Столика", 
--    SUM(O.DishQuantity) AS "Кількість_Замовлених_Страв", 
--    D.Name AS "Назва_Страви"
--FROM Employee E
--JOIN Bill B ON E.EmployeeID = B.EmployeeID
--JOIN Orders O ON B.BillID = O.BillID
--JOIN Dish D ON O.OrderID = O.OrderID
--JOIN DishComposition DC ON D.DishID = DC.DishID
--JOIN Product PR ON DC.ProductID = PR.ProductID
--JOIN Position P ON E.PositionID = P.PositionID
--GROUP BY 
--    E.FullName, 
--    P.Name, 
--    B.TableNo, 
--    D.Name
--ORDER BY E.FullName;


--16
--SELECT 
--    P.Name AS "Назва_Посади", 
--    COUNT(E.EmployeeID) AS "Кількість_Співробітників"
--FROM Position P
--LEFT JOIN Employee E ON P.PositionID = E.PositionID
--GROUP BY P.Name
--ORDER BY P.Name;

--17
--SELECT 
--    P.Name AS "Назва_Продукту",
--    COUNT(D.DishID) AS "Кількість_Страв"
--FROM Dish D
--JOIN DishComposition DC ON D.DishID = DC.DishID
--JOIN Product P ON DC.ProductID = P.ProductID
--WHERE D.Price = 10
--GROUP BY P.Name
--ORDER BY P.Name;

--18
--SELECT 
--    E.FullName AS "ПІБ_Співробітника",
--    P.Name AS "Назва_Посади",
--    B.TableNo AS "№_Столика",
--    SUM(O.DishQuantity) AS "Кількість_Замовлених_Страв",
--    COUNT(DISTINCT DC.ProductID) AS "Кількість_Продуктів"
--FROM Employee E
--JOIN Position P ON E.PositionID = P.PositionID
--JOIN Bill B ON E.EmployeeID = B.EmployeeID
--JOIN Orders O ON B.BillID = O.BillID
--JOIN DishComposition DC ON O.OrderID = DC.DishID
--WHERE P.Name = 'Офіціант'
--GROUP BY E.FullName, P.Name, B.TableNo
--ORDER BY E.FullName;

--19
--SELECT 
--    D.Name AS "Назва_Страви",
--    E.FullName AS "ПІБ_Співробітника",
--    B.Date AS "Дата_Замовлення"
--FROM Orders O
--JOIN Bill B ON O.BillID = B.BillID
--JOIN Employee E ON B.EmployeeID = E.EmployeeID
--JOIN Dish D ON O.OrderID = D.DishID
--WHERE B.Date BETWEEN '2024-09-12' AND '2024-09-20'
--ORDER BY D.Name, E.FullName;

--20
--SELECT 
--    P.Name AS "Назва_Посади",
--    E.FullName AS "ПІБ_Співробітника"
--FROM Position P
--LEFT JOIN Employee E ON P.PositionID = E.PositionID
--ORDER BY P.Name, E.FullName;

--21
--SELECT 
--    E.FullName AS "ПІБ_Співробітника",
--    B.TableNo AS "№_Столика"
--FROM Employee E
--LEFT JOIN Bill B ON E.EmployeeID = B.EmployeeID
--ORDER BY E.FullName, B.TableNo;