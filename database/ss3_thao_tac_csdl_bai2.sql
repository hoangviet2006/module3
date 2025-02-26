create database if not exists thao_tac_csdl_bai2;
use thao_tac_csdl_bai2;
create table customer(
cId int primary key,
cName varchar(50),
cAge int
);
insert into customer(cId,cName,Cage) value(1,"Minh Quan",10);
insert into customer(cId,cName,Cage) value(2,"Ngoc Oanh",20);
insert into customer(cId,cName,Cage) value(3,"Hong Ha",50);
create table `order`(
oId int primary key,
cId int,
oDate date,
oTotalprice double,
foreign key(cId) references customer(cId)
);
insert into `order`(oId,cId,oDate,oTotalprice) value(1,1,"2006-03-21",null);
insert into `order`(oId,cId,oDate,oTotalprice) value(2,2,"2006-03-23",null);
insert into `order`(oId,cId,oDate,oTotalprice) value(3,1,"2006-03-16",null);
select cId, count(*) as so_lan_order from`order` group by cId;
create table product(
pId int primary key,
pName varchar(50),
pPrice double
);
insert into product(pId,pName,pPrice) value(1,'Máy Giặt',3);
insert into product(pId,pName,pPrice) value(2,'Tủ Lạnh',5);
insert into product(pId,pName,pPrice) value(3,'Điều Hòa',7);
insert into product(pId,pName,pPrice) value(4,'Quạt',1);
insert into product(pId,pName,pPrice) value(5,'Bếp Điện',2);
create table orderdetail(
oId int ,
pId int,
odQty int,
primary key(oId,pId),
foreign key(oId) references `order`(oID),
foreign key(pId) references product(pID)
);
insert into orderdetail(oId,pId,odQty) value(1,1,3);
insert into orderdetail(oId,pId,odQty) value(1,3,7);
insert into orderdetail(oId,pId,odQty) value(1,4,2);
insert into orderdetail(oId,pId,odQty) value(2,1,1);
insert into orderdetail(oId,pId,odQty) value(3,1,8);
insert into orderdetail(oId,pId,odQty) value(2,5,4);
insert into orderdetail(oId,pId,odQty) value(2,3,3);

select oId,oDate,oTotalprice from `order`;
select *from customer;
select *from product;
drop table `order`;
drop table customer;


