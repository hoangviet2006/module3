create database if not exists product_accessory;
use product_accessory;
create table accessory(
	id int primary key auto_increment,
    `name` varchar(50)
);
select accessory.name from accessory;
create table product(
	id int primary key auto_increment,
    `code` varchar(50) unique,
    brand varchar(50),
    model varchar(50),
    price decimal(10,2),
    release_date date,
    description varchar(255),
    id_accessory int,
	foreign key (id_accessory) references accessory(id) ON DELETE SET NULL
);
select product.id,product. `code`,product.brand, product.model,product.price,product.release_date,product.description,accessory.`name` from product left join accessory on product.id_accessory=accessory.id;


create table orders(
id int primary key auto_increment,
user_name varchar(155) not null,
orders_date datetime,
total_price double,
`status` varchar(155)
);
INSERT INTO orders (user_name, orders_date, total_price, `status`) VALUES
('user1', NOW(), 1999.99, 'PENDING'),
('user2', NOW(), 899.50, 'PROCESSING'),
('user3', NOW(), 2499.00, 'COMPLETED'),
('user4', NOW(), 1500.75, 'CANCELED'),
('user5', NOW(), 3200.00, 'PENDING');
select * from orders;

update orders set user_name=?,orders_date=?,total_price=?,status=?;
delete from orders where id=?;
select * from orders where  user_name like ?;
CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('ADMIN', 'USER') default('USER'),
    name varchar(50) not null,
    address varchar(100) not null,
    phone varchar(20)not null
);
drop table product;
drop table accessory;
drop table orders;
INSERT INTO accessory (name) VALUES
('AirPods Pro 2'),  -- Phụ kiện cho iPhone 15 Pro
('Samsung Galaxy Buds 2 Pro'),  -- Phụ kiện cho Galaxy S24 Ultra
('Xiaomi 67W Charger'),  -- Củ sạc nhanh cho Xiaomi 14 Pro
('Google Pixel Stand'),  -- Đế sạc không dây cho Pixel 8 Pro
('OnePlus Warp Charge 100W'),  -- Sạc nhanh cho OnePlus 12
('Apple Magic Mouse'),  -- Chuột không dây cho MacBook Pro M3 Max
('Dell Thunderbolt Dock'),  -- Dock mở rộng cổng kết nối cho Dell XPS 15
('Asus ROG Chakram Mouse'),  -- Chuột gaming cho Asus ROG Zephyrus G14
('HP USB-C Dock G5'),  -- Dock USB-C cho HP Spectre x360
('Lenovo ThinkPad Pen Pro');  -- Bút cảm ứng cho ThinkPad X1 Carbon Gen 11
INSERT INTO product(`code`, brand, model, price, release_date, description,id_accessory) VALUES
('PC-112', 'Apple', 'iPhone 15 Pro', 999.99, '2023-09-22', 'Flagship iPhone với chip A17 Pro và Titanium frame',1),
('PD-113', 'Samsung', 'Galaxy S24 Ultra', 1199.99, '2024-01-17', 'Màn hình 6.8-inch AMOLED, S Pen hỗ trợ AI',2),
('PE-114', 'Xiaomi', 'Xiaomi 14 Pro', 799.99, '2023-10-26', 'Camera Leica 50MP, Snapdragon 8 Gen 3',3),
('PG-115', 'Google', 'Pixel 8 Pro', 899.99, '2023-10-12', 'Android gốc, Google Tensor G3, AI-enhanced camera',4),
('PF-116', 'OnePlus', 'OnePlus 12', 749.99, '2024-01-23', 'Sạc nhanh 100W, màn hình 120Hz AMOLED',5),
('PL-117', 'Apple', 'MacBook Pro M3 Max', 3299.99, '2023-10-30', 'MacBook Pro 16-inch, chip M3 Max, màn hình Liquid Retina XDR',6),
('PV-118', 'Dell', 'XPS 15 9530', 2199.99, '2023-06-15', 'Laptop cao cấp với màn hình OLED 3.5K, Intel Core i9-13900H',7),
('PK-119', 'Asus', 'ROG Zephyrus G14', 1799.99, '2024-02-10', 'Laptop gaming mỏng nhẹ, Ryzen 9 7940HS, RTX 4070',8),
('PB-133', 'HP', 'Spectre x360 14', 1599.99, '2023-09-20', 'Laptop 2-in-1 màn hình OLED, Intel Core i7-13700H',9),
('PX-121', 'Lenovo', 'ThinkPad X1 Carbon Gen 11', 1899.99, '2023-08-25', 'Laptop doanh nhân siêu nhẹ, Intel Core i7-1365U',10);

select * from product;

-- Thêm tài khoản admin
INSERT INTO user (username, password, role, name, address, phone) 
VALUES 
('admin', 'admin123', 'ADMIN', 'Admin User', '123 Admin Street', '0123456789');

-- Thêm 5 tài khoản user
INSERT INTO user (username, password, role, name, address, phone) 
VALUES 
('user1', 'user123', 'USER', 'User One', '456 User Street', '0123456790'),
('user2', 'user123', 'USER', 'User Two', '789 User Avenue', '0123456791'),
('user3', 'user123', 'USER', 'User Three', '101 User Blvd', '0123456792'),
('user4', 'user123', 'USER', 'User Four', '202 User Road', '0123456793'),
('user5', 'user123', 'USER', 'User Five', '303 User Lane', '0123456794');

select id from user where username = "admin";
select *  from user;

select role from user where username = "admin" and password = "admin123";