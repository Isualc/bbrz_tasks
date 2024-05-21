-- A:
SELECT 
    (SELECT COUNT(*) FROM Users) AS total_users,
    (SELECT COUNT(*) FROM Products) AS total_products,
    (SELECT COUNT(*) FROM Orders) AS total_orders,
    (SELECT COUNT(*) FROM Reviews) AS total_reviews;

-- B:   
SELECT 
    p.product_name, 
    SUM(oi.quantity) AS total_quantity_sold
FROM 
    Order_Items oi
JOIN 
    Products p ON oi.product_id = p.product_id
GROUP BY 
    p.product_id
ORDER BY 
    total_quantity_sold DESC
LIMIT 5;

-- C:
SELECT
    u.username,
    SUM(o.total_amount) AS total_spent
FROM
    Orders o
JOIN
    Users u ON o.user_id = u.user_id
GROUP BY
    u.user_id
ORDER BY
    total_spent DESC
LIMIT 5;

-- D:
SELECT
    p.product_name,
    AVG(r.rating) AS avg_rating
FROM
    Reviews r
JOIN
     Products p ON r.product_id = p.product_id
GROUP BY 
    p.product_id;

-- E:
SELECT
    p.product_name,
    AVG(r.rating) AS average_rating
FROM
    Reviews r
JOIN
    Products p ON r.product_id = p.product_id
GROUP BY
    p.product_id
ORDER BY
    average_rating DESC
LIMIT 1;

-- F:
SELECT 
    rating, 
    COUNT(*) AS count
FROM 
    Reviews
GROUP BY 
    rating;

-- G:
SELECT 
    p.product_name, 
    p.price, 
    AVG(r.rating) AS average_rating
FROM 
    Reviews r
JOIN 
    Products p ON r.product_id = p.product_id
GROUP BY 
    p.product_id;

-- H:
SELECT 
    quantity, 
    COUNT(*) AS count
FROM 
    Order_Items
GROUP BY 
    quantity;

