create database if not exists bai_tap_1;
use bai_tap_1;
create table phieu_xuat(
so_px int primary key,
ngay_xuat date	
);
create table vattu(
ma_vtu int primary key,
ten_vtu varchar(50)
);
	
create table phieu_nhap(
so_nhieu_nhap int primary key,
ngay_nhap date
);
create table don_dat_hang(
so_dat_hang int primary key,
ngay_dat_hang date
);
create table nhacc(
ma_ncc int primary key,
ten_ncc varchar(50),
dia_chi varchar(50)
);
create table chi_tiet_su_dung(
don_gia_xuat double,
so_luong_xuat int,
so_px int,
ma_vtu int,
primary key(so_px,ma_vtu),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vtu) references vattu(ma_vtu)
);
create table chi_tiet_phieu_nhap(
don_gia_nhap double,
so_luong_nhap int,
ma_vtu int,
so_nhieu_nhap int,
primary key(ma_vtu,so_nhieu_nhap),
foreign key(ma_vtu) references vattu(ma_vtu),
foreign key(so_nhieu_nhap) references phieu_nhap(so_nhieu_nhap)
);
create table chi_tiet_don_dat_hang(
ma_vtu int,
so_dat_hang int,
primary key (ma_vtu,so_dat_hang),
foreign key(ma_vtu) references vattu(ma_vtu),	
foreign key(so_dat_hang) references don_dat_hang(so_dat_hang)
);
create table cung_cap(
so_dat_hang int,
ma_ncc int,
primary key(so_dat_hang,ma_ncc),
foreign	 key(so_dat_hang) references don_dat_hang(so_dat_hang),
foreign key(ma_ncc) references nhacc(ma_ncc)
);
create table so_dien_thoai(
so_dien_thoai varchar(15) ,
ma_ncc int,
primary key(so_dien_thoai,ma_ncc),
foreign key(ma_ncc) references  nhacc(ma_ncc)
);

