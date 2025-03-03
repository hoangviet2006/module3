	create database if not exists case_study;
	use case_study;
							drop database case_study;
create table vi_tri(
ma_vi_tri int primary key,
ten_vi_tri varchar(50)
);
INSERT INTO vi_tri (ma_vi_tri, ten_vi_tri) VALUES 
(1, 'Nhân viên'),
(2, 'Quản lý');
select*from vi_tri;

create table trinh_do(
ma_trinh_do int primary key,
ten_trinh_do varchar(50)
);
INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do) VALUES 
(1, 'Trung cấp'),
(2, 'Cao đẳng'),
(3, 'Đại học'),
(4, 'Sau Đại Học');
select*from trinh_do;

create table bo_phan(
ma_bo_phan int primary key,
ten_bo_phan varchar(50)
);
INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan) VALUES 
(1, 'Sale-Marketing'),
(2, 'Hành chính'),
(3, 'Phục vụ'),
(4, 'Quản lý');
select*from bo_phan;

create table nhan_vien(
ma_nhan_vien int primary key,
ho_ten varchar(50),
ngay_sinh date,
so_cmnd varchar(20),
luong double,
so_dien_thoai varchar(15),
email varchar(50),
dia_chi varchar(50),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
ma_hop_dong int,
foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan),
foreign key(ma_hop_dong) references hop_dong(ma_hop_dong)
);
INSERT INTO nhan_vien (ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan, ma_hop_dong)
VALUES
(1, 'Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1, 1),
(2, 'Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2, 2),
(3, 'Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2, 2),
(4, 'Võ Công Toàn', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4, 3),
(5, 'Nguyễn Bình Phát', '1999-12-09', '453463232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 3, 1),
(6, 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978652312', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 1, 2, 3, 2),
(7, 'Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2, 3),
(8, 'Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642132113', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4, 4),
(9, 'Tông Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 1, 3, 1),
(10, 'Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hòa Khánh, Đồng Nai', 2, 3, 2, 3);
	
select*from nhan_vien;
	
create table loai_khach(
ma_loai_khach int primary key,
ten_loai_khach  varchar(50)
);
INSERT INTO loai_khach (ma_loai_khach, ten_loai_khach) VALUES 
(1, 'Diamond'),
(2, 'Platinium'),
(3, 'Gold'),
(4, 'Silver'),
(5,'Member');
select*from loai_khach;

create table khach_hang(
ma_khach_hang int primary key,
ho_ten varchar(50),
ngay_sinh date,
gioi_tinh varchar(50),
dia_chi varchar(50),
so_cmnd varchar(50),
so_dien_thoai varchar(50),
email varchar(50),
ma_loai_khach int,
foreign key(ma_loai_khach) references loai_khach(ma_loai_khach)
);
INSERT INTO khach_hang (ma_khach_hang, ho_ten, ngay_sinh, gioi_tinh, dia_chi, so_cmnd, so_dien_thoai, email, ma_loai_khach)
VALUES
(1, 'Nguyễn Thị Hảo', '1970-11-07', '0', '23 Nguyễn Hoàng, Đà Nẵng', '643431213', '0945423362', 'thihao07@gmail.com', 5),
(2, 'Phạm Xuân Diệu', '1992-08-08', '1', 'K77/22 Thái Phiên, Quảng Trị', '865342123', '0954333332', 'xuandieu92@gmail.com', 3),
(3, 'Trương Đình Nghệ', '1990-02-27', '1', 'K323/12 Ông Ích Khiêm, Vinh', '488645199', '0373213122', 'nghenhan2702@gmail.com', 1),
(4, 'Dương Văn Quan', '1981-07-08', '1', 'K453/12 Lê Lợi, Đà Nẵng', '543432111', '0490039421', 'duongquan@gmail.com', 1),
(5, 'Hoàng Trần Nhi Nhi', '1995-12-09', '0', '224 Lý Thái Tổ, Gia Lai', '795453345', '0312345678', 'nhinhi123@gmail.com', 4),
(6, 'Tôn Nữ Mộc Châu', '2000-11-08', '0', '37 Yên Thế, Đà Nẵng', '732434215', '0988888844', 'tonnuchau@gmail.com', 2),
(7, 'Nguyễn Mỹ Kim', '1984-04-08', '0', 'K123/45 Lê Lợi, Hồ Chí Minh', '856543213', '0912345698', 'kimcuong84@gmail.com', 1),
(8, 'Nguyễn Thị Hảo', '1992-08-08', '0', '55 Nguyễn Văn Linh, Kon Tum', '965656433', '0763212345', 'haohao99@gmail.com', 3),
(9, 'Trần Đại Danh', '1994-07-01', '1', '24 Lý Thường Kiệt, Quảng Ngãi', '432431253', '0643434343', 'danhhai99@gmail.com', 3),
(10, 'Nguyễn Tâm Đắc', '1990-07-01', '1', '22 Nồ Qúyên, Đà Nẵng', '344343423', '0987654321', 'dactam@gmail.com', 2);
select*from khach_hang;

create table hop_dong(
ma_hop_dong int primary key,
ngay_bat_dau date,
ngay_ket_thuc date,
tien_dat_coc double,
ma_khach_hang int,
ma_dich_vu int,
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key(ma_dich_vu) references dich_vu(ma_dich_vu)
);
INSERT INTO hop_dong (ma_hop_dong, ngay_bat_dau, ngay_ket_thuc, tien_dat_coc, ma_khach_hang, ma_dich_vu)
VALUES
(1, '2020-12-08', '2020-12-08', 0, 1, 3),
(2, '2020-07-14', '2020-07-21', 200000, 3, 1),
(3, '2021-03-15', '2021-03-17', 50000, 4, 2),
(4, '2021-01-14', '2021-01-18', 100000, 5, 5),
(5, '2021-07-14', '2021-07-15', 0, 7, 6),
(6, '2021-06-01', '2021-06-03', 0, 7, 6),
(7, '2021-09-02', '2021-09-05', 100000, 7, 1),
(8, '2021-06-17', '2021-06-18', 150000, 4, 1),
(9, '2020-11-19', '2020-11-19', 0, 4, 3),
(10, '2021-04-12', '2021-04-13', 0, 3, 5),
(11, '2021-04-25', '2021-04-25', 0, 2, 1),
(12, '2021-05-25', '2021-05-27', 0, 10, 1);
select*from hop_dong;

create table hop_dong_chi_tiet(
ma_hop_dong int ,
ma_dich_vu_di_kem int,
so_luong int,
primary key (ma_hop_dong,ma_dich_vu_di_kem),
foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);
INSERT INTO hop_dong_chi_tiet (ma_hop_dong, ma_dich_vu_di_kem, so_luong)
VALUES
(2, 4, 5),
(2, 5, 8),
(2, 6, 15),
(3, 1, 1),
(3, 2, 11),
(3, 3, 1),
(1, 2, 1),
(12, 2, 2);
select*from hop_dong_chi_tiet;

create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(50),
gia double,
don_vi varchar(20),
trang_thai varchar(30)
);
INSERT INTO dich_vu_di_kem (ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai)
VALUES
(1, 'Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
(2, 'Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
(3, 'Thuê xe đạp', 20000, 'chiếc', 'tốt'),
(4, 'Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
(5, 'Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
(6, 'Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');

select*from dich_vu_di_kem;

create table loai_dich_vu(
ma_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(50)
);
INSERT INTO loai_dich_vu (ma_loai_dich_vu, ten_loai_dich_vu)
VALUES
(1, 'Villa'),
(2, 'House'),
(3, 'Room');

select*from loai_dich_vu;

create table kieu_thue(
ma_kieu_thue int primary key,
ten_kieu_thue varchar(50)
);
INSERT INTO kieu_thue (ma_kieu_thue, ten_kieu_thue)
VALUES
(1, 'year'),
(2, 'month'),
(3, 'day'),
(4, 'hour');

select*from kieu_thue;

create table dich_vu(	
ma_dich_vu int primary key,
ten_dich_vu  varchar(50),
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
tieu_chuan_phong varchar(50),
mo_ta_tien_nghi varchar(50),
dien_tich_ho_boi double,
so_tang int,
ma_loai_dich_vu int,
ma_kieu_thue int,
foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu),
foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue)
); 
INSERT INTO dich_vu (
    ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, 
    tieu_chuan_phong, mo_ta_tien_nghi, dien_tich_ho_boi, so_tang, 
    ma_kieu_thue, ma_loai_dich_vu
)
VALUES
(1, 'Villa Beach Front', 25000, 10000000, 10, 'vip', 'Có hồ bơi', 500, 4, 3, 1),
(2, 'House Princess 01', 14000, 5000000, 7, 'vip', 'Có thêm bếp nướng', NULL, 3, 2, 2),
(3, 'Room Twin 01', 5000, 1000000, 2, 'normal', 'Có tivi', NULL, NULL, 4, 3),
(4, 'Villa No Beach Front', 22000, 9000000, 8, 'normal', 'Có hồ bơi', 300, 3, 3, 1),
(5, 'House Princess 02', 10000, 4000000, 5, 'normal', 'Có thêm bếp nướng', NULL, 2, 3, 2),
(6, 'Room Twin 02', 3000, 900000, 2, 'normal', 'Có tivi', NULL, NULL, 4, 3);
select*from dich_vu;
    
-- câu 2
select * from nhan_vien where char_length(ho_ten)=15 or ((SUBSTRING_INDEX(ho_ten, ' ', -1) LIKE 'H%') or  (SUBSTRING_INDEX(ho_ten, ' ', -1) LIKE 'K%') or (SUBSTRING_INDEX(ho_ten, ' ', -1) LIKE 'T%'));
-- câu 3
select * from khach_hang where (dia_chi like "%Đà Nẵng%" or dia_chi like"%Quảng Trị%" ) and (TIMESTAMPDIFF(YEAR, ngay_sinh, CURDATE()) >=18 and TIMESTAMPDIFF(YEAR, ngay_sinh, CURDATE())<=50); 
-- câu 4
select k.ma_khach_hang, k.ho_ten, count(h.ma_hop_dong) as so_lan_dat from hop_dong h
join khach_hang k on h.ma_khach_hang=k.ma_khach_hang
join loai_khach l on k.ma_loai_khach=l.ma_loai_khach
where l.ten_loai_khach='Diamond'
group by  k.ma_khach_hang
order by so_lan_dat asc;		
select*from hop_dong;
-- câu 5
select k.ma_khach_hang,
k.ho_ten,
lk.ten_loai_khach,
hd.ma_hop_dong,	
dv.ten_dich_vu,
hd.ngay_bat_dau,
hd.ngay_ket_thuc,
(dv.chi_phi_thue+sum(hdct.so_luong*dvdk.gia)) as tong_tien
from khach_hang k
left join hop_dong hd on k.ma_khach_hang=hd.ma_khach_hang
left join loai_khach lk on k.ma_loai_khach=lk.ma_loai_khach
left join dich_vu dv on hd.ma_dich_vu= dv.ma_dich_vu 
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong= hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem=dvdk.ma_dich_vu_di_kem
group by k.ma_khach_hang,
ho_ten,
ten_loai_khach,
hd.ma_hop_dong,
ten_dich_vu,
ngay_bat_dau,
ngay_ket_thuc,
dv.chi_phi_thue
order by hd.ma_hop_dong,
ten_dich_vu,
ngay_bat_dau,
ngay_ket_thuc,
dv.chi_phi_thue
desc
;
-- câu 6
select distinct dv.ma_dich_vu,
dv.ten_dich_vu,
dv.dien_tich,
dv.chi_phi_thue,
ldv.ten_loai_dich_vu 
from  dich_vu dv 
join loai_dich_vu ldv on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
left join hop_dong hd on dv.ma_dich_vu=hd.ma_dich_vu 
where hd.ma_dich_vu is null
group by dv.ma_dich_vu,
dv.ten_dich_vu,
dv.dien_tich,
dv.chi_phi_thue,
ldv.ten_loai_dich_vu
;
-- câu 8 3 cách
select distinct ho_ten from khach_hang;

select ho_ten from khach_hang 
group by ho_ten;

select ho_ten from khach_hang
union
select ho_ten from khach_hang;
		

	   
