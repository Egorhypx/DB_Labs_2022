# Описание сущностей

## Role (Роль)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | INT | PK |
| role | Роль | VARCHAR(20) | NOT NULL |

## Logs (Логи)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | INT | PK |
| user_id | Внешний ключ на пользователя | INT | FK, NOT NULL |
| message | Сообщение | VARCHAR(255) | NOT NULL |


## User (Пользователь)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | INT | PK |
| role_id| Внешний ключ на роль | INT | FK, NOT NULL |
| password | Пароль пользователя | VARCHAR(24) | NOT NULL |
| firstname | Имя | VARCHAR(18) | NOT NULL |
| lastname | Фамилия | VARCHAR(24) | NOT NULL |
| mail | Электронная почта | VARCHAR(30) | NOT NULL |
| phone | Номер телефона | VARCHAR(15) | NOT NULL, UNIQUE |

## Address (Адрес)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | INT | PK |
| user_id | Внешний ключ на пользователя | INT | FK, NOT NULL |
| city | Город | VARCHAR(18) | NOT NULL |
| street | Улица | VARCHAR(18) | NOT NULL |
| building | Номер дома | SMALLINT | NOT NULL |
| entrance | Подъезд | TINYINT | NOT NULL |
| floor | Этаж | TINYINT | NOT NULL |
| flat | Номер квартиры | TINYINT | NOT NULL |

## Order (Заказ)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | INT | PK |
| user_id | Внешний ключ на пользователя | INT | FK, NOT NULL |
| creation_date | Дата создания заказа | DATE | NOT NULL |
| created_time | Время создания заказа | TIME | NOT NULL |
| desired_time | Желанное время доставки заказа | TIME |  |
| comment | Комментарий | VARCHAR(255) | |
| total_price | Полная цена заказа | SMALLMONEY | NOT NULL |
| total_discount | Полная скидка | SMALLMONEY |  |

## Promocode (Промокод)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | INT | PK |
| code | Код | VARCHAR(20) | NOT NULL |
| discount | Скидка | SMALLMONEY | NOT NULL |
| description | Описание | VARCHAR(255) | NOT NULL |
| valid_from | Дата начала действия | DATE | NOT NULL |
| valid_until | Дата конца действия | DATE | NOT NULL |

## Basket (Корзина)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| user_id | Внешний ключ на пользователя | NUMBER  | FK, NOT NULL |
| quantity | Количество | SMALLINT | NOT NULL |

## Meal (Блюдо)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | INT | PK |
| name | Название блюда | VARCHAR(28) | NOT NULL |
| description | Описание | VARCHAR(255) | NOT NULL |
| ingredients | Ингредиенты | VARCHAR(255) | NOT NULL |
| weight | Вес | SMALLINT| NOT NULL |
| price | Цена | SMALLMONEY | NOT NULL |

## MealImage (Изображение блюда)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| meal_id | Внешний ключ на блюдо | NUMBER  | FK, NOT NULL |
| url | Ссылка на изображение | VARCHAR(155) | NOT NULL |

## OrderMeal
### Вспомогательная таблица связи корзин и блюд

| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER  | PK |
| meal_id | Внешний ключ на блюдо | NUMBER | FK, NOT NULL |
| order_id | Внешний ключ на заказ | NUMBER  | FK, NOT NULL |

## MealBasket
### Вспомогательная таблица связи корзин и блюд

| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER  | PK |
| meal_id | Внешний ключ на блюдо | NUMBER | FK, NOT NULL |
| basket_id | Внешний ключ на корзину | NUMBER  | FK, NOT NULL |

## AppliedPromocode
### Вспомогательная таблица для связи промокодов с заказами

| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER  | PK |
| order_id | Внешний ключ на заказ | NUMBER  | FK, NOT NULL |
| promocode_id | Внешний ключ на промокод | NUMBER  | FK, NOT NULL |