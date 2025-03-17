create database if not exists product;
use product;
create table category(
	id int primary key auto_increment,
    `name` varchar(255)
);
create table product(
	id int primary key auto_increment,
    `name` varchar(255),
    price double,
    `description` varchar(255),
    id_category int,
    quantity int,
     image_Url varchar(255),
    foreign key(id_category) references category(id)
);
create table user(
	id int primary key auto_increment,
    username varchar(255),
    `password` varchar(255),
    `role` varchar(255) default 'user',
    `name` varchar(255),
	phone_number varchar(255),
    address varchar(255)
);
create table order_user(
	id int primary key auto_increment,
    `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `status` varchar(255) default 'pending',
    id_user int,
	foreign key(id_user) references user(id)
);
create table order_detail(
	id_product int,
    id_order_user int,
    quantity int,
    primary key(id_product,id_order_user),
    foreign key(id_product) references product(id) ON DELETE CASCADE,
    foreign key(id_order_user) references order_user(id) ON DELETE CASCADE
);
INSERT INTO category (`name`) VALUES
('Điện thoại'),
('Laptop'),
('Máy tính bảng'),
('Phụ kiện'),
('Thiết bị âm thanh'),
('Màn hình'),
('Đồng hồ thông minh'),
('Máy ảnh'),
('Gaming Gear'),
('Thiết bị lưu trữ');
-- Thêm dữ liệu vào bảng product
INSERT INTO product (`name`, price, `description`, id_category, quantity, image_Url) VALUES
('iPhone 14', 24990000, 'Điện thoại Apple iPhone 14', 1, 50, 'https://cdn.kalvo.com/uploads/img/large/58767-apple-iphone-14-pro-max.jpg'),
('Samsung Galaxy S23', 21990000, 'Điện thoại Samsung Galaxy S23', 1, 40, 'https://samcenter.vn/images/thumbs/0003731_galaxy-s23-256gb_550.jpeg'),
('iPad Pro M2', 28990000, 'Máy tính bảng iPad Pro M2', 3, 30, 'https://bvtmobile.com/uploads/source/ipad-pro-m2/ipad-pro-m2-2022-xam-wifi.jpg'),
('MacBook Air M2', 32990000, 'Laptop MacBook Air M2', 2, 25, 'https://product.hstatic.net/200000785683/product/mba15-silver-gallery1-202306_4caf01f4b98a4c518fccffab6d8dab5c_master.jpeg'),
('Dell XPS 15', 39990000, 'Laptop Dell XPS 15', 2, 20, 'https://no1computer.vn/images/products/2022/11/18/large/dell-xps-15-9520-do-hoa_1668746628.jpg'),
('Tai nghe Sony WH-1000XM4', 7990000, 'Tai nghe chống ồn Sony WH-1000XM4', 5, 60, 'https://logico.com.vn/images/products/2022/01/27/original/tai-nghe-khong-day-hi-res-chong-on-sony-wh-1000xm4-1_1643275089.png'),
('Màn hình LG UltraGear 27', 10990000, 'Màn hình gaming LG UltraGear', 6, 15, 'https://hanoicomputercdn.com/media/product/84634_man_hinh_lg_ultragear_27gs60f_b_2.jpg'),
('Apple Watch Series 8', 12990000, 'Đồng hồ thông minh Apple Watch Series 8', 7, 35, 'https://cdsassets.apple.com/live/SZLF0YNV/images/sp/111848_apple-watch-series8.png'),
('Chuột Logitech G Pro X', 2990000, 'Chuột gaming Logitech G Pro X', 9, 45, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/_/1_345_2.jpg'),
('SSD Samsung 980 Pro 1TB', 3990000, 'Ổ cứng SSD NVMe Samsung 980 Pro 1TB', 10, 55, 'https://product.hstatic.net/200000079075/product/17066-samsung-980-pro-1tb-1_686a920d16be40de90c9d2918745bb41_master.jpg');
-- Thêm dữ liệu vào bảng user
INSERT INTO user (username, password, role, name, phone_number, address) VALUES
('admin01', 'password123', 'admin', 'Nguyễn Văn An', '0987654321', 'Hà Nội'),
('user01', 'password123', 'user', 'Trần Thị Vân', '0971234567', 'TP. Hồ Chí Minh'),
('user02', 'password123', 'user', 'Lê Văn Công', '0962345678', 'Đà Nẵng'),
('user03', 'password123', 'user', 'Hoàng Minh Dương', '0953456789', 'Hải Phòng'),
('user04', 'password123', 'user', 'Phạm Ngọc Anh', '0944567890', 'Cần Thơ'),
('user05', 'password123', 'user', 'Đặng Thùy Dung', '0935678901', 'Bình Dương'),
('user06', 'password123', 'user', 'Vũ Thanh Giang', '0926789012', 'Đồng Nai'),
('user07', 'password123', 'user', 'Ngô Quang Hưng', '0917890123', 'Huế'),
('user08', 'password123', 'user', 'Bùi Văn Lưu', '0908901234', 'Nha Trang'),
('user09', 'password123', 'user', 'Trịnh Hồng Đạt', '0899012345', 'Quảng Ninh');
-- Thêm dữ liệu vào bảng order_user
INSERT INTO order_user (id_user, `status`) VALUES
(2, 'pending'),
(3, 'pending'),
(4, 'pending'),
(5, 'pending'),
(6, 'pending'),
(7, 'pending'),
(8, 'pending'),
(9, 'pending'),
(10, 'pending'),
(2, 'pending');
-- Thêm dữ liệu vào bảng order_detail
INSERT INTO order_detail (id_product, id_order_user, quantity) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 3, 1),
(5, 4, 1),
(6, 5, 3),
(7, 6, 2),
(8, 7, 1),
(9, 8, 1),
(10, 9, 2);


select  
order_user.id AS order_id,
user.id as user_id ,
user.username,
user.phone_number,
user.address,
order_user.`date`,
product.`name`,
order_detail.quantity,
sum(product.price*order_detail.quantity) as tong_tien,
order_user.`status`
from 
 user  left join order_user on user.id=order_user.id_user
 left join  order_detail  ON order_user.id = order_detail.id_order_user
 left join product  ON order_detail.id_product = product.id 
 where status!='' 
 group by order_user.id,  user.id ,user.`name`,user.phone_number,user.address,order_user.`date`, product.`name`,
 order_detail.quantity,order_user.`status` 
 order by order_user.`date`
;
select
 ou.id AS order_id,u.id as user_id ,u.`name`,u.phone_number,u.address,ou.`date`, 
 group_concat(p.`name`) as name_product,sum(p.price*od.quantity) as tong_tien, ou.`status`
 from user u
 left join order_user ou on u.id=ou.id_user
 left join  order_detail od ON ou.id = od.id_order_user 
 left join product p ON od.id_product = p.id  
 where ou.status!='' 
 group by ou.id order by ou.id;

 select od.id_product, od.id_order_user, ou.`date`, p.`name`as product_name , od.quantity ,  p.price, p.`description` ,  ou.`status` from user u left join order_user ou on u.id=ou.id_user left join  order_detail od ON ou.id = od.id_order_user  left join product p ON od.id_product = p.id   where ou.id=1
