use delivery_DB;

SELECT users.firstname,users.lastname,users.mail,users.phone,total_price,created_at,desired_at,roles.role AS role FROM orders
LEFT JOIN users ON orders.user_id = users.id
LEFT JOIN roles ON users.role_id=roles.id
WHERE total_price > (SELECT AVG(total_price) FROM orders)

SELECT firstname,lastname,mail,COUNT(*) AS orders_count FROM orders
LEFT JOIN users ON orders.user_id=users.id
GROUP BY mail
HAVING COUNT(*)>1

SELECT meals.name AS Name FROM meals
UNION SELECT code FROM promocodes

SELECT meals.name AS meal,meal_images.url FROM meals
CROSS JOIN meal_images

SELECT users.firstname,users.lastname,adress.city,adress.street,adress.building,roles.role,baskets.quantity
FROM users
JOIN adress ON adress.user_id = users.id
JOIN roles ON roles.id = users.role_id
JOIN baskets ON baskets.user_id = users.id
WHERE roles.role LIKE 'customer'

SELECT orders.creation_date,orders.created_at,orders.desired_at,users.firstname,users.mail,meals.name
FROM orders
JOIN users ON users.id=orders.user_id
JOIN order_meal ON order_meal.order_id=orders.id
JOIN meals ON order_meal.meal_id=meals.id

SELECT meals.name
FROM order_meal
JOIN meals ON meals.id = order_meal.meal_id

SELECT mail, COUNT(orders.id) as orders_count
FROM users
JOIN orders
ON orders.user_id = users.id
GROUP BY users.id, users.mail

SELECT baskets.quantity,users.firstname,users.mail
FROM baskets
INNER JOIN users ON baskets.user_id = users.id

SELECT id,name,"Price gradation"=
CASE
WHEN price < 15 THEN 'Cheap'
WHEN price >= 15 and price < 22 THEN 'Mid'
ELSE 'Expensive'
END
FROM meals

SELECT promocodes.code, promocodes.description
FROM applied_promocodes
JOIN promocodes ON promocodes.id = applied_promocodes.promocode_id

SELECT orders.creation_date,orders.created_at,orders.created_at,users.firstname,users.lastname,promocodes.description
FROM orders
JOIN users ON users.id=orders.user_id
JOIN applied_promocodes ON applied_promocodes.order_id=orders.id
JOIN promocodes ON applied_promocodes.promocode_id=promocodes.id

SELECT id,name,"Size"=
CASE
WHEN weight < 600 THEN 'Small'
WHEN price >= 600 and price < 800 THEN 'Mediocre'
ELSE 'Big'
END
FROM meals

SELECT logs.message,users.firstname,users.lastname,users.mail,roles.role AS role,meals.name,
meals.price,meal_images.url
FROM logs
JOIN users ON logs.user_id = users.id
RIGHT JOIN roles ON users.role_id = roles.id
LEFT JOIN order_meal ON (SELECT user_id FROM orders WHERE order_meal.order_id = orders.user_id) = users.id
LEFT JOIN meals ON order_meal.meal_id = meals.id
LEFT JOIN meal_images ON meal_images.meal_id = meals.id
WHERE roles.id = 2