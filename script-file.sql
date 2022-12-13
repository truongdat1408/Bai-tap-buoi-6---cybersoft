CREATE DATABASE QLBanSach;
USE QLBanSach;

CREATE TABLE khach_hang(
    ma_kh INT PRIMARY KEY,
    tai_khoan VARCHAR(50),
    mat_khau VARCHAR(50),
    email VARCHAR(50),
    dia_chi VARCHAR(50),
    dien_thoai VARCHAR(15),
    gioi_tinh BOOLEAN,
    ngay_sinh DATE,
    ho_ten VARCHAR(100)
);

CREATE TABLE don_hang(
    ma_don_hang INT PRIMARY KEY,
    da_thanh_toan BOOLEAN,
    ngay_giao DATE,
    ngay_dat DATE,
    tinh_trang_gh INT,
    ma_kh INT,
    FOREIGN KEY (ma_kh) REFERENCES khach_hang(ma_kh)
);

CREATE TABLE chu_de(
    ma_chu_de INT PRIMARY KEY,
    ten_chu_de VARCHAR(255)
);

CREATE TABLE nha_xuat_ban(
    ma_nxb INT PRIMARY KEY,
    ten_nxb VARCHAR(100),
    dia_chi VARCHAR(255),
    dien_thoai VARCHAR(15)
);

CREATE TABLE sach(
    ma_sach INT PRIMARY KEY,
    ten_sach VARCHAR(255),
    gia_ban DOUBLE,
    mo_ta LONGTEXT,
    anh_bia TEXT,
    ngay_cap_nhat DATE,
    so_luong_ton INT,
    ma_chu_de INT,
    ma_nxb INT,
    
    FOREIGN KEY (ma_chu_de) REFERENCES chu_de(ma_chu_de),
    FOREIGN KEY (ma_nxb) REFERENCES nha_xuat_ban(ma_nxb)
);

CREATE TABLE chi_tiet_don_hang(
    ma_don_hang INT,
    ma_sach INT,
    so_luong INT,
    don_gia DOUBLE,
    
    FOREIGN KEY (ma_don_hang) REFERENCES don_hang(ma_don_hang),
    FOREIGN KEY (ma_sach) REFERENCES sach(ma_sach)
);

CREATE TABLE tac_gia(
    ma_tac_gia INT PRIMARY KEY,
    ten_tac_gia VARCHAR(100),
    dia_chi VARCHAR(100),
    tieu_su LONGTEXT,
    dien_thoai VARCHAR(15)
);

CREATE TABLE thong_tin_sach(
    ma_tac_gia INT,
    ma_sach INT,
    vai_tro VARCHAR(50),
    vi_tri VARCHAR(50),
    
    FOREIGN KEY (ma_tac_gia) REFERENCES tac_gia(ma_tac_gia),
    FOREIGN KEY (ma_sach) REFERENCES sach(ma_sach)
);
