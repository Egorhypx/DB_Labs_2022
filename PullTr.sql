USE delivery_DB;

GO

CREATE TRIGGER create_order
ON orders
AFTER INSERT
AS
INSERT INTO logs(user_id,message)
SELECT user_id, 'User created an order' + (SELECT firstname,lastname,mail,phone FROM users WHERE user_id=users.id)
FROM INSERTED

GO

CREATE TRIGGER delete_order
ON orders
AFTER DELETE
AS
INSERT INTO logs(user_id,message)
SELECT user_id, 'Order was cancelled' + (SELECT firstname,lastname,mail,phone FROM users WHERE user_id=users.id)
FROM INSERTED

GO

CREATE TRIGGER meal_price_insert_update
ON meals
AFTER INSERT,UPDATE
AS
UPDATE meals
SET price = price + weight / 200
WHERE id = (SELECT id FROM inserted)

GO

CREATE TRIGGER create_user
ON users
AFTER INSERT
AS
INSERT INTO logs(user_id,message)
SELECT id, 'User was created' + firstname,lastname,mail,phone
FROM INSERTED

GO

CREATE TRIGGER promocode_price_insert_update
ON promocodes
AFTER INSERT,UPDATE
AS
UPDATE promocodes
SET discount = discount * 0.89
WHERE id = (SELECT id FROM inserted)
