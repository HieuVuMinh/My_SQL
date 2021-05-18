use quanlydiemthi;

CREATE TABLE HocSinh (
    MaHocSinh VARCHAR(20) PRIMARY KEY,
    TenHocSinh VARCHAR(50),
    NgaySinh DATETIME,
    Lop VARCHAR(20),
    GiamThi VARCHAR(20)
);

CREATE TABLE MonHoc (
    MaMonHoc VARCHAR(20) PRIMARY KEY,
    TenMonHoc VARCHAR(50)
);

CREATE TABLE BangDiem (
    MaHocSinh VARCHAR(20),
    MaMonHoc VARCHAR(20),
    DiemThi INT,
    NgayKiemTra DATETIME,
    PRIMARY KEY (MaHocSinh , MaMonHoc),
    FOREIGN KEY (MaHocSinh) REFERENCES HocSinh (MaHocSinh),
    FOREIGN KEY (MaMonHoc) REFERENCES MonHoc (MaMonHoc)
);

CREATE TABLE GiaoVien (
    MaGiaoVien VARCHAR(20) PRIMARY KEY,
    TenGiaoVien VARCHAR(50),
    SoDienThoai VARCHAR(10)
);

ALTER TABLE MonHoc ADD MaGiaoVien VARCHAR(20);
ALTER TABLE MonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (MaGiaoVien) REFERENCES GiaoVien(MaGiaoVien);
