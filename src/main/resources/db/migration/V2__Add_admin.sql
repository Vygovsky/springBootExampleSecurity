insert into USER (ID, USERNAME, PASSWORD, ACTIVE) values (1, 'admin', 'root', true);
insert into USER_ROLES (USER_ID, ROLES) values (1, 'USER'), (1, 'ADMIN');