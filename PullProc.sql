use delivery_DB

GO

CREATE PROCEDURE add_user
(
	@firstname VARCHAR(18),
	@lastname VARCHAR(24),
	@password VARCHAR(24),
	@mail VARCHAR(30),
	@phone VARCHAR(13),
	@role VARCHAR(50)
)
AS
BEGIN
	INSERT INTO users(firstname,lastname,password,mail,phone,role_id)
	VALUES (@firstname,@lastname,@password,@mail,@phone,(SELECT id FROM roles WHERE role = @role))
END;

GO

CREATE PROCEDURE meals_summary AS
BEGIN
SELECT name,description,ingredients,weight,price,
(SELECT url FROM meal_images WHERE meal_id = meals.id) AS image_url
FROM meals
END;

GO

CREATE PROCEDURE users_summary AS
BEGIN
SELECT firstname,lastname,password,mail,phone,
(SELECT role FROM roles WHERE role_id = roles.id) AS role
FROM users
END;

GO

CREATE PROCEDURE add_role
(
	@role VARCHAR(20)
)
AS
BEGIN
	INSERT INTO roles(role)
	VALUES (@role)
END;

GO

CREATE PROCEDURE delete_role
(
	@role VARCHAR(150)
)
AS
BEGIN
	DELETE roles
	WHERE role = @role
END;

GO

CREATE PROCEDURE add_meal
(
	@name VARCHAR(28),
	@description VARCHAR(255),
	@ingredients VARCHAR(255),
	@weight SMALLINT,
	@price SMALLMONEY
)
AS
BEGIN
	INSERT INTO meals(name,description,ingredients,weight,price)
	VALUES (@name,@description,@ingredients,@weight,@price)
END;

GO

CREATE PROCEDURE delete_meal
(
	@name VARCHAR(28)
)
AS
BEGIN
	DELETE meals
	WHERE price>100 AND weight>1500 AND name=@name
END;

GO

CREATE PROCEDURE show_orders AS
BEGIN
	SELECT creation_date,created_at,desired_at,comment,total_price,total_discount,users.firstname
	FROM orders
	JOIN users ON orders.user_id = users.id
END;

GO

CREATE PROCEDURE add_promocode
(
	@code VARCHAR(20),
	@discount SMALLMONEY,
	@description VARCHAR(255),
	@valid_from DATE,
	@valid_until DATE
)
AS
BEGIN
	INSERT INTO promocodes(code,discount,description,valid_from,valid_until)
	VALUES (@code,@discount,@description,@valid_from,@valid_until)
END;

GO

CREATE PROCEDURE delete_promocode
AS
BEGIN
	DELETE promocodes
	WHERE valid_from<2022-01-01 AND valid_until<2022-01-02
END;

GO

CREATE PROCEDURE show_logs
AS
BEGIN
	SELECT user_id,message,users.firstname,users.lastname,roles.role
	FROM logs
	JOIN users ON logs.user_id = users.id
	JOIN roles ON roles.id = users.role_id
	WHERE users.role_id = 1
END;