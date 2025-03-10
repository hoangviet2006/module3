create database if not exists mvc_2sp;
use mvc_2sp;
create table Product(
id int primary key auto_increment,
`name` varchar(155),
`price` double
);
insert into Product (`name`, `price`) value("Máy Tính",30000);
insert into Product (`name`, `price`) value("Điện Thoại",30000);
insert into Product (`name`, `price`) value("Đồng Hồ",30000);
insert into Product (`name`, `price`) value("Tivi",30000);
select * from Product;
drop table Product;
create table details(
product_id int,
information varchar(155),
foreign key (product_id) references Product(id)
);
INSERT INTO details (product_id, information) VALUES (1, 'Laptop cao cấp');
INSERT INTO details (product_id, information) VALUES (2, 'Smartphone 5G');
INSERT INTO details (product_id, information) VALUES (3, 'Đồng hồ thông minh');
INSERT INTO details (product_id, information) VALUES (4, 'Smart TV 4K');
select * from Product;
drop table  details;
select Product.id,Product.`name`,Product.`price`,details.information from Product
left join details on product.id= details.product_id;


