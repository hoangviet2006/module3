create database if not exists case_study;
use case_study;
create table vi_tri(
ma_vi_tri int primary key,
ten_vi_tri varchar(50)
);
INSERT INTO vi_tri (ma_vi_tri, ten_vi_tri) VALUES 
(1, 'Nhân viên'),
(2, 'Quản lý'),
(3, 'Giám đốc');
select*from vi_tri;

create table trinh_do(
ma_trinh_do int primary key,
ten_trinh_do varchar(50)
);
INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do) VALUES 
(1, 'Trung cấp'),
(2, 'Cao đẳng'),
(3, 'Đại học'),
(4, 'Thạc sĩ');
select*from trinh_do;

create table bo_phan(
ma_bo_phan int primary key,
ten_bo_phan varchar(50)
);
INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan) VALUES 
(1, 'Hành chính'),
(2, 'Kế toán'),
(3, 'Nhân sự'),
(4, 'Kinh doanh');
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
INSERT INTO nhan_vien (ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan, ma_hop_dong) VALUES 
(1, 'Nguyễn Văn A', '1990-05-12', '123456789', 10000000, '0912345678', 'a@gmail.com', 'Hà Nội', 1, 3, 2, 1),
(2, 'Trần Thị B', '1995-07-20', '234567890', 15000000, '0923456789', 'b@gmail.com', 'Đà Nẵng', 2, 3, 1, 2),
(3, 'Lê Văn C', '1988-09-15', '345678901', 20000000, '0934567890', 'c@gmail.com', 'Hồ Chí Minh', 3, 4, 3, 3);
select*from nhan_vien where length(ho_ten)<=15 and (ho_ten like 'H%' or ho_ten like 'T%');
select DISTINCT*from nhan_vien;



create table loai_khach(
ma_loai_khach int primary key,
ten_loai_khach  varchar(50)
);
INSERT INTO loai_khach (ma_loai_khach, ten_loai_khach) VALUES 
(1, 'Thành viên'),
(2, 'VIP'),
(3, 'GOld'),
(4, 'Platinum');
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
INSERT INTO khach_hang (ma_khach_hang, ho_ten, ngay_sinh, gioi_tinh, dia_chi, so_cmnd, so_dien_thoai, email, ma_loai_khach) VALUES 
(1, 'Phạm Hồng D', '1992-03-25', 'Nam', 'Huế', '567890123', '0945678901', 'd@gmail.com', 2),
(2, 'Hoàng Thu E', '1998-06-10', 'Nữ', 'Đà Nẵng', '678901234', '0956789012', 'e@gmail.com', 2),
(3, 'Ngô Minh F', '2000-12-01', 'Nam', 'Quảng Trị', '789012345', '0967890123', 'f@gmail.com', 1);
INSERT INTO khach_hang (ma_khach_hang, ho_ten, ngay_sinh, gioi_tinh, dia_chi, so_cmnd, so_dien_thoai, email, ma_loai_khach) VALUES 
(5, 'Phạm Hồng D', '1992-03-25', 'Nam', 'Huế', '567890123', '0945678901', 'd@gmail.com', 2),
(6, 'Hoàng Thu E', '1998-06-10', 'Nữ', 'Đà Nẵng', '678901234', '0956789012', 'e@gmail.com', 2),
(7, 'Ngô Minh F', '2000-12-01', 'Nam', 'Quảng Trị', '789012345', '0967890123', 'f@gmail.com', 1);
select*from khach_hang;

select*from khach_hang where (dia_chi="Đà Nẵng" or dia_chi="Quảng Trị") and (TIMESTAMPDIFF(YEAR, ngay_sinh, CURDATE()) >= 18 and TIMESTAMPDIFF(YEAR, ngay_sinh, CURDATE()) <50);
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
(1, '2024-01-10', '2024-06-10', 5000000, 1, 1),
(2, '2024-02-15', '2024-07-15', 7000000, 2, 2),
(3, '2024-03-20', '2024-08-20', 10000000, 3, 3);
INSERT INTO hop_dong (ma_hop_dong, ngay_bat_dau, ngay_ket_thuc, tien_dat_coc, ma_khach_hang, ma_dich_vu) 
VALUES 
(4, '2024-03-20', '2024-08-20', 10000000, 2, 2),
(5, '2024-03-20', '2024-08-20', 10000000, 2, 3),
(6, '2024-03-20', '2024-08-20', 10000000, 3, 1);
INSERT INTO hop_dong (ma_hop_dong, ngay_bat_dau, ngay_ket_thuc, tien_dat_coc, ma_khach_hang, ma_dich_vu) 
VALUES 
(7, '2024-03-20', '2024-08-20', 10000000, 5, 2);
select*from hop_dong;

create table hop_dong_chi_tiet(
ma_hop_dong int ,
ma_dich_vu_di_kem int,
so_luong int,
primary key (ma_hop_dong,ma_dich_vu_di_kem),
foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);
INSERT INTO hop_dong_chi_tiet (ma_hop_dong, ma_dich_vu_di_kem, so_luong) VALUES 
(1, 1, 2),
(2, 2, 1),
(3, 3, 3);
INSERT INTO hop_dong_chi_tiet (ma_hop_dong, ma_dich_vu_di_kem, so_luong) VALUES 
(4, 1, 2),
(5, 2, 1),
(6, 3, 3);
select*from hop_dong_chi_tiet;

create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(50),
gia double,
don_vi varchar(20),
trang_thai varchar(30)
);
INSERT INTO dich_vu_di_kem (ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai) VALUES 
(1, 'Nước uống', 20000, 'Chai', 'Có sẵn'),
(2, 'Xe đưa đón', 500000, 'Chuyến', 'Có sẵn'),
(3, 'Dịch vụ spa', 300000, 'Lần', 'Có sẵn');
select*from dich_vu_di_kem;

create table loai_dich_vu(
ma_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(50)
);
INSERT INTO loai_dich_vu (ma_loai_dich_vu, ten_loai_dich_vu) VALUES 
(1, 'Resort'),
(2, 'Khách sạn'),
(3, 'Nhà nghỉ'),
(4, 'Biệt thự'),
(5, 'Căn hộ cao cấp');
select*from loai_dich_vu;

create table kieu_thue(
ma_kieu_thue int primary key,
ten_kieu_thue varchar(50)
);
INSERT INTO kieu_thue (ma_kieu_thue, ten_kieu_thue) VALUES 
(1, 'Theo ngày'),
(2, 'Theo tuần'),
(3, 'Theo tháng'),
(4, 'Theo năm');
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
INSERT INTO dich_vu (ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi, dien_tich_ho_boi, so_tang, ma_loai_dich_vu, ma_kieu_thue) VALUES 
(1, 'Phòng đơn', 30, 500000, 2, 'Tiêu chuẩn', 'Có điều hòa, tivi', NULL, 1, 2, 1),
(2, 'Phòng đôi', 50, 800000, 4, 'Cao cấp', 'Có bồn tắm, minibar', 10, 1, 3, 2),
(3, 'Biệt thự', 200, 5000000, 10, 'Sang trọng', 'Hồ bơi riêng, phòng khách, bếp', 50, 2, 4, 3);
select*from dich_vu;
	-- câu 4
    select k.ma_khach_hang, k.ho_ten, count(h.ma_hop_dong) as so_lan_dat from hop_dong h
    join khach_hang k on h.ma_khach_hang=k.ma_khach_hang
    join loai_khach l on k.ma_loai_khach=l.ma_loai_khach
    where l.ten_loai_khach='VIP'
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
		join loai_khach lk on k.ma_loai_khach=lk.ma_loai_khach
		join hop_dong hd on k.ma_khach_hang=hd.ma_khach_hang
		join dich_vu dv on hd.ma_dich_vu= dv.ma_dich_vu 
		join hop_dong_chi_tiet hdct on hd.ma_hop_dong= hdct.ma_hop_dong
		join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem=dvdk.ma_dich_vu_di_kem
        group by k.ma_khach_hang,
        ho_ten,
        ten_loai_khach,
        hd.ma_hop_dong,
        ten_dich_vu,
        ngay_bat_dau,
        ngay_ket_thuc,
        dv.chi_phi_thue
        ;


   
