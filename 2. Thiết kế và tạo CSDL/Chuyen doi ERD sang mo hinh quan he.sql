create table PhieuXuat(
	SoPhieuXuat int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NgayXuat datetime not null
);

create table VatTu(
	MaVatTu int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TenVatTu varchar(20)
);

create table ChiTietPhieuXuat(
	DonGiaXuat float not null,
    SoLuongXuat int not null,
    SoPhieuXuat int,
    MaVatTu int,
    PRIMARY KEY (SoPhieuXuat, MaVatTu)
);

create table PhieuNhap(
	SoPhieuNhap int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NgayNhap datetime not null
);

create table ChiTietPhieuNhap(
	DonGiaNhap float not null,
    SoLuongNhap int not null,
    SoPhieuNhap int,
    MaVatTu int,
    PRIMARY KEY (SoPhieuNhap, MaVatTu)
);

create table DonDatHang(
	SoDatHang int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NgayDatHang datetime not null
);

create table ChiTietDonDatHang(
    SoDatHang int,
    MaVatTu int,
    PRIMARY KEY (SoDatHang, MaVatTu)
);

create table NhaCungCap(
    MaNhaCungCap int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TenNhaCungCap varchar(20) not null,
    DiaChi varchar(50) not null,
    SoDienThoai varchar(20) not null
);

alter table DonDatHang add MaNhaCungCap int;
ALTER TABLE DonDatHang ADD CONSTRAINT FK_MaNhaCungCap FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap);
