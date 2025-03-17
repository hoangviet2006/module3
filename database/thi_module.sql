create database if not exists thi_module;
use thi_module;

create table pay(
id int primary key auto_increment,
`name` varchar(255)
);
INSERT INTO pay (`name`) VALUES 
('Theo Quý'),
('Theo Tháng'),
('Theo Năm');

create table motel_room(
stt int primary key auto_increment,
`code` varchar(100),
tenant_name varchar(255),
phone_number varchar(11),
rental_date date,
form_of_payment varchar(255),
note varchar(255),
id_pay int,
foreign key(id_pay)references pay(id)
);
INSERT INTO motel_room (`code`,tenant_name, phone_number, rental_date, form_of_payment, note, id_pay) VALUES 
('MR001', 'Nguyễn Văn A', '0987654321', '2025-03-01', 'Theo Quý', 'Khách quen', 1),
('MR002', 'Trần Thị B', '0971122334', '2025-03-05', 'Theo Tháng', 'Thanh toán trước', 2),
('MR003', 'Lê Văn C', '0963344556', '2025-03-10', 'Theo Năm', 'Cần dọn phòng', 3),
('MR004', 'Phạm Thị D', '0911223344', '2025-03-12', 'Theo Năm', 'Đặt cọc trước', 1),
('MR005', 'Hoàng Văn E', '0909988776', '2025-03-15', 'Theo Năm', 'Đã thanh toán đủ', 2);
delete from motel_room where stt=?;
insert into motel_room(`code`,`name`,phone_number, rental_date, form_of_payment, note, id_pay)  value(?,?,?,?,?,?,?);
select m.*,p.id,p.`name` from motel_room m left join pay p on m.id_pay=p.id where id=?;