-- 01 Выведите дату получения заказа order_date из таблицы orders В формате ДД-ММ-ГГГГ.

SELECT * FROM northwind.orders;

SELECT
    DATE_FORMAT(order_date, '%d/%m/%Y') AS FormattedOrderDate
FROM
    northwind.orders;


/* 02 Выведите дату и время отправки заказа shipped_date из таблицы orders
В формате ДД/ММ/ГГГГ ЧЧ:ММ:СС. */

SELECT
    DATE_FORMAT(shipped_date, '%d-%m-%Y %H:%i:%s') AS FormattedShippedDate
FROM
    northwind.orders;


/* 03 Найдите разницу в днях между датой заказа order_date
и датой отправки shipped_date для всех заказов в таблице orders.*/

SELECT
    DATEDIFF(shipped_date, order_date) AS DaysToShip
FROM
    northwind.orders;


-- 04 Найдите дату, которая была 90 дней до текущей даты.
SELECT DATE_SUB(CURDATE(), INTERVAL 90 DAY) AS PastDate;


/* 05 Использование скрытых преобразований.
Сложите строку, содержащую дату, с числом и выведите результат.
Объедините числовое значение с текстом и выведите результат в виде строки. */

SELECT NOW() + 0;
SELECT NOW() + 10;

SELECT CONCAT('Он получил ', 5, ' призов');


-- 06 Извлеките год из даты получения заказа order_date.

SELECT
    YEAR(order_date) AS YearOfOrder
FROM
    northwind.orders;



-- 07 Преобразуйте текстовое значение, представляющее дату, в формат DATE.
SELECT CAST('2024-08-25' AS DATE) AS ConvertedDate;

SELECT STR_TO_DATE('11-03-2025', '%d-%m-%Y') AS ConvertedDate;
