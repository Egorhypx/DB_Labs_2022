USE delivery_DB

EXEC add_user 'firstname','lastname','653421','collmail@mail.ru','299292933','admin'

EXEC meals_summary

EXEC users_summary

EXEC add_role 'moderator'

EXEC delete_role 'moderator'

EXEC add_meal 'noname','empty','empty',2000,150

EXEC delete_meal 'noname'

EXEC show_orders

EXEC add_promocode 'AAAA-AAAA-AAAA',0.0,'empty','2000-12-12','2000-12-12'

EXEC add_promocode 'BBBB-BBBB-BBBB',0.0,'empty','2002-12-12','2002-12-12'

EXEC delete_promocode

EXEC show_logs