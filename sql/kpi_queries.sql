-- KPIs

-- % of successful payments
SELECT 
    COUNT(CASE WHEN payment_status = 'success' THEN 1 END) * 100.0 / COUNT(*) AS success_rate
FROM payments;

SELECT 
    u.city,
    COUNT(o.order_id) AS total_orders
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.city
ORDER BY total_orders DESC;

-- Dashboards:

-- Top 3 most sold products
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'delivered'
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 3;

-- Category generating highest revenue
SELECT 
    p.category,
    SUM(p.price * oi.quantity) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'delivered'
GROUP BY p.category
ORDER BY revenue DESC;

-- Revenue per day
SELECT 
    order_date,
    SUM(total_amount) AS daily_revenue
FROM orders
WHERE status = 'delivered'
GROUP BY order_date
ORDER BY order_date;

-- Highest spending users
SELECT 
    u.name,
    SUM(o.total_amount) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
WHERE o.status = 'delivered'
GROUP BY u.name
ORDER BY total_spent DESC;

-- Which payment methods are used most
SELECT 
    payment_method,
    COUNT(*) AS usage_count
FROM payments
GROUP BY payment_method
ORDER BY usage_count DESC;

-- pending orders
SELECT * FROM orders WHERE status = 'placed';