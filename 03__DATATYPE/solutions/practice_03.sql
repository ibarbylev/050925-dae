-- 1. Выведите текущую дату и время:

SELECT NOW() AS CurrentDateTime;


-- 2. Выведите день недели, когда был сделан каждый заказ из таблицы orders:
SELECT * FROM northwind.orders;

SELECT id, DAYNAME(order_date) AS OrderDayOfWeek
FROM northwind.orders;

-- 3. Добавьте 30 дней к дате каждого заказа в таблице orders и выведите результат:

SELECT
    id,
    order_date,
    DATE_ADD(order_date, INTERVAL 30 DAY) AS NewOrderDate
FROM
    northwind.orders;

-- 4. Выведите количество дней между датой заказа и датой доставки для каждого заказа из таблицы orders:

SELECT
    id, DATEDIFF(shipped_date, order_date) AS DaysBetween
FROM
    northwind.orders;

-- 5. Найдите все заказы, сделанные в пятницу из таблицы orders:

SELECT
    id, order_date, DAYNAME(order_date)
FROM
    northwind.orders
WHERE
    DAYOFWEEK(order_date) = 6;  -- пятницу - 6-й день недели

-- 6. Выведите дату, которая будет через 100 дней от текущей:

SELECT DATE_ADD(CURDATE(), INTERVAL 100 DAY) AS FutureDate;

-- 7. Выведите заказы, сделанные в выходные дни (суббота и воскресенье) из таблицы orders:

SELECT
    id, order_date
FROM
    northwind.orders
WHERE
    DAYOFWEEK(order_date) IN (7, 1);  -- 7 — суббота, 1 — воскресенье

-- 8. Найдите количество дней до конца текущего года:

SELECT DATEDIFF('2025-12-31', CURDATE()) AS DaysUntilEndOfYear;

-- 9. Выведите дату, которая была 15 дней назад от текущей даты:

SELECT DATE_SUB(CURDATE(), INTERVAL 15 DAY) AS PastDate;

-- 10. Примените явное преобразование и выведите столбец id из таблицы customers в виде строки:

SELECT
    CAST(id AS CHAR) AS CustomerIdAsString
FROM
    northwind.customers;
