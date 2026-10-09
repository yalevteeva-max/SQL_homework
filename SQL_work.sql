 1. Общая сумма завершённых заказов
SELECT SUM(quantity * unit_price) AS total
FROM order_items
WHERE order_id IN (SELECT order_id FROM orders WHERE status = 'completed');

 2. Клиенты с более чем одним заказом
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

 3. Товары с остатком меньше 5
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < 5;

 4. Самый популярный товар
SELECT product_id, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 1;

5. Клиенты за последний месяц
SELECT first_name, last_name, registration_date
FROM customers
WHERE registration_date >= CURRENT_DATE - INTERVAL 1 MONTH;

6. Заказы с суммой больше 10000
SELECT order_id, SUM(quantity * unit_price) AS total
FROM order_items
GROUP BY order_id
HAVING SUM(quantity * unit_price) > 10000;

 7. Категории с наибольшей выручкой
SELECT category, SUM(quantity * unit_price) AS revenue
FROM order_items
JOIN products ON order_items.product_id = products.product_id
GROUP BY category
ORDER BY revenue DESC;