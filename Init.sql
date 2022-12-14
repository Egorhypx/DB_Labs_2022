GO
use	delivery_DB
GO

CREATE TABLE roles
(
	id INT PRIMARY KEY IDENTITY,
	role VARCHAR(20) NOT NULL
)

CREATE TABLE users
(
    id INT PRIMARY KEY IDENTITY,
    firstname VARCHAR(18) NOT NULL, 
    lastname VARCHAR(24) NOT NULL,
	password VARCHAR(24) NOT NULL,
	mail VARCHAR(30) NOT NULL UNIQUE,
	phone VARCHAR(15) NOT NULL UNIQUE,
	role_id INT FOREIGN KEY REFERENCES roles(id)
);

CREATE TABLE logs
(
	id INT PRIMARY KEY IDENTITY,
	message VARCHAR(255) NOT NULL,
	user_id INT NOT NULL FOREIGN KEY REFERENCES users(id)
)

CREATE TABLE adress
(
    id INT PRIMARY KEY IDENTITY,
    city VARCHAR(18) NOT NULL, 
    street VARCHAR(18) NOT NULL,
	building SMALLINT NOT NULL,
	entrance TINYINT NOT NULL,
	floor TINYINT NOT NULL,
	flat TINYINT NOT NULL,
	user_id INT NOT NULL FOREIGN KEY REFERENCES users(id)
);

CREATE TABLE orders
(
    id INT PRIMARY KEY IDENTITY,
	creation_date DATE NOT NULL,
    created_at TIME NOT NULL, 
    desired_at TIME NOT NULL,
	comment VARCHAR(255),
	total_price SMALLMONEY NOT NULL,	
	total_discount SMALLMONEY,
	user_id INT FOREIGN KEY REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE promocodes
(
	id INT PRIMARY KEY IDENTITY,
	code VARCHAR(20) NOT NULL UNIQUE,
	discount SMALLMONEY,
	description VARCHAR(255) NOT NULL,
	valid_from DATE NOT NULL,
	valid_until DATE NOT NULL
);

CREATE TABLE baskets
(
	id INT PRIMARY KEY IDENTITY,
	quantity SMALLINT,
	user_id INT FOREIGN KEY REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE meals
(
	id INT PRIMARY KEY IDENTITY,
	name VARCHAR(28) NOT NULL,
	description VARCHAR(255) NOT NULL,
	ingredients VARCHAR(255) NOT NULL,
	weight SMALLINT NOT NULL,
	price SMALLMONEY NOT NULL
);

CREATE TABLE meal_images
(
	id INT PRIMARY KEY IDENTITY,
	url VARCHAR(155) NOT NULL,
	meal_id INT FOREIGN KEY REFERENCES meals(id) ON DELETE CASCADE
);

CREATE TABLE applied_promocodes
(
	id INT PRIMARY KEY IDENTITY,
	order_id INT FOREIGN KEY REFERENCES orders(id) ON DELETE CASCADE,
	promocode_id INT FOREIGN KEY REFERENCES promocodes(id) ON DELETE CASCADE
);

CREATE TABLE basket_meal
(
	id INT PRIMARY KEY IDENTITY,
	meal_id INT FOREIGN KEY REFERENCES meals(id) ON DELETE CASCADE,
	basket_id INT FOREIGN KEY REFERENCES baskets(id) ON DELETE CASCADE
);

CREATE TABLE order_meal
(
	id INT PRIMARY KEY IDENTITY,
	meal_id INT FOREIGN KEY REFERENCES meals(id) ON DELETE CASCADE,
	order_id INT FOREIGN KEY REFERENCES orders(id) ON DELETE CASCADE
);

