create database if not exists pig_management;
use pig_management;
create table origin(
id int primary key auto_increment,
`name` varchar(255)
);
INSERT INTO origin (`name`) VALUES 
('Trang trại A'),
('Trang trại B'),
('Trang trại C'),
('Trang trại D'),
('Trang trại E');
create table pig(
id int primary key auto_increment,
code_pig varchar(255),
imported_date date,
imported_weight double,
exported_date date,
exported_weight double,
`status` varchar(255),
id_origin int,
foreign key(id_origin) references origin(id)
);
INSERT INTO pig (code_pig, imported_date, imported_weight, exported_date, exported_weight, `status`, id_origin) VALUES 
('PIG001', '2024-03-01', 25.5, '2024-06-10', 100.2, 'Đã xuất', 1),
('PIG002', '2024-03-05', 28.3, '2024-06-15', 105.8, 'Đã xuất', 2),
('PIG003', '2024-03-10', 30.0, NULL, NULL, 'Chưa xuất', 3),
('PIG004', '2024-03-15', 27.8, '2024-07-01', 110.0, 'Đã xuất', 4),
('PIG005', '2024-03-20', 29.5, NULL, NULL, 'Chưa xuất', 5);
select p.id,p.code_pig,p.imported_date,p.imported_weight,p.exported_date,p.exported_weight,o.`name`,p.`status` from pig p left join origin o on p.id_origin= o.id;
delete from pig where id=?;
update pig set code_pig="PIG",imported_date='2024-06-10',imported_weight=274384378327,exported_date='2024-03-01',exported_weight=12111,`status`="aghasgja",id_origin=4 where id=5;

select * from pig where code_pig="PIG001";
select `name` from origin;







