-- 01 Выведите Ваш возраст на текущий день в секундах

SELECT TIMESTAMPDIFF(SECOND, DATE_SUB(CURDATE(), INTERVAL 57 YEAR), NOW()) AS MyAgeInSeconds;


-- 02 Выведите какая дата будет через 51 день

SELECT DATE_ADD(CURDATE(), INTERVAL 51 DAY) AS FutureDate;


-- 03 Отформатируйте предыдущей запрос - выведите день недели для этой даты Используйте документацию My SQL

SELECT DAYNAME(DATE_ADD(CURDATE(), INTERVAL 51 DAY)) AS DayOfWeek;



/* 04 Подключитесь к базе данных northwind
Выведите столбец с исходной датой создания транзакции transaction_created_date из таблицы inventory_transactions,
а также столбец полученный прибавлением 3 часов к этой дате */

SELECT
	transaction_created_date,
	DATE_ADD(transaction_created_date, INTERVAL 3 HOUR) AS new_transaction_created_date
 FROM northwind.inventory_transactions;


 /* 05 Выведите столбец с текстом  'Клиент с id <customer_id> сделал заказ <order_date>' из таблицы orders
Запрос написать двумя способами
	- с использованием неявных преобразований
    - а также с указанием изменения типа данных для столбца customer_id
Внимание В MySQL функция CAST не принимает VARCHAR в качестве параметра для длины.
Вместо этого, нужно использовать CHAR для указания длины. */


SELECT
	CONCAT('Клиент с id <', customer_id, '> сделал заказ <', order_date, '>') AS MyText
FROM
	northwind.orders;

SELECT
	CONCAT('Клиент с id <',
			CAST(customer_id AS CHAR),
            '> сделал заказ <',
			CAST(order_date AS CHAR),
            '>') AS MyText
FROM
	northwind.orders;