create database if not exists bai_1c1124_g1;
use bai_1c1124_g1;
create table `class`(
ma_lop int primary key,
ten_lop varchar(20)
);
create table student(
id int primary key,
ten varchar(30),
tuoi int,
ma_lop int,
foreign key (ma_lop) references `class`(ma_lop)
);