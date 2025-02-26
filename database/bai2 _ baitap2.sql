create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
cId int primary key,
cName varchar(50),
cAge int
);
create table `order`(
oId int primary key,
cId int,
oDate date,
oTotalprice double,
foreign key(cId) references customer(cId)
);
create table product(
pId int primary key,
pName varchar(50),
pPrice double
);
create table orderdetail(
oId int ,
pId int,
odQty int,
primary key(oId,pId),
foreign key(oId) references `order`(oID),
foreign key(pId) references product(pID)
)