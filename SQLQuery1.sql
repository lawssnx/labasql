USE Restaurant_New;

--1
--SELECT * 
--FROM Product
--WHERE Name = '�����';

--2
--SELECT * 
--FROM Position 
--WHERE Name = '��������';

--3
--SELECT FullName 
--FROM Employee;

--4
--SELECT 
--    TableNo AS "����� �������", 
--    Date AS "���� ����������", 
--    EmployeeID AS "������������� �����������"
--FROM Bill
--ORDER BY Date, TableNo;

--5
--SELECT 
--    P.PositionID AS "ID ������", 
--    P.Name AS "����� ������", 
--    E.EmployeeID AS "ID �����������", 
--    E.FullName AS "ϲ� �����������"
--FROM Position P, Employee E;

--6
--SELECT 
--    D.DishID AS "ID ������", 
--    D.Name AS "����� ������", 
--    P.ProductID AS "ID ��������", 
--    P.Name AS "����� ��������"
--FROM Dish D, Product P;

--7
--SELECT 
--    D.DishID AS "ID_������", 
--    D.Name AS "�����_������", 
--    P.ProductID AS "ID_��������", 
--    P.Name AS "�����_��������"
--FROM Dish AS D
--CROSS JOIN Product AS P;

--8
--������� ��������� 璺������ (������ ����� ���������� �'�������)
--SELECT 
--    E.FullName AS "ϲ�_�����������", 
--    P.Name AS "������"
--FROM Employee E, Position P
--WHERE E.PositionID = P.PositionID;

--2. ������� ��������� � ������������� ���������
--SELECT 
--    E.FullName AS "ϲ�_�����������", 
--    P.Name AS "������"
--FROM Employee AS E, Position AS P
--WHERE E.PositionID = P.PositionID;

--����� ��������� 璺������ (SQL ANSI:1992 ��������� 璺������)
--SELECT 
--    E.FullName AS "ϲ�_�����������", 
--    P.Name AS "������"
--FROM Employee E
--JOIN Position P ON E.PositionID = P.PositionID;

--����� ��������� � ������������� ���������
--SELECT 
--    E.FullName AS "ϲ�_�����������", 
--    P.Name AS "������"
--FROM Employee AS E
--JOIN Position AS P ON E.PositionID = P.PositionID;

--9
--������� ��������� 璺������ (������ �����)
--SELECT 
--    E.FullName, 
--    E.EmployeeID 
--FROM Employee E, Bill B 
--WHERE E.EmployeeID = B.EmployeeID 
--  AND B.TableNo = 1;

--������� ��������� � ������������� ���������
--SELECT 
--    E.FullName AS "ϲ�_�����������", 
--    E.EmployeeID AS "�������������_�����������" 
--FROM Employee AS E, Bill AS B 
--WHERE E.EmployeeID = B.EmployeeID 
--  AND B.TableNo = 1;

--����� ��������� 璺������ (SQL ANSI:1992)
--SELECT 
--    E.FullName, 
--    E.EmployeeID 
--FROM Employee E 
--JOIN Bill B ON E.EmployeeID = B.EmployeeID 
--WHERE B.TableNo = 1;

--����� ��������� � ������������� ���������
--SELECT 
--    E.FullName AS "ϲ�_�����������", 
--    E.EmployeeID AS "�������������_�����������" 
--FROM Employee AS E 
--JOIN Bill AS B ON E.EmployeeID = B.EmployeeID 
--WHERE B.TableNo = 1;

--10
--SELECT 
--    E.FullName AS "ϲ�", 
--    P.Name AS "�����_������", 
--    E.BirthPlace AS "̳���_����������", 
--    E.Salary AS "�����"
--FROM Employee E
--JOIN Position P ON E.PositionID = P.PositionID
--WHERE E.BirthPlace IN ('���', '������')
--ORDER BY E.FullName;

--11
--SELECT 
--    E.FullName AS "ϲ�", 
--    P.Name AS "�����_������", 
--    E.BirthPlace AS "̳���_����������", 
--    E.BirthDate AS "����_����������"
--FROM Employee E
--JOIN Position P ON E.PositionID = P.PositionID
--WHERE (E.Bonus BETWEEN 300 AND 800 OR E.Bonus = 0)
--ORDER BY E.FullName, E.Bonus;

--12
--SELECT 
--    D.Name AS "�����_������", 
--    O.DishQuantity AS "ʳ������_����������_�����", 
--    B.Date AS "����_����������", 
--    E.FullName AS "ϲ�", 
--    P.Name AS "�����_������"
--FROM Orders O
--JOIN Bill B ON O.BillID = B.BillID
--JOIN Employee E ON B.EmployeeID = E.EmployeeID
--JOIN Position P ON E.PositionID = P.PositionID
--JOIN Dish D ON D.DishID = O.OrderID 
--ORDER BY E.FullName;

--13
--SELECT 
--    D.Name AS "�����_������", 
--    O.DishQuantity AS "ʳ������_����������_�����", 
--    B.TableNo AS "�_�������"
--FROM Orders O
--JOIN Bill B ON O.BillID = B.BillID
--JOIN Dish D ON D.DishID = O.OrderID
--WHERE B.Amount > 55
--    AND B.Date BETWEEN '2024-09-15' AND '2024-09-20';

--14
--SELECT 
--    E.FullName AS "ϲ�_�����������", 
--    P.Name AS "�����_������", 
--    B.Date AS "����_����������"
--FROM Employee E
--JOIN Position P ON E.PositionID = P.PositionID
--JOIN Bill B ON E.EmployeeID = B.EmployeeID
--WHERE B.TableNo NOT IN (1, 2)
--ORDER BY E.FullName;

--15
--SELECT 
--    E.FullName AS "ϲ�_�����������", 
--    P.Name AS "�����_������", 
--    B.TableNo AS "�_�������", 
--    SUM(O.DishQuantity) AS "ʳ������_����������_�����", 
--    D.Name AS "�����_������"
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
--    P.Name AS "�����_������", 
--    COUNT(E.EmployeeID) AS "ʳ������_�����������"
--FROM Position P
--LEFT JOIN Employee E ON P.PositionID = E.PositionID
--GROUP BY P.Name
--ORDER BY P.Name;

--17
--SELECT 
--    P.Name AS "�����_��������",
--    COUNT(D.DishID) AS "ʳ������_�����"
--FROM Dish D
--JOIN DishComposition DC ON D.DishID = DC.DishID
--JOIN Product P ON DC.ProductID = P.ProductID
--WHERE D.Price = 10
--GROUP BY P.Name
--ORDER BY P.Name;

--18
--SELECT 
--    E.FullName AS "ϲ�_�����������",
--    P.Name AS "�����_������",
--    B.TableNo AS "�_�������",
--    SUM(O.DishQuantity) AS "ʳ������_����������_�����",
--    COUNT(DISTINCT DC.ProductID) AS "ʳ������_��������"
--FROM Employee E
--JOIN Position P ON E.PositionID = P.PositionID
--JOIN Bill B ON E.EmployeeID = B.EmployeeID
--JOIN Orders O ON B.BillID = O.BillID
--JOIN DishComposition DC ON O.OrderID = DC.DishID
--WHERE P.Name = '��������'
--GROUP BY E.FullName, P.Name, B.TableNo
--ORDER BY E.FullName;

--19
--SELECT 
--    D.Name AS "�����_������",
--    E.FullName AS "ϲ�_�����������",
--    B.Date AS "����_����������"
--FROM Orders O
--JOIN Bill B ON O.BillID = B.BillID
--JOIN Employee E ON B.EmployeeID = E.EmployeeID
--JOIN Dish D ON O.OrderID = D.DishID
--WHERE B.Date BETWEEN '2024-09-12' AND '2024-09-20'
--ORDER BY D.Name, E.FullName;

--20
--SELECT 
--    P.Name AS "�����_������",
--    E.FullName AS "ϲ�_�����������"
--FROM Position P
--LEFT JOIN Employee E ON P.PositionID = E.PositionID
--ORDER BY P.Name, E.FullName;

--21
--SELECT 
--    E.FullName AS "ϲ�_�����������",
--    B.TableNo AS "�_�������"
--FROM Employee E
--LEFT JOIN Bill B ON E.EmployeeID = B.EmployeeID
--ORDER BY E.FullName, B.TableNo;