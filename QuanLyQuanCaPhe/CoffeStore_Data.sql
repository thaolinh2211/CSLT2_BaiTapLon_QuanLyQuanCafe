CREATE TABLE TAIKHOAN
(
	TenDangNhap  VARCHAR(100) PRIMARY KEY NOT NULL,
	MatKhau VARCHAR(100) NOT NULL DEFAULT 0, 
	TenNguoiDung NVARCHAR(100) NOT NULL DEFAULT 'user',
	LoaiTaiKhoan INT NOT NULL DEFAULT 0 --0.Nhan vien --1.Quan ly
);

CREATE TABLE KHUVUC
(
	MaKV CHAR(10) PRIMARY KEY not null,
	TenKV NVARCHAR(50) NOT NULL
);

CREATE TABLE LOAIMON 
(
	MaLoaiMon CHAR(20) PRIMARY KEY not null,
	TenLoaiMon NVARCHAR(50) NOT NULL
);

CREATE TABLE NHACUNGCAP
(
	MaNCC INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	TenNCC NVARCHAR(50) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	SDT VARCHAR(30) NULL
);

CREATE TABLE BAN 
(
	MaBan INT IDENTITY(1,1) PRIMARY KEY,
	TenBan NVARCHAR(50) NOT NULL,
	TrangThai NVARCHAR(50) NOT NULL,	
	MaKV CHAR(10) NOT NULL,
	CONSTRAINT fk_ban_khuvuc FOREIGN KEY (MaKV) REFERENCES KHUVUC(MaKV)
);

CREATE TABLE MON 
(
	MaMon CHAR(20) PRIMARY KEY NOT NULL,
	TenMon NVARCHAR(50) NOT NULL,
	Gia  DECIMAL (10, 2)  NOT NULL,
	MaLoaiMon CHAR(20) NOT NULL,
	CONSTRAINT fk_mon_loaimon FOREIGN KEY (MaLoaiMon) REFERENCES LOAIMON(MaLoaiMon)
);

CREATE TABLE KHACHHANG
(
	MaKH CHAR(10) PRIMARY KEY NOT NULL,
	TenKH NVARCHAR(50) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	DiemTichLuy INT, 
	SDT VARCHAR(30)
);

CREATE TABLE NHANVIEN
(
	MaNV INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	TenNV NVARCHAR(50) NOT NULL,
	NgaySinh DATE NULL,
	DiaChi NVARCHAR(50) NOT NULL,
	SDT VARCHAR(30),
	HoatDong tinyint NOT NULL,
	BoPhan NVARCHAR(30),
	Luong  DECIMAL (10, 2) 
);


CREATE TABLE HOADON
(
	MaHD CHAR(10) PRIMARY KEY NOT NULL,
	NgayDat date,
	NgayGiao date,
	MaNV INT  NOT NULL,
	MaKH CHAR(10) NOT NULL,
	MaBan INT NULL,
	CONSTRAINT fk_hoadon_nhanvien FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),
	CONSTRAINT fk_hoadon_khachhang FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH),
	CONSTRAINT fk_hoadon_ban FOREIGN KEY (MaBan) REFERENCES BAN(MaBan)
);

CREATE TABLE CHITIETHD
(
	MaHD CHAR(10) NOT NULL,
	MaMon CHAR(20) NOT NULL,
	CONSTRAINT pk_cthd PRIMARY KEY (MaHD, MaMon),
	DonGia  DECIMAL (10, 2) NOT NULL,
	SoLuong INT NOT NULL,
	GiamGia DECIMAL (4, 2) NOT NULL DEFAULT 0,
	CONSTRAINT fk_cthd_mon FOREIGN KEY (MaHD) REFERENCES HOADON(MaHD),
	CONSTRAINT fk_cthd_hd FOREIGN KEY (MaMon) REFERENCES MON(MaMon)
);

CREATE TABLE HANGHOA
(
	MaHH INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	TenHH NVARCHAR(50) NOT NULL,
    DonVi NVARCHAR(20) NOT NULL,
	MoTa NVARCHAR(100) NULL,
	MaNCC INT NOT NULL,
	CONSTRAINT fk_hanghoa_ncc FOREIGN KEY (MaNCC) REFERENCES NHACUNGCAP(MaNCC)
);

CREATE TABLE DONNHAPHANG
(
	MaDNH INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	TenDNH NVARCHAR(100) NOT NULL,
	TrangThai NVARCHAR(50) NOT NULL,
	PhuongThucVanChuyen NVARCHAR(50) NOT NULL,
	NgayDatHang DATE, 
	NgayGiaoHang DATE,
    NgayThanhToan DATE,
	GhiChu NVARCHAR(100) NULL,
    ChietKhau DECIMAL (4, 2) NOT NULL DEFAULT 0,
	MaNV INT NOT NULL,
	CONSTRAINT fk_dnh_nv FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)
);

CREATE TABLE CHITIETHOADONNHAP
(
	MaDNH INT IDENTITY(1,1) NOT NULL,
	MaHH INT NOT NULL,
	CONSTRAINT pk_cthdnhap PRIMARY KEY (MaDNH, MaHH),
	DonGia DECIMAL (10, 2) NOT NULL,
	SoLuongNhap INT NOT NULL,
	CONSTRAINT fk_cthdnhap_donnhaphang FOREIGN KEY (MaDNH) REFERENCES DONNHAPHANG(MaDNH),
	CONSTRAINT fk_cthdnhap_hanghoa FOREIGN KEY (MaHH) REFERENCES HANGHOA(MaHH)
);


-- Insert data for all tables
-- Table KHUVUC
INSERT INTO KHUVUC(MaKV, TenKV)
VALUES('KV01', 'Khu vuc mot');
INSERT INTO KHUVUC(MaKV, TenKV)
VALUES('KV02', 'Khu vuc hai');
INSERT INTO KHUVUC(MaKV, TenKV)
VALUES('KV03', 'Khu vuc ba');
select * from KHUVUC;

-- Table LOAIMON
INSERT INTO LOAIMON(maloaimon, tenloaimon)
VALUES('coffee', 'Ca phe');
INSERT INTO LOAIMON(maloaimon, tenloaimon)
VALUES('juice', 'Nuoc ep');
INSERT INTO LOAIMON(maloaimon, tenloaimon)
VALUES('smoothie', 'Sinh to');
INSERT INTO LOAIMON(maloaimon, tenloaimon)
VALUES('tea', 'Tra');
INSERT INTO LOAIMON(maloaimon, tenloaimon)
VALUES('milktea', 'Tra sua');
INSERT INTO LOAIMON(maloaimon, tenloaimon)
VALUES('soda', 'Nuoc soda');
INSERT INTO LOAIMON(maloaimon, tenloaimon)
VALUES('yogurt','Sua chua');
INSERT INTO LOAIMON(maloaimon, tenloaimon)
VALUES('chocolate', 'So co la');
INSERT INTO LOAIMON(maloaimon, tenloaimon)
VALUES('cake', 'Banh ngot');
INSERT INTO LOAIMON(maloaimon, tenloaimon)
VALUES('cream', 'Kem');
select * from loaimon;
-- Table NHACUNGCAP
SET IDENTITY_INSERT NHACUNGCAP ON;
INSERT INTO NHACUNGCAP(MaNCC, TenNCC, DiaChi, sdt)
VALUES(1, 'Cong Ty TNHH Ca Phe Ngon', '23 Ngo Quyen, Thang Loi, Buon Ma Thuat, Dak Lak','02623950787');
INSERT INTO NHACUNGCAP(MaNCC, TenNCC, DiaChi, sdt)
VALUES(2, 'Cong Ty TNHH Nestle Viet Nam', '138-142 Hai Ba Trung, Da Kao, Q1 , Ho Chi Minh','02839113737');
INSERT INTO NHACUNGCAP(MaNCC, TenNCC, DiaChi, sdt)
VALUES(3, 'Cong Ty TNHH Tam Chau', N'284 Ton Duc Thang, Hang Bot, Dong Da, Ha Noi','02437916555');
INSERT INTO NHACUNGCAP(MaNCC, TenNCC, DiaChi, sdt)
VALUES(4, 'Cong Ty TNHH Thuong mai và Thuc pham Sao Viet', '2/77 Tran Nguyen Dan, Hoang Mai, Ha Noi','02432323658');
INSERT INTO NHACUNGCAP(MaNCC, TenNCC, DiaChi, sdt)
VALUES(5, 'Cong Ty CP San xuat va Thuong mai Tomato Viet Nam', '33 BT3, Khu do thi Van Phu, Ha Dong, Ha Noi','0968018334');
INSERT INTO NHACUNGCAP(MaNCC, TenNCC, DiaChi, sdt)
VALUES(6, 'Cong Ty nhap khau trai cay Homefarm', '282 Hoang Van Thai, Thanh Xuan, Ha Noi','02471081008');
select * from nhacungcap;
SET IDENTITY_INSERT NHACUNGCAP OFF;

SET IDENTITY_INSERT BAN ON;
-- Bang BAN
INSERT INTO BAN(maban, tenban, trangthai, makv)
VALUES(1,'Ban 1','Dang su dung', 'KV01');
INSERT INTO BAN(maban, tenban, trangthai, makv)
VALUES(2,'Ban 2','Dang su dung', 'KV01');
INSERT INTO BAN(maban, tenban, trangthai, makv)
VALUES(3,'Ban 3', 'Dang su dung', 'KV01');
INSERT INTO BAN(maban, tenban, trangthai, makv)
VALUES(4,'Ban 4', 'Dang su dung', 'KV01');
INSERT INTO BAN(maban, tenban, trangthai, makv)
VALUES(5,'Ban 5', 'Dang su dung', 'KV01');
INSERT INTO BAN(maban, tenban, trangthai, makv)
VALUES(6,'Ban 6', 'Dang su dung', 'KV02');
INSERT INTO BAN(maban, tenban, trangthai, makv)
VALUES(7,'Ban 7', 'Dang su dung', 'KV02');
INSERT INTO BAN(maban, tenban, trangthai, makv)
VALUES(8,'Ban 8', 'Trong', 'KV02');
INSERT INTO BAN(maban, tenban, trangthai, makv)
VALUES(9,'Ban 9', 'Dang su dung', 'KV03');
INSERT INTO BAN(maban, tenban, trangthai, makv)
VALUES(10,'Ban 10', 'Trong', 'KV03');
SET IDENTITY_INSERT BAN OFF;
select * from ban;
-- Bang KHACHHANG
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(1, 'Le Ngoc Anh','Hoai Duc, Hà Noi', 0, '934473849');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(2, 'Nguyen Ngoc Binh','Hoang Mai, Ha Noi', 0, '889265612');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(3, 'Trinh Thi Minh Hai', 'Yen Trung, Bac Ninh', 0, '335547664');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(4, 'Pham Thi Minh Hue','Tam diep, Ninh Binh', 0, '963772609');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(5, 'Nguyen Thi Quynh Huong','Vinh, Nghe An', 0, '912101604');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(6, 'Tang Thuy Lien','Ba Dinh, Ha Noi', 0, '337981181');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(7, 'Nguyen Thao Linh','Yen Thanh, Nghe An', 0, '338214968');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(8, 'Vu Diep Linh','Dong Da, Ha Noi', 0, '977838802');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(9, 'Bui Hai Ngoc','Thanh Xuan, Ha Noi', 0, '966015048');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(10, 'Trinh Trung Nguyen','Hoang Mai, Ha Noi', 0, '388590853');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(11, 'Nguyen Thi Minh Quyen','Luong Tai, Bac Ninh', 0, '384482366');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(12, 'Nguyen Tien Thanh',N'Tien Du, Bac Ninh', 0, '359714398');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(13, 'Tran Thi Phuong Thao','Thanh Tri, Ha Noi', 0, '971391326');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(14, 'Nguyen Canh Toan','Thanh Xuan, Ha Noi', 0, '869684802');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(15, 'Le Huong Tra','Hai Ba Trung, Ha Noi', 0, '948873302');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(16, 'Dang The Tuan','Huu Lung, Lang Son', 0, '979817604');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(17, 'Vu Hai Yen','Kien Thuy, Hai Phong', 0, '971324055');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(18, 'Hua Ha Anh','Xuan Truong, Nam Dinh', 0, '914116175');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(19, 'Truong Thi Quynh Anh','Tu Ky, Hai Duong', 0, '378830894');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(20, 'Le Quang Ha','Dong Da, Ha Noi', 0, '387225588');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(21, 'Le Nam Hai','Vinh, Nghe An', 0, '949362250');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(22, 'Pham Thi Hong Hanh','Vinh, Nghe An', 0, '974746550');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(23, 'Nguyen Minh Hien','Yen Mo, Ninh Binh', 0, '904720362');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(24, 'Bui Khanh Huyen','Hoang Mai, Ha Noi', 0, '941468361');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(25, 'Bui Thi Hoai Linh','Vinh Tuong, Vinh Phuc', 0, '961852864');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(26, 'Nguyen Pham Thao Nguyen','Dong Anh, Ha Noi', 0, '968100168');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(27, 'Dinh Thi Phuong Thao','Bac Tu Liem, Ha Noi', 0, '966363509');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(28, 'Le Thi Thao','Thanh Chuong, Nghe An', 0, '877710656');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(29, 'Pham Thi Xoan','Dong Da, Ha Noi', 0, '388154372');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(30, 'Tran Tien Dung','Thanh Xuan, Ha Noi', 0, '388154372');
INSERT INTO KHACHHANG(makh, tenkh, diachi, diemtichluy,sdt)
VALUES(31, 'Bui Thi Xuan','Ba Dinh, Ha Noi', 0, '0368323551');
select * from khachhang;

-- Table MON
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('CF001','Capuchino', 50000, 'coffee');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('CF002','Expresso', 50000, 'coffee');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('CF003','Bac xiu', 40000, 'coffee');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('CF004','Mocha Macchiato', 50000, 'coffee');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('CF005','Den da', 35000, 'coffee');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('CF006','Americano', 50000, 'coffee');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('J001','Nuoc ep tao', 40000, 'juice');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('J002','Nuoc ep dua hau', 40000, 'juice');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('J003','Nuoc ep nho', 40000, 'juice');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('J004','Nuoc ep cam', 40000, 'juice');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('J005','Nuoc ep dua leo', 40000, 'juice');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('J006','Nuoc ep kiwi', 40000, 'juice');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('J007','Nuoc ep dau', 40000, 'juice');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('SM001','Sinh to ca chua', 40000, 'smoothie');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('SM002','Sinh to dua hau', 40000, 'smoothie');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('SM003','Sinh to thom', 40000, 'smoothie');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('SM004','Sinh to ca rot', 40000, 'smoothie');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('SM005','Sinh to ca chua', 40000, 'smoothie');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('SM006','Sinh to thap cam', 50000, 'smoothie');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('T001','Tra dao', 40000, 'tea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('T002','Tra dau', 40000, 'tea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('T003','Tra xanh', 30000, 'tea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('T004','Tra hoa lai', 40000, 'tea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('T005','Tra hoa hong', 40000, 'tea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('T006','Tra gung mat ong', 40000, 'tea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('T007','Tra matcha sua', 55000, 'tea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('T008','Tra tac', 30000, 'tea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('T009','Tra bi dao', 30000, 'tea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('MT001','Hong tra sua', 40000, 'milktea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('MT002','Tra sua Panda', 40000, 'milktea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('MT003','Tra sua Hokkaidou', 45000, 'milktea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('MT004','Tra sua bac ha', 40000, 'milktea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('MT005','Tra sua dau tay', 40000, 'milktea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('MT006','Tra sua o long', 40000, 'milktea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('MT007','Tra sua vanilla', 40000, 'milktea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('MT008','Tra sua dau do', 45000, 'milktea');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('SD001','Soda chanh duong', 30000, 'soda');
INSERT INTO MON(mamon, tenmon, gia,  maloaimon)
VALUES('SD002','Soda viet quat', 30000, 'soda');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('SD003','Soda kiwi dau', 30000, 'soda');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('SD004','Soda chanh bac ha', 30000, 'soda');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('SD005','Soda phuc bon tu', 30000, 'soda');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('SD006','Soda nhiet doi', 30000, 'soda');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('YG001','Sua chua chan trau duong den', 25000,'yogurt');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('YG002','Sua chua mit', 25000, 'yogurt');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('YG003','Sua chua dau', 24000, 'yogurt');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('YG004','Sua chua nho', 23000, 'yogurt');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('YG005','Sua chua nha dam', 27000, 'yogurt');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('SC001','So co la nong', 30000, 'chocolate');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('C001','Banh toffee', 80000, 'cake');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('C002','Banh kem pho mai', 69000, 'cake');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('C003','Banh so co la', 59000, 'cake');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('C004','Banh kem dau tay', 63000, 'cake');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('C005','Banh bong lan trung muoi', 57000,'cake');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('CR001','Kem dau tay', 32000, 'cream');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('CR002','Kem so co la', 19000, 'cream');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('CR003','Kem vanilla', 18000, 'cream');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('CR004','Kem sua dua', 15000, 'cream');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('CR005','Kem me den', 29000, 'cream');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('CR006','Kem thap cam', 50000, 'cream');
INSERT INTO MON(mamon, tenmon, gia, maloaimon)
VALUES('CR007','Kem matcha', 31000, 'cream');
select * from MON;

SET IDENTITY_INSERT NHANVIEN ON;
-- Table NHANVIEN
INSERT INTO NHANVIEN(manv, tennv, ngaysinh, diachi, sdt, hoatdong,  bophan,luong)
VALUES(1, 'Nguyen Hoai Thu Trang', '1998/2/5', 'Ha Dong, Ha Noi', '0932464213', 1, 'Phuc vu',  4000000);
INSERT INTO NHANVIEN(manv, tennv, ngaysinh, diachi, sdt, hoatdong,  bophan, luong)
VALUES(2, 'Truong Thi Thu Thuy', '1998/4/13', 'Cau Giay, Ha Noi', '0964521332', 1, 'Phuc vu', 4000000);
INSERT INTO NHANVIEN(manv, tennv, ngaysinh, diachi, sdt, hoatdong,  bophan, luong)
VALUES(3, 'Nguyen Tung Lam', '2000/7/13', 'Hoai Duc, Ha Noi', '0967884223', 1, 'Pha che', 5000000);
INSERT INTO NHANVIEN(manv, tennv, ngaysinh, diachi, sdt, hoatdong,  bophan, luong)
VALUES(4, 'Ha Minh Duc', '1997/12/8', 'Cam Pha, Quang Ninh', '0987632436', 1, 'Pha che', 5000000);
INSERT INTO NHANVIEN(manv, tennv, ngaysinh, diachi, sdt, hoatdong,  bophan, luong)
VALUES(5, 'Le Hong Anh', '1996/6/19', 'Van Giang, Hung Yen', '0998743215', 1, 'Thu ngân', 6000000);
INSERT INTO NHANVIEN(manv, tennv, ngaysinh, diachi, sdt, hoatdong,  bophan, luong)
VALUES(6, 'Tran Thi Thu Phuong', '1996/8/11', 'Thanh Xuan, Ha Noi', '0946342223', 1, 'Thu ngan', 6000000);
INSERT INTO NHANVIEN(manv, tennv, ngaysinh, diachi, sdt, hoatdong,  bophan, luong)
VALUES(7, 'Le Ngoc Huyen', '1994/4/17', 'Hoan Kiem, Ha Noi', '0971552222', 1, 'Quan li', 10000000);
INSERT INTO NHANVIEN(manv, tennv, ngaysinh, diachi, sdt, hoatdong,  bophan, luong)
VALUES(8, 'Nguyen Huu Da', '1978/9/18', 'Thanh Tri, Ha Noi', '0368836588', 1, 'Bao ve', 5000000);

select * from hoadon where MONTH(NgayGiao) = 2;
-- Table HOADON
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(1, '1/1/2022', '1/1/2022', 5, 1, 1);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(2, '1/1/2022', '1/1/2022', 5, 2, 2);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(3, '1/1/2022', '1/1/2022', 5, 3, 5);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(4, '1/1/2022', '1/1/2022', 5, 4, 6);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(5, '1/1/2022', '1/2/2022', 5, 5, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(6, '1/1/2022', '1/2/2022', 5, 6, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(7, '1/1/2022', '1/1/2022', 5, 7, 5);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(8, '1/1/2022', '1/3/2022', 5, 8, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(9, '1/2/2022', '1/2/2022', 5, 9, 9);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(10, '1/2/2022', '1/2/2022', 5, 10, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(11, '1/2/2022', '1/2/2022', 6, 11, 1);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(12, '1/2/2022', '1/2/2022', 6, 12, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(13, '1/2/2022', '1/2/2022', 6, 13, 3);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(14, '1/2/2022', '1/2/2022', 6, 14, 4);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(15, '1/2/2022', '1/2/2022', 6, 15, 1);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(16, '1/2/2022', '1/2/2022', 6, 16, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(17, '1/3/2022', '1/3/2022', 6, 17, 7);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(18, '1/3/2022', '1/3/2022', 6, 18, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(19, '1/3/2022', '1/3/2022', 6, 19, 8);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(20, '1/3/2022', '1/3/2022', 6, 20, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(21, '1/4/2022', '1/4/2022', 5, 21, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(22, '1/4/2022', '1/4/2022', 5, 3, 3);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(23, '1/5/2022', null, 5, 12, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(24, '1/5/2022', null, 5, 15, 3);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(25, '1/6/2022', '1/6/2022', 5, 18, 6);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(26, '1/7/2022', '1/7/2022', 5, 17, 10);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(27, '1/8/2022', '1/8/2022', 5, 4, 9);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(28, '1/8/2022', '1/8/2022', 5, 3, 4);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(29, '1/9/2022', '1/9/2022', 5, 5, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(30, '1/9/2022', '1/10/2022', 5, 21, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(31, '1/11/2022', '1/11/2022', 6, 24, 5);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(32, '1/12/2022', '1/12/2022', 6, 29, 1);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(33, '1/13/2022', '1/13/2022', 6, 22, 3);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(34, '1/14/2022', '1/14/2022', 6, 20, 5);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(35, '1/15/2022', '1/15/2022', 6, 21, 4);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(36, '1/16/2022', '1/16/2022', 6, 4, 2);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(37, '1/17/2022', '1/17/2022', 6, 3, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(38, '1/18/2022', '1/18/2022', 6, 14, 1);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(39, '1/19/2022', '1/19/2022', 6, 16, 7);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(40, '1/20/2022', '1/20/2022', 6, 19, 8);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(41, '1/21/2022', '1/21/2022', 6, 20, 10);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(42, '1/22/2022', '1/22/2022', 6, 10, 6);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(43, '1/23/2022', '1/23/2022', 5, 3, 9);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(44, '1/24/2022', '1/24/2022', 5, 15, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(45, '1/25/2022', '1/25/2022', 5, 13, 10);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(46, '1/26/2022', '1/26/2022', 6, 29, 3);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(47, '1/27/2022', '1/27/2022', 6, 21, 5);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(48, '1/28/2022', '1/28/2022', 5, 6, null);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(49, '1/29/2022', '1/29/2022', 5, 8, 7);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(50, '1/30/2022', '1/30/2022', 6, 3, 4);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(51, '1/31/2022', '1/31/2022', 6, 12, 5);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(52, '2/1/2022', '2/1/2022', 6, 18, 10);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(53, '2/2/2022', '2/2/2022', 6, 21, 2);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(54, '2/3/2022', '2/3/2022', 6, 3, 4);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(55, '2/3/2022', '2/3/2022', 6, 28, 4);
INSERT INTO HOADON(MaHD, NgayDat, NgayGiao, MaNV, MaKH, MaBan)
VALUES(56, '2/3/2022', '2/3/2022', 6, 31, 7);
select * from HOADON;

-- table CHITIETHD
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia, SoLuong)
VALUES(1, 'C001', 80000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(1, 'CF003', 40000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(2, 'SM001', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(3, 'YG001', 25000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(3, 'CR005', 29000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(4, 'YG003', 24000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(5, 'SD003', 30000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(5, 'C003', 59000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(6, 'CF006', 50000, 0,3);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(7, 'CF006', 50000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(8, 'J006', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(8, 'CR006', 50000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(9, 'MT005', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(9, 'MT003', 45000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(9, 'SD004', 30000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(10, 'MT004', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(11, 'MT007', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(12, 'C001', 80000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(13, 'J002', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(14, 'J001', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(14, 'J005', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(15, 'CR005', 29000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(16, 'CF005', 35000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(17, 'CF001', 50000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(18, 'C005', 57000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(19, 'C004', 63000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(20, 'SD001', 30000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(20, 'SD005', 30000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(21, 'SM004', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(21, 'SM001', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(21, 'T008', 30000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(22, 'SM001', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(23, 'YG005', 27000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(24, 'T006', 40000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(24, 'T002', 40000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(25, 'SM002', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(26, 'SD002', 30000, 0,5);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(27, 'SC001', 30000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(28, 'MT003', 45000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(29, 'CF001', 50000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(29, 'CF002', 50000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(30, 'CR004', 15000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(30, 'CR002', 19000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(30, 'J006', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(30, 'MT001', 40000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(31, 'J005', 40000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(32, 'CR001', 32000, 0,3);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(33, 'CF006', 50000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(34, 'CF006', 50000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(35, 'YG005', 27000, 0,4);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(36, 'YG002', 25000, 0,6);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(37, 'T007', 55000, 0,3);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(38, 'T004', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(39, 'T003', 30000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(40, 'SM001', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(41, 'T001', 40000, 0,5);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(41, 'SM006', 50000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(42, 'SM002', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(43, 'T006', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(44, 'T004', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(44, 'YG001', 25000, 0,3);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(44, 'SD005', 30000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(45, 'SM002', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(46, 'MT003', 40000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(46, 'MT002', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(47, 'MT006', 40000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(48, 'CR003', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(49, 'J004', 18000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(49, 'C005', 57000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia,GiamGia, SoLuong)
VALUES(50, 'CF004', 50000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(50, 'CF001', 50000, 0,3);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(50, 'CF004', 50000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(51, 'CF006', 50000, 0,3);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(51, 'C002', 69000, 0,3);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(51, 'SD002', 30000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(51, 'SD001', 30000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(52, 'CF002', 50000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(52, 'CF001', 50000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(52, 'CF003', 40000, 0,1);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(52, 'CF005', 35000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(53, 'CF005', 35000, 0,3);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(53, 'SM001', 40000, 0,3);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(53, 'SM002', 40000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(54, 'T007', 55000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(54, 'T004', 40000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(54, 'C005', 57000, 0,3);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(54, 'CF005', 45000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(55, 'MT008', 35000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(55, 'YG001', 25000, 0,4);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(55, 'MT003', 45000, 0,5);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia,SoLuong)
VALUES(55, 'C001', 80000, 0,5);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia, SoLuong)
VALUES(56, 'T006', 40000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia, SoLuong)
VALUES(56, 'MT002', 100000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia, SoLuong)
VALUES(56, 'MT007', 100000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia, SoLuong)
VALUES(56, 'MT001', 100000, 0,2);
INSERT INTO CHITIETHD(MaHD, MaMon, DonGia, GiamGia, SoLuong)
VALUES(56, 'C004', 100000, 0,6);
Select * from CHITIETHD;

SET IDENTITY_INSERT DONNHAPHANG ON; 
-- table DONNHAPHANG
INSERT INTO DONNHAPHANG(MaDNH, TenDNH, TrangThai, PhuongThucVanChuyen, NgayDatHang, NgayGiaoHang, NgayThanhToan, GhiChu, Chietkhau, MaNV)
VALUES(1, 'Don nhap trai cay thang 1/1/2022','Da nhan','Xe tai','1/1/2022','1/3/2022','1/1/2022','Da nhan hang vao 6h30p', 0.1, 1);
INSERT INTO DONNHAPHANG(MaDNH, TenDNH, TrangThai, PhuongThucVanChuyen, NgayDatHang, NgayGiaoHang, NgayThanhToan, GhiChu, Chietkhau, MaNV)
VALUES(2, 'Don nhap trai cay thang 2/1/2022','Da nhan','Xe tai','1/2/2022','1/4/2022','1/2/2022','Da nhan hang vao 6h45p', 0.05, 2);
INSERT INTO DONNHAPHANG(MaDNH, TenDNH, TrangThai, PhuongThucVanChuyen, NgayDatHang, NgayGiaoHang, NgayThanhToan, GhiChu, Chietkhau, MaNV)
VALUES(3, 'Don nhap ca phe thang 3/1/2022 ','Da nhan','Xe tai','1/3/2022','1/5/2022','1/3/2022','Da nhan hang vao 6h32p',0.04, 4);
INSERT INTO DONNHAPHANG(MaDNH, TenDNH, TrangThai, PhuongThucVanChuyen, NgayDatHang, NgayGiaoHang, NgayThanhToan, GhiChu, Chietkhau, MaNV)
VALUES(4, 'Don nhap kem thang 4/1/2022','Da nhan','Xe tai','1/4/2022','1/6/2022','1/6/2022','Da nhan hang vao 6h45p', 0.05, 5);
INSERT INTO DONNHAPHANG(MaDNH, TenDNH, TrangThai, PhuongThucVanChuyen, NgayDatHang, NgayGiaoHang, NgayThanhToan, GhiChu, Chietkhau, MaNV)
VALUES(5, N'Don nhap bot lam banh thang 5/1/2022','Da nhan','Xe tai','1/5/2022','1/7/2022','1/5/2022','Da nhan hang vao 6h45p',0.08, 1);
INSERT INTO DONNHAPHANG(MaDNH, TenDNH, TrangThai, PhuongThucVanChuyen, NgayDatHang, NgayGiaoHang, NgayThanhToan, GhiChu, Chietkhau, MaNV)
VALUES(6, 'Don nhap huong lieu thang 6/1/2022','Da nhan','Xe tai','1/6/2022','1/8/2022','1/6/2022','Da nhan hang vao 6h45p', 0.04, 3);
INSERT INTO DONNHAPHANG(MaDNH, TenDNH, TrangThai, PhuongThucVanChuyen, NgayDatHang, NgayGiaoHang, NgayThanhToan, GhiChu, Chietkhau, MaNV)
VALUES(7, 'Don nhap trai cay thang 7/1/2022','Da nhan','Xe oto','1/7/2022','1/9/2022','1/7/2022','Da nhan hang vao 6h23p', 0.1, 6);
INSERT INTO DONNHAPHANG(MaDNH, TenDNH, TrangThai, PhuongThucVanChuyen, NgayDatHang, NgayGiaoHang, NgayThanhToan, GhiChu, Chietkhau, MaNV)
VALUES(8, N'Don nhap dung cu 8/1/2022','Da nhan','Xe tai','1/8/2022','1/10/2022','1/8/2022','Da nhan hang vao 6h00p', 0.1, 5);
INSERT INTO DONNHAPHANG(MaDNH, TenDNH, TrangThai, PhuongThucVanChuyen, NgayDatHang, NgayGiaoHang, NgayThanhToan, GhiChu, Chietkhau, MaNV)
VALUES(9, 'Don nhap trai cay thang 9/1/2022','Da nhan','Xe tai','1/9/2022','1/10/2022','1/9/2022','Da nhan hang vao 6h00p',0.1, 2);
INSERT INTO DONNHAPHANG(MaDNH, TenDNH, TrangThai, PhuongThucVanChuyen, NgayDatHang, NgayGiaoHang, NgayThanhToan, GhiChu, Chietkhau, MaNV)
VALUES(10, 'Don nhap huong lieu thang 10/1/2022','Da nhan','Xe oto','1/10/2022','1/12/2022','1/10/2022','Da nhan hang vao 6h45p',0.1, 3);
SET IDENTITY_INSERT DONNHAPHANG OFF; 
select * from DONNHAPHANG;

SET IDENTITY_INSERT HANGHOA ON;
-- table HANGHOA
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(1, 'Bot ca phe','goi', 'Bot ca phe nguyen chat loai 750g', 1);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(2, 'Bot ca cao','goi', 'Bot ca cao nguyen chat loai 500g', 2);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(3, 'Bot kem tuoi Onemore vi tao','goi', 'Bot kem tuoi vi tao loai 800g', 5);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(4, 'Bot kem tuoi Onemore vi viet quat', 'goi','Bot kem tuoi vi viet quat loai 800g', 5);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(5, 'Bot kem tuoi Onemore vi tra xanh', 'goi','Bot kem tuoi vi tra xanh loai 800g', 5);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(6, 'Bot kem tuoi Onemore vi tra xanh','goi', 'Bot kem tuoi Onemore vi tra xanh loai 800g', 5);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(7, 'Tra sua o long Savi', 'tui','Tra sua o long thuong hieu Savi dang tui gia 500000/1kg', 4);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(8, 'Bot sua Almer', 'tui','Bot sua Almer gia 1500000/25kg', 4);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(9, 'Sua chua deo Onemore','hop', 'Sua chua deo Onemore hop gia 120000/2kg', 4);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(10, 'Kem pha che Icehot','hop', 'Kem pha che dang hop gia 800000/800g', 4);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(11, 'Hersey Syrup Chocolate', 'chai', 'Sot siro Hersey vi socola gia 150000/1.36kg', 4);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(12, 'Hersey Syrup Strawberry', 'chai', 'Sot siro Hersey vi dau tay gia 150000/1.36kg', 4);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(13, 'Hersey Syrup Caramel','chai', 'Sot siro Hersey vi Caramel gia 150000/1.36kg', 4);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(14, 'Noi nau chan chau tu dong', 'noi', 'Noi nau gia 3900000', 4);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(15, 'Binh u tra sua', 'binh','Binh loai 8 lit gia 400000/binh', 3);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(16, 'May dap nap coc','may', 'May dap nap coc tu dong gia 8000000', 4);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(17, 'May dao tra', 'may','May dao tra e-Blenders gia 3500000', 4);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(18, 'Tao Ambrosia Newzealand', 'kg', 'Tao nhap khau Newzealand gia 129000/kg', 6);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(19, 'Nho ngon tay Uc', 'kg', 'Nho nhap khau Uc gia 199000/kg', 6);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(20, 'Kiwi vang Newzealand','kg', 'Kiwi nhap khau Newzealand gia 149000/kg', 6);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(21, 'Nho do khong hat My', 'kg','Nho nhap khau My gia 129000/kg', 6);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(22, 'Nho den khong hat My', 'kg','Nho nhap khau My gia 99000/kg', 6);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(23, 'Tao Envy Newzealand ', 'kg','Tao nhap khau Newzealand gia 199000/kg', 6);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(24, 'Nho xanh khong hat My','kg', 'Nho nhap khau My gia 109000/kg', 6);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(25, 'Cherry do Canada', 'kg','Cherry nhap khau Canada gia 219000/kg', 6);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(26, 'Cherry do My', 'kg','Cherry nhap khau My gia 250000/kg', 6);
INSERT INTO HANGHOA(MaHH, TenHH, DonVi, MoTa, MaNCC)
VALUES(27, 'Bot lam banh','kg', 'Bot lam banh 500g gia 100000/kg', 3);
select * from hanghoa;
SET IDENTITY_INSERT HANGHOA OFF;

SET IDENTITY_INSERT CHITIETHOADONNHAP ON;
-- table NHAPHANG
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(1, 18, 129000, 30);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(1, 19, 199000, 20);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(2, 20, 149000, 25);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(2, 21, 129000, 30);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(2, 22, 99000, 25);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(7, 23, 199000, 20);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(7, 24, 109000, 20);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(9, 25, 219000, 25);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(9, 26, 250000, 10);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(3, 1, 70000, 50);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(3, 2, 75000, 40);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(4, 3, 80000, 10);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(4, 4, 80000, 10);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(4, 5, 80000, 10);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(4, 6, 80000, 10);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(5, 27, 100000, 10);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(6, 7, 500000, 5);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(6, 8, 1500000, 2);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(10, 9, 120000, 5);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(10, 10, 800000, 2);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(10, 11, 150000, 5);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(10, 12, 150000, 5);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(10, 13, 150000, 5);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(8, 14, 3900000, 1);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(8, 15, 400000, 3);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(8, 16, 8000000, 1);
INSERT INTO CHITIETHOADONNHAP(MaDNH, MaHH, DonGia, SoLuongNhap)
VALUES(8, 17, 3500000, 1);
SET IDENTITY_INSERT CHITIETHOADONNHAP OFF;
select * from chitiethoadonnhap;


-- Dam bao du lieu o cot: gia trong bang MON bang du lieu o cot: dongia trong chitiethoadon
SET SERVEROUTPUT ON
CREATE PROCEDURE PRO_MON_CHITIETHD_DonGia
BEGIN   
    UPDATE CHITIETHD
    SET DonGia = (SELECT Gia FROM MON WHERE CHITIETHD.MaMon = Mon.MaMon);
    print('Thong bao: Cap nhat du lieu thanh cong');
END;
select * from CHITIETHD;
EXEC PRO_MON_CHITIETHD_DonGia;

-- 1.Cho bi?t t?ng s? ??n hàng ??t trong tháng 1 n?m 2021
SELECT count(MaHD) from HOADON
where EXTRACT(YEAR from ngaydat) = 2021
and EXTRACT(MONTH from ngaydat) = 1;
--2.Tính t?ng ti?n c?a m?i hóa ??n
SELECT MaHD, sum(dongia * soluong) TongTien
from CHITIETHD
group by MaHD
order by tongtien DESC;
--3.Tính t?ng doanh thu c?a c?a hàng 
Select sum(TongTien) 
from
(
    SELECT MaHD, sum(dongia * soluong) TongTien
    from CHITIETHD
    group by MaHD
); 
-- 4.Cho bi?t danh sách nh?ng hóa ??n nhân viên tên Lê H?ng Anh ?ã l?p
SELECT MaHD, Ngaydat, NgayGiao 
from HOADON hd 
JOIN NHANVIEN nv ON hd.MaNV = nv.MaNV
WHERE TenNV = N'Lê H?ng Anh';

-- 5.Cho bi?t các hàng hóa ???c phân ph?i b?i nhà cung c?p là Công Ty TNHH Tâm Châu
SELECT MaHH, TenHH 
from HANGHOA hh join NHACUNGCAP ncc
ON hh.MaNCC = NCC.MaNCC
WHERE TenNCC =  'Công Ty TNHH Tâm Châu';

-- 6.Cho bi?t danh sách các ?? u?ng cà phê
-- Cach 1:
Select * from MON 
where SUBSTR(MaMon, 1,2) = 'CF';
-- Cach 2:
Select * from MON 
where maloaimon = 'coffee';

-- 7.Cho bi?t lo?i ?? u?ng/bánh ???c bán ch?y nh?t c?a hàng
Select CT.MaMon, TenMon, Sum(SoLuong) SLBR
from CHITIETHD CT join MON M
on CT.MaMon = M.MaMon
group by CT.MaMon, TenMon
having Sum(SoLuong) >= ALL(select sum(SoLuong) from CHITIETHD group by MaMon);
-- 8.Cho bi?t danh sách nh?ng khách hàng ?ã quay l?i c?a hàng sau l?n mua ??u tiên
Select HD.MaKH, TenKH, SDT, count(HD.MaHD)
from HOADON HD 
JOIN KHACHHANG KH
ON HD.MAKH = KH.MAKH
group by HD.MaKH, TenKH, SDT
having count(HD.MaHD) >= 2;
-- 9.Cho bi?t danh sách nh?ng bàn ?ang tr?ng
Select MaBan, TenBan from BAN 
WHERE TrangThai = N'Tr?ng';
-- 10. ??a ra hóa ??n bán hàng g?n nh?t.
Select MaHD, Ngaydat, Ngaygiao, MaNV 
from HOADON
where sysdate - Ngaydat = (Select MIN(sysdate - ngaydat) from HOADON);    

-- Th?c hi?n 10 yêu c?u nghi?p v? ch?c n?ng phù h?p (dùng PLSQL)
-- 1. Cho bi?t danh sách các hóa ??n theo ngày nh?p vào 
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE pro_hd_day(ngaynhap IN hoadon.ngaydat%type)
IS 
BEGIN   
    FOR item in(Select mahd, ngaydat, ngaygiao, manv
                from HOADON
                where ngaydat = ngaynhap)
    LOOP
        dbms_output.put_line('Ma hoa don: '||item.MaHD||', NgayDat: '||item.NgayDat||
                    ', Ngay giao:'||item.ngaygiao||', nhan vien lap hoa don: '||item.MaNV);
    END LOOP;
END;

EXEC pro_hd_day(to_date('&ngaynhap','dd/mm/yyyy'));
-- 2.Cho bi?t thông tin nhân viên theo mã nhân viên nh?p vào
SET SERVEROUTPUT ON
DECLARE
    ma_nhan_vien nhanvien.manv%TYPE;
BEGIN
    ma_nhan_vien := &ma_nhan_vien;
    for item IN (Select manv, tennv, ngaysinh, diachi, sdt, ngayvaolam
                from nhanvien
                where manv = ma_nhan_vien)
      LOOP
        DBMS_OUTPUT.PUT_LINE
          ('Ma nhan vien: ' || item.manv || ' , ten nhan vien: ' 
          || item.tennv || ', ngay sinh: '|| item.ngaysinh || ', dia chi: ' || item.diachi ||
            ', ngay vao lam: '||item.ngayvaolam);
      END LOOP;
END;

-- 3.Cho bi?t doanh thu theo ngày nh?p vào
CREATE OR REPLACE FUNCTION dt_day(ngaynhap IN HOADON.Ngaydat%type)
RETURN NUMBER
AS
    Tong_Tien Number;
BEGIN 
    SELECT sum(SoLuong * DonGia)
    INTO Tong_Tien
    FROM HOADON HD join CHITIETHD CT ON hd.mahd = ct.mahd
    WHERE ngaydat = ngaynhap
    GROUP BY ngaydat;
    RETURN Tong_Tien;
END;

Select dt_day(to_date('&ngaynhap','dd/mm/yyyy')) from dual;

-- 3.Cho bi?t các khách hàng có ??a ch? ? Hà N?i
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE dc_hn
IS
BEGIN
    FOR item in (Select makh, tenkh, diachi from KHACHHANG where SUBSTR(diachi, -6) = 'Ha Noi')
    LOOP 
        dbms_output.put_line('MaKH: '||item.MaKH||', ten khach hang: '||item.tenKH
                            ||', dia chi: '||item.diachi);
    END LOOP;
END;

EXEC dc_hn;

-- 4.Cho bi?t nh?ng hóa ??n ch?a ???c giao t?i khách (ngày giao hàng b?ng r?ng)
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE hd_chuagiao
IS
BEGIN
    FOR item in(Select mahd, ngaydat, manv
                from HOADON
                where ngaygiao is null)
    LOOP
        dbms_output.put_line('Ma hoa don: '||item.MaHD||', NgayDat: '||item.NgayDat
                    ||', nhan vien lap hoa don: '||item.MaNV);
    END LOOP;
END;

EXEC hd_chuagiao;

-- 5. Viet thu tuc dua ra thông báo kiem tra xem món này lieu có trong cua hàng hay không 
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE pro_mon_buy(tm IN Mon.TenMon%type)
IS 
    ten_mon mon.tenmon%type;
BEGIN
    SELECT tenmon
    INTO ten_mon
    from MON
    where tenmon = tm;
    
    IF ten_mon = tm then 
        dbms_output.put_line(ten_mon||' co trong cua hang'); 
    END IF;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN dbms_output.put_line('Mon chua duoc ban hoac ban da nhap sai! Chu cai dau cua mon phai viet hoa');
END;

EXEC pro_mon_buy('&mm');

-- 6. Cho bi?t s? l??ng hóa ??n m?i nhân viên ?ã nh?p theo mã nhân viên nh?p vào
CREATE OR REPLACE FUNCTION nv_sohoadon(mnv IN HOADON.MaNV%type)
RETURN NUMBER
AS
    shd number;
BEGIN
    select count(mahd) 
    into shd
    from HOADON
    where mnv = manv;
    return shd;
END;

SELECT nv_sohoadon('&mnv') from dual;

-- 7. Cho biet danh sach hoa don co gia tri tren 100.000d
SET SERVEROUTPUT ON 
DECLARE
BEGIN
    for item in(SELECT MaHD, sum(dongia * soluong) TongTien
                from CHITIETHD
                group by MaHD
                having sum(dongia * soluong) > 100000)
    LOOP
        dbms_output.put_line('Ma hoa don: '||item.MaHD||', tong tien: '||item.TongTien);    
    END LOOP;
END;

-- 8. Tra ve so luong ban theo khu vuc
CREATE OR REPLACE FUNCTION ban_kv(mkv IN BAN.MaKV%type)
RETURN NUMBER
AS
    sb number;
BEGIN
    select count(maban) 
    into sb
    from BAN
    where mkv = makv
    group by makv;
    return sb;
END;

SELECT ban_kv('&mkv') from dual;

-- 8. C?p nh?t gi?m giá ch? nh?ng m?t hàng trà s?a là 0.05 (5%)
SET SERVEROUTPUT ON 
DECLARE
BEGIN
    UPDATE CHITIETHD
    SET GiamGia = 0.05 
    WHERE SUBSTR(MaMon, 1,2) = 'MT';
END;

select * from chitiethd where SUBSTR(MaMon, 1,2) = 'MT';

-- 9. Tính l?i giá c?a các hóa ??n có m?t hàng trà s?a
SET SERVEROUTPUT ON 
DECLARE
BEGIN
    for item in(SELECT MaHD, sum((dongia * soluong)*(1 - giamgia)) TongTien
                from CHITIETHD
                where MaHD in (select MaHD from CHITIETHD where SUBSTR(MaMon, 1,2) = 'MT')
                group by MaHD)
    LOOP
        dbms_output.put_line('Ma hoa don: '||item.MaHD||', tong tien sau khi giam gia: '||item.TongTien);    
    END LOOP;
END;
-- truoc khi co giam gia
SELECT MaHD, sum((dongia * soluong)) TongTien
from CHITIETHD
group by MaHD;