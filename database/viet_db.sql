create database if not exists internet_manage;
use internet_manage;
create table nguoi_dung(
id_nguoi_dung int primary key,
ten varchar(30),
vai_tro varchar(50),
ten_tai_khoan varchar(50),
mat_khau varchar(255)
);
create table may_tinh(
id_may_tinh int primary key,
ma_may varchar(30),
trang_thai_hoat_dong varchar(20),
id_nguoi_dung int,
foreign key (id_nguoi_dung) references  nguoi_dung(id_nguoi_dung)	
);
create table dich_vu(
ten_dich_vu varchar(50),
ma_dich_vu varchar(20) primary key,
gia_tien double,
id_nguoi_dung int,
foreign key(id_nguoi_dung) references nguoi_dung(id_nguoi_dung)
);

create table nguoi_su_dung(
id int primary key,
ten varchar(50),
id_may_tinh int,
foreign key (id_may_tinh) references may_tinh(id_may_tinh)
);
create table dich_vu_su_dung(	
id int,
ma_dich_vu varchar(20) ,
primary key(id,ma_dich_vu),
foreign key (id) references nguoi_su_dung(id), 
foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);