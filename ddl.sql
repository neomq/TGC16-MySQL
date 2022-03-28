-- create new database
create database swimming_school;

-- to switch database
use swimming_school;

-- check current selected database
select DATABASE();


-- create table
-- <name of column> <data type> <options>
create table parents(
    parent_id int unsigned auto_increment primary key,
    first_name varchar(200) not null,
    last_name varchar(200) default ''
) engine = innodb;
-- `engine = innodb` is for FK to work

-- show all tables
show tables;