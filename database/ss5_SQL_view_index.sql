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
VALUES ('P005', 'MacBook Air M2', 1300.00, 8, 'Laptop mỏng nhẹ', 'Còn hàng');
select*from product;
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
