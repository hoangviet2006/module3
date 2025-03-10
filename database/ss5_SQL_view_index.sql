create database if not exists ss5_bai_tap_demo;
use ss5_bai_tap_demo;
create table product(
id int primary key auto_increment,
`code` varchar(15),
`name` varchar(50),
price double,
amount int,
`description` varchar(255),
`status` varchar(50)
);
INSERT INTO product (`code`, `name`, price, amount, `description`, `status`)
VALUES ('P001', 'Laptop Dell XPS 15', 2000.00, 10, 'Laptop cao cấp', 'Còn hàng');

INSERT INTO product (`code`, `name`, price, amount, `description`, `status`)
VALUES ('P002', 'iPhone 14 Pro', 1200.00, 15, 'Điện thoại Apple', 'Còn hàng');

INSERT INTO product (`code`, `name`, price, amount, `description`, `status`)
VALUES ('P003', 'Samsung S23', 1100.00, 0, 'Điện thoại Samsung', 'Hết hàng');

INSERT INTO product (`code`, `name`, price, amount, `description`, `status`)
VALUES ('P004', 'MacBook Air M2', 1300.00, 8, 'Laptop mỏng nhẹ', 'Còn hàng');

INSERT INTO product (`code`, `name`, price, amount, `description`, `status`)
VALUES ('P005', 'MacBook Pro M2', 1500.00, 5, 'Laptop hiệu năng cao', 'Còn hàng');

INSERT INTO product (`code`, `name`, price, amount, `description`, `status`)
VALUES ('P006', 'Dell XPS 13', 1200.00, 7, 'Laptop mỏng nhẹ, pin trâu', 'Còn hàng');

INSERT INTO product (`code`, `name`, price, amount, `description`, `status`)
VALUES ('P007', 'Asus ROG Strix', 2000.00, 10, 'Laptop gaming mạnh mẽ', 'Còn hàng');

INSERT INTO product (`code`, `name`, price, amount, `description`, `status`)
VALUES ('P008', 'HP Spectre x360', 1400.00, 6, 'Laptop 2 trong 1, cảm ứng', 'Còn hàng');

INSERT INTO product (`code`, `name`, price, amount, `description`, `status`)
VALUES ('P009', 'Lenovo ThinkPad X1 Carbon', 1600.00, 4, 'Laptop doanh nhân bền bỉ', 'Còn hàng');

INSERT INTO product (`code`, `name`, price, amount, `description`, `status`)
VALUES ('P010', 'Acer Swift 5', 1000.00, 9, 'Laptop nhẹ nhất phân khúc', 'Còn hàng');

INSERT INTO product (`code`, `name`, price, amount, `description`, `status`)
VALUES ('P011', 'MSI Prestige 14', 1300.00, 8, 'Laptop dành cho thiết kế', 'Còn hàng');

INSERT INTO product (`code`, `name`, price, amount, `description`, `status`)
VALUES ('P012', 'Razer Blade 15', 2500.00, 3, 'Laptop gaming cao cấp', 'Còn hàng');


select*from product;
drop table product;
create unique index i_product_code on product(`code`);
create  index i_product_name_price on product(`name`,price);
explain select *from product where price<100;
create view w_Product as select id, `code`,`name`,price,`status` from product ;
select * from w_Product;
update w_Product set `name`='SamSung S30' where `name`='Samsung S23';
update w_Product set `name`='SamSung S50000 ' where `name`='iPhone 14 Pro';

drop view w_Product;

delimiter //
create procedure get_product() 
begin 
select * from product;
end //
delimiter ;	
call get_Product();




