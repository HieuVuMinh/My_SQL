use BTVN_19_may_quanlymuaban;

create table khachhang(
	MaKhachHang 		varchar(50) not null primary key,
	TenCongTy 			varchar(50) not null,
    TenGiaoDich			varchar(50),
    DiaChi				varchar(50),
    Email				varchar(50),
    DienThoai			varchar(20),
    Fax					varchar(20)
);

create table NhanVien(
	MaNhanVien			varchar(50) not null primary key,
	Ho		 			varchar(50) not null,
    Ten					varchar(50),
    NgaySinh			date,
    NgayLamViec			date,
    DiaChi				varchar(50),
    DienThoai			varchar(20),
    LuongCoBan			varchar(20),
    PhuCap				varchar(20)
);

create table MatHang(
	MaHang				varchar(50) not null primary key,
	TenHang				varchar(50) not null,
    MaCongTy			varchar(50) not null,
    MaLoaiHang			varchar(50) not null,
    SoLuong				int,
    DonViTinh			varchar(20),
    GiaHang				varchar(20),
	constraint fk_MaCongTy foreign key (MaCongTy) references NhaCungCap(MaCongTy),
	constraint fk_MaLoaihang foreign key (MaLoaiHang) references LoaiHang(MaLoaiHang)
);

create table LoaiHang(
	MaLoaiHang 			varchar(50) not null primary key,
    TenLoaiHang			varchar(50)
);

create table NhaCungCap(
	MaCongTy			varchar(50) not null primary key,
	TenCongTy			varchar(50) not null,
    TenGiaoDich			varchar(50),
    DiaChi				varchar(50),
    DienThoai			varchar(50),
    Fax					varchar(20),
    Email				varchar(20)
);

create table ChiTietDatHang(
	SoHoaDon 			int not null,
    MaHang				varchar(50) not null,
    GiaBan				varchar(50),
    SoLuong  			int, 
    MucGiaBan			varchar(50),
    constraint fk_SoHoaDon foreign key (SoHoaDon) references DonDatHang (SoHoaDon),
    constraint fk_MaHang foreign key (MaHang) references MatHang (MaHang)
);

create table DonDatHang(
	SoHoaDon 			int not null primary key,
    MaKhachHang			varchar(50) not null,
    MaNhanVien			varchar(50) not null,
    NgayDatHang			date,
    NgayGiaoHang		date, 
    NgayChuyenHang		date,
    NoiGiaoHang			varchar(50),
    constraint fk_MaKhachHang foreign key (MaKhachHang) references Khachhang (MaKhachHang),
    constraint fk_MaNhanVien foreign key (MaNhanVien) references NhanVIen (MaNhanVien)
);

Insert Into NHACUNGCAP (MaCongTy, TenCongTY, TenGiaoDich, DiaChi, DienThoai, Fax, Email)
Values 	('ct1', 'Cty TNHH Toàn Phát', 'Hai Chau', 'HN','051133999888', '568941', 'Toanphat@gmail.com'),
		('ct2', 'Cty Cổ Phần Đông Du', 'Lien Chieu', 'ND','051133999889', '456789', 'Dongdu@gmail.com'),
		('ct3', 'Cty Cổ Phần Toàn Bon Cầu', 'Hoa Thuan', 'BN','051133999890', '321456', 'Boncau@gmail.com'),
		('ct4', 'Cty Cổ Phần Toàn Cầu Xanh', 'Hai Chau', 'HP','05113658945', '513364', 'Toancau@gmail.com');

Insert Into LoaiHang (MaLoaiHang, TenLoaiHang)
Values 	('LH1', 'Ô tô'),
		('LH2', 'Máy Lọc Nước'),
		('LH3', 'Bồn Cầu'),
		('LH4', 'Bếp Du lịch');
        
Insert Into KhachHang (MaKhachHang, TenCongTY, TenGiaoDich, DiaChi, Email, DienThoai, Fax)
Values 	('KH1', 'Cty TNHH Nông Lâm', 'Long Biên', 'HN','NongLam@gmail.com','051133999338', '568241'),
		('KH2', 'Cty Cổ Phần Hải Sản', 'Đống Đa', 'BC','HaiSan@gmail.com','051133999134', '456759'),
		('KH3', 'Cty Cổ Phần Nóng Lạnh', 'Phan trọng Tuệ', 'BN','NongLanh@gmail.com','022133999890', '32142216'),
		('KH4', 'Cty Cổ Phần Biển Đông', 'Thanh Niên', 'HP','BienDong@gmail.com','05113538945', '51336235');        
        
Insert Into Mathang (MaHang, TenHang, MaCongTy, MaLoaiHang, SoLuong, DonViTinh, GiaHang)
Values 	('H1', 'Mazada', 'ct3', 'LH1', 1,'Tấn', '6000'),
		('H2', 'Bồn Cầu Giữ Nhiệt', 'ct2', 'LH3', 2,'Kg', '1000'),
		('H3', 'Bếp Chống Ăn Mòn', 'ct1', 'LH4', 4,'Kg', '300'),
		('H4', 'Lọc Nước Biển', 'ct4', 'LH2', 3,'Ml', '1500');        
        
Insert Into DonDatHang (SoHoaDon, MaKhachHang, MaNhanVien, NgayDatHang, NgayGiaoHang, NgayChuyenHang, NoiGiaoHang)
Values 	(1, 'KH3', 'nv1', '20201113', '20201116','20201117', 'BN'),
		(2, 'KH1', 'nv1', '20220111', '20220119','20220120', 'HN'),
		(3, 'KH4', 'nv3', '20191012', '20191022','20191023', 'HP'),
		(4, 'KH2', 'nv2', '20100416', '20100417','20100418', 'BC');        
 
Insert Into ChiTietDatHang (SoHoaDon, MaHang, GiaBan, SoLuong, MucGiaBan)
Values 	(1, 'H2', '1000', 2, '1100'),
		(4, 'H4', '2000', 3, '2100'),
		(3, 'H3', '1300', 2, '1400'),
		(2, 'H1', '10800', 10, '10600');        

-- 1.Họ tên, địa chỉ và năm bắt đầu làm việc của các nhân viên trong cty
select Ho, Ten, DiaChi, year(NgayLamViec)
from NhanVien;

-- 2.Mã và tên của các mặt hàng có giá trị lớn hơn 1000 và số lượng hiện có ít hơn 3
select MaHang, TenHang from Mathang
where GiaHang > 1000 and SoLuong < 3;

-- 3.Cho biết mỗi mặt hàng trong công ty do ai cung cấp
select mh.Tenhang, ncc.TenCongTy
from MatHang mh
join NhaCungCap ncc on mh.MaCongTy = ncc.MaCongTy;

-- 4.Hãy cho biết số tiền lương mà công ty phải trả cho mỗi nhân viên là bao nhiêu(lương=lương cơ bản+phụ cấp)
select Ten, sum(NhanVien.LuongCoBan + NhanVien.PhuCap) as 'Tong Luong'
from NhanVien
group by Ten;

-- 5.Tăng lương lên gấp rưỡi cho những nhân viên bán được số lượng hàng nhiều hơn 1 trong năm 2020.
-- select Ten, sum((nv.LuongCoBan + nv.PhuCap) * 1.5) as 'Tong Luong', count(MaNhanVien)
-- from NhanVien nv
-- join DonDatHang ddh on nv.MaNhanVien = ddh.MaNhanVien
-- where count(MaNhanVien) > 1 and year(NgayChuyenHang) = '2020'

-- 6.Trong năm 2019 những mặt hàng nào đặt mua đúng một lần
select mh.Tenhang 
from MatHang mh
join ChiTietDatHang ctdh on ctdh.MaHang = mh.MaHang
join DonDathang ddh on ddh.SoHoaSon = ctdh.SoHoaDon
where year(ddh.NgayChuyenHang) = '2019' and count(ddh.SoHoaDon) < 2;

































