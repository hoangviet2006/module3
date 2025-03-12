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
INSERT INTO category (name) VALUES
('Điện thoại'),
('Laptop'),
('Phụ kiện');
INSERT INTO product (name, price, description, id_category, quantity) VALUES
('iPhone 15 Pro Max', 32990000, 'Điện thoại Apple iPhone 15 Pro Max 256GB', 1, 10),
('Samsung Galaxy S23 Ultra', 27990000, 'Điện thoại Samsung S23 Ultra 512GB', 1, 15),
('MacBook Air M2', 27990000, 'Laptop Apple MacBook Air M2 13 inch', 2, 5),
('Dell XPS 13', 32990000, 'Laptop Dell XPS 13 OLED 2023', 2, 8),
('iPad Pro M2', 28990000, 'Máy tính bảng Apple iPad Pro 12.9 inch M2', 3, 7);
INSERT INTO user (username, password, role, name, phone_number, address) VALUES
('admin', 'admin123', 'admin', 'Nguyễn Văn A', '0987654321', 'Hà Nội'),
('user1', 'user123', 'user', 'Trần Thị B', '0912345678', 'TP Hồ Chí Minh'),
('user2', 'user456', 'user', 'Lê Văn C', '0909876543', 'Đà Nẵng');
INSERT INTO order_user (date, status, id_user) VALUES
('2025-03-11 10:00:00', 'pending', 1),
('2025-03-10 15:30:00', 'pending', 2),
('2025-03-09 09:20:00', 'pending', 3);
INSERT INTO order_detail (id_product, id_order_user, quantity) VALUES
(1, 1, 1),  -- User 2 đặt iPhone 15 Pro Max
(3, 1, 1),  -- User 2 đặt MacBook Air M2
(2, 2, 1);  -- User 3 đặt Samsung Galaxy S23 Ultra
select user.id,user.username,user.phone_number,user.address,order_user.`date`,order_user.`status` from user left join order_user on user.id=order_user.id_user where status="pending";
update order_user set status =? where id=?;

SELECT * FROM order_user WHERE id = 2;

