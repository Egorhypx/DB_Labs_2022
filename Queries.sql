USE delivery_DB;

SELECT * FROM users

SELECT id,
firstname,
lastname,
password,
mail,
phone,
(SELECT role FROM roles WHERE roles.id=users.role_id) as role
FROM users
WHERE role_id=2

SELECT mail,password FROM users
WHERE CHARINDEX('@gmail.com',mail)>0

UPDATE users
SET mail='alex@gmail.com'
WHERE id=3

SELECT * FROM orders
ORDER BY desired_at

SELECT * FROM meals 
ORDER BY weight 

SELECT * FROM meals 
ORDER BY price DESC

SELECT * FROM orders
WHERE total_price>21.99 AND total_discount<21.99

SELECT name,
(price*weight) AS sum_for_gr
FROM meals
ORDER BY sum_for_gr

SELECT (SELECT mail FROM users WHERE users.id=orders.user_id) AS user_mail,
comment
FROM orders

SELECT * FROM meal_images

SELECT * FROM meal_images
WHERE url NOT LIKE '%.png'

SELECT firstname FROM users
WHERE lastname = 'Kononov'

SELECT * FROM meals
WHERE price = (SELECT MIN(price) FROM meals)

INSERT INTO meals(name, description, ingredients, weight, price) VALUES
(
	'Fiesta',
	'A good choice to try something new',
	'cowberry sauce, ranch sauce, chicken, mozzarella cheese, spinach, pear',
	500,
	15.99
)

INSERT INTO meal_images(meal_id,url) VALUES(9,'https:///img/gallery/fiesta.jpeg')

SELECT name,price FROM meals
WHERE price < (SELECT AVG(price) FROM meals)

SELECT id,phone,mail
FROM users
WHERE EXISTS (SELECT * FROM orders WHERE orders.user_id = users.id)
ORDER BY id

INSERT INTO users(firstname, lastname, password, mail, phone, role_id) VALUES
(
	'Alex',
	'Kononov',
	'alex123',
	'askalex.23@mail.ru',
	'445175445',
	1
)

SELECT firstname,lastname,mail,
(SELECT role FROM roles WHERE roles.id=users.role_id) AS role_name
FROM users
WHERE id IN (SELECT user_id FROM orders)

SELECT firstname, phone, mail FROM users
WHERE phone NOT LIKE '44%'