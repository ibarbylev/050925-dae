/* 01 Выведите информацию о каждом заказе, включая идентификатор заказа OrderID,
расчетную полную стоимость заказа после применения скидки NetPrice. */

SELECT * FROM northwind.order_details;

SELECT
    order_id,
    unit_price * quantity * (1 - discount) AS NetPrice
FROM
    northwind.order_details;


/* 02 Выведите полный адрес каждого клиента,
объединяя адрес address, город city и страну country в одну строку. */


SELECT * FROM northwind.customers;

SELECT
	concat(first_name, ' ', last_name) AS Customer,
    concat_ws(', ', address, city, country_region) AS FullAddress
FROM
	northwind.customers;


/* 03 Выведите информацию о каждом сотруднике, включая
 - идентификатор сотрудника employeeID,
  - имя first_name,
  - фамилию last_name
  - и роль role, где роль определяется на основе значения поля is_manager (если значение 1, то "Manager", иначе "Employee"). */


SELECT * FROM northwind.employees;

SELECT
	id, first_name, last_name, is_manager,
    IF(is_manager, 'Manager', 'Employee') AS role
FROM
	northwind.employees;


/* 04 Ситуация:
У вас есть числовые данные, которые хранятся в текстовом формате.
(Например, количество товаров на складе unit_in_stock)
	Проблема:
Вы хотите рассчитать общую стоимость товаров на складе: unit_in_stock * list_price .
Если количество товаров хранится как текст, вы не сможете сделать расчет. */

SELECT * FROM northwind.products;

SELECT
    product_name,
    CAST(unit_in_stock AS SIGNED) * list_price AS TotalValue
FROM
    northwind.products;


/* 05 Создать отчет, который показывает количество и цену продуктов в текстовом формате,
чтобы представить информацию в более понятном виде для конечных пользователей.

Количество unit_in_stock и цена list_price хранятся в числовом формате, но для отчетов
вы хотите объединить эти данные в строку, которая будет легко читаться.

Например, вот так:
'Northwind Traders Chai'              'Available: 100 units, Price: $18.0000'*/

SELECT
    product_name,
    CONCAT('Available: ',
            CAST(unit_in_stock AS CHAR),
            ' units, Price: $',
            CAST(list_price AS CHAR)) AS ProductReport
FROM
    northwind.products;

-- помня о неявном преобразовании типов, можно существенно упростить этот запрос:
SELECT
    product_name,
    CONCAT('Available: ',
            unit_in_stock,
            ' units, Price: $',
            list_price) AS ProductReport
FROM
    northwind.products;



