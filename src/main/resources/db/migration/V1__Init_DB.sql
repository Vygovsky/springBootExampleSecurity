create sequence hibernate_sequence
  start with 1
  increment by 1;

create table message (
  id       bigint generated by default as identity,
  filename varchar(255),
  tag      varchar(255),
  text     varchar(1000) not null ,
  user_id  bigint,
  primary key (id)
);

create table user (
  id              int8         not null,
  activation_code varchar(255),
  active          boolean      not null,
  email           varchar(255),
  password        varchar(255) not null,
  username        varchar(255) not null,
  primary key (id)
);

create table user_roles (
  user_id int8 not null,
  roles   varchar(255)
);
alter table message
  add constraint message_user_fk foreign key (user_id)
references user;
alter table user_roles
  add constraint user_role_fk foreign key (user_id)
references user;

/*
create sequence hibernate_sequence
  start with  1
  increment by 1;

create table message (
  id       bigint generated by default as identity,
  filename varchar(255),
  tag      varchar(255),
  text     varchar(255) not null ,
  user_id  bigint,
  primary key (id)
);
create table user (
  id              bigint  not null,
  activation_code varchar(255),
  active          boolean not null,
  email           varchar(255),
  password        varchar(255) not null ,
  username        varchar(255) not null ,
  primary key (id)
);
create table user_roles (
  user_id bigint not null,
  roles   varchar(255)
);
alter table message
  add constraint message_user_fk foreign key (user_id) references user;
alter table user_roles
  add constraint user_role_fk foreign key (user_id) references user*/