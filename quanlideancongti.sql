create database quanlideancongti
use quanlideancongti
create table Nhanvien
(
	HONV nvarchar(15),
	TENLOT nvarchar(15),
	TENNV nvarchar(15),
	MANV char(9) NOT NULL,
	NGSINH datetime,
	DCHI nvarchar(30),
	PHAI nvarchar(3),
	LUONG float,
	MA_NQL char(9),
	PHG int,
	constraint PK_MANV primary key (MANV)
)
create table Phongban
(
	TENPHG nvarchar(15),
	MAPHG int not null,
	TRPHG char(9),
	NG_NHANCHUC datetime,
	constraint PK_MAPHG primary key (MAPHG)
)
create table Diadiem
(
	MAPHG int not null,
	DIADIEM nvarchar(15) not null,
	constraint PK_MAPHG_DIADIEM primary key(MAPHG,DIADIEM)
)
create table Dean
(
	TENDA nvarchar(15),
	MADA int not null,
	DDIEM_DA nvarchar(15),
	PHONG int,
	constraint PK_MADA primary key (MADA)
)
create table Congviec
(
	MADA int not null,
	STT int not null,
	TEN_CONG_VIEC nvarchar(50),
	constraint PK_MADA_STT primary key (MADA,STT)
)
create table Phancong
(
	MA_NVIEN CHAR(9) not null,
	MADA int not null,
	STT int not null,
	THOIGIAN float,
	constraint PK_MANVIEN_MADA_STT primary key (MA_NVIEN, MADA,STT)
)
create table Thannhan
(
	MA_NVIEN CHAR(9) not null,
	TENTN nvarchar(50) not null,
	PHAI nvarchar(3),
	NGSINH datetime,
	QUANHE nvarchar(50),
	constraint PK_MANVIEN_TENTN primary key (MA_NVIEN, TENTN)
)
alter table Dean
add constraint FK_Dean_Phongban foreign key (PHONG)
references Phongban (MAPHG)

alter table Diadiem
add constraint FK_Diadiemphg_Phongban foreign key (MAPHG)
references Phongban (MAPHG)

alter table Nhanvien
add constraint FK_Nhanvien_Phongban foreign key (PHG)
references Phongban (MAPHG)

alter table Phongban
add constraint FK_Phongban_Nhanvien foreign key (TRPHG)
references Nhanvien (MANV)

alter table Phancong
add constraint FK_Phancong_Nhanvien foreign key (MA_NVIEN)
references Nhanvien (MANV)

alter table Thannhan
add constraint FK_Thannhan_Nhanvien foreign key (MA_NVIEN)
references Nhanvien (MANV)

alter table Nhanvien
add constraint FK_Nhanvien_Nhanvien foreign key (MA_NQL)
references Nhanvien (MANV)

alter table Congviec
add constraint FK_Congviec_Dean foreign key (MADA)
references Dean (MADA)

alter table Phancong
add constraint FK_Phancong_Congviec foreign key (MADA,STT)
references Congviec (MADA,STT)

insert into Nhanvien (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG)
VALUES	(N'Đinh',N'Bá',N'Tiên', '009','11/02/1960',N'119 Cống Quỳnh, Tp HCM',N'Nam',30000,NULL,NULL)

insert into Nhanvien (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG)
VALUES	(N'Nguyễn',N'Thanh',N'Tùng','005','08/20/1962',N'222 Nguyễn Văn Cừ, Tp HCM',N'Nam',40000, NULL, NULL)

insert into Nhanvien (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG)
VALUES	(N'Bùi',N'Ngọc',N'Hằng', '007','03/11/1954',N'332 Nguyễn Thái Học, Tp HCM',N'Nam',25000,NULL,NULL)

insert into Nhanvien (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG)
VALUES	(N'Lê',N'Quỳnh',N'Như', '001','02/01/1967',N'291 Hồ Văn Huê, Tp HCM',N'Nữ',43000,NULL,NULL)

insert into Nhanvien (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG)
VALUES	(N'Nguyễn',N'Mạnh',N'Hùng', '004','03/04/1967',N'95 Bà Rịa, Vũng Tàu',N'Nam',38000,NULL,NULL)

insert into Nhanvien (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG)
VALUES	(N'Trần',N'Thanh',N'Tâm', '003','05/04/1957',N'34 Mai Thị Lự, Tp HCM',N'Nam',25000,NULL,NULL)

insert into Nhanvien (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG)
VALUES	(N'Trần',N'Hồng',N'Quang', '008','09/01/1967',N'80 Lê Hồng Phong, Tp HCM',N'Nam',25000,NULL,NULL)

insert into Nhanvien (HONV,TENLOT,TENNV,MANV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG)
VALUES	(N'Phạm',N'Văn',N'Vinh', '006','01/01/1965',N'45 Trưng Vương, Hà Nội',N'Nữ',55000,NULL,NULL)

insert into Phongban(TENPHG,MAPHG,TRPHG,NG_NHANCHUC)
VALUES (N'Nghiên cứu', '5','005','05/22/1978')

insert into Phongban(TENPHG,MAPHG,TRPHG,NG_NHANCHUC)
VALUES (N'Điều hành', '4','008','01/01/1985')

insert into Phongban(TENPHG,MAPHG,TRPHG,NG_NHANCHUC)
VALUES (N'Quản lý', '1','006','06/19/1971')

insert into Diadiem(MAPHG,DIADIEM)
VALUES ('1','Tp HCM')

insert into Diadiem(MAPHG,DIADIEM)
VALUES ('4',N'Hà Nội')

insert into Diadiem(MAPHG,DIADIEM)
VALUES ('5','TAU')

insert into Dean(TENDA,MADA,DDIEM_DA,PHONG)
VALUES ('San pham X', '1', N'Vũng Tàu', '5')

insert into Dean(TENDA,MADA,DDIEM_DA,PHONG)
VALUES ('San pham Y', '2', 'Nha Trang', '5')

insert into Dean(TENDA,MADA,DDIEM_DA,PHONG)
VALUES ('San pham Z', '3', 'TP HCM', '5')

insert into Dean(TENDA,MADA,DDIEM_DA,PHONG)
VALUES ('Tin hoc hoa', '10', N'Hà Nội', '4')

insert into Dean(TENDA,MADA,DDIEM_DA,PHONG)
VALUES ('Cap quang', '20', 'TP HCM', '1')

insert into Dean(TENDA,MADA,DDIEM_DA,PHONG)
VALUES ('Dao tao', '30', N'Hà Nội', '4')

insert into Congviec(MADA,STT,TEN_CONG_VIEC)
VALUES ('1', '1', 'Thiet ke san pham X')

insert into Congviec(MADA,STT,TEN_CONG_VIEC)
VALUES ('1', '2', 'Thu nghiem san pham X')

insert into Congviec(MADA,STT,TEN_CONG_VIEC)
VALUES ('2', '1', 'San xuat san pham Y')

insert into Congviec(MADA,STT,TEN_CONG_VIEC)
VALUES ('2', '2', 'Quang cao san pham Y')

insert into Congviec(MADA,STT,TEN_CONG_VIEC)
VALUES ('3', '1', 'Khuyen mai san pham Z')

insert into Congviec(MADA,STT,TEN_CONG_VIEC)
VALUES ('10', '1', 'Tin hoc hoa nhan su tien luong')

insert into Congviec(MADA,STT,TEN_CONG_VIEC)
VALUES ('10', '2', 'Tin hoc hoa phong Kinh doanh')

insert into Congviec(MADA,STT,TEN_CONG_VIEC)
VALUES ('20', '1', 'Lap dat cap quang')

insert into Congviec(MADA,STT,TEN_CONG_VIEC)
VALUES ('30', '1', 'Dao tao nhan vien Marketing')

insert into Congviec(MADA,STT,TEN_CONG_VIEC)
VALUES ('30', '2', 'Dao tao chuyen vien vien thiet ke')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('009', '1', '1', '32')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('009', '2', '2', '8')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('004', '3', '1', '40')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('003', '1', '2', '20.0')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('003', '2', '1', '20.0')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('008', '10', '1', '35')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('008', '30', '2', '5')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('001', '30', '1', '20')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('001', '20', '1', '15')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('006', '20', '1', '30')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('005', '3', '1', '10')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('005', '10', '2', '10')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('005', '20', '1', '10')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('007', '30', '2', '30')

insert into Phancong(MA_NVIEN,MADA,STT,THOIGIAN)
VALUES ('007', '10', '2', '10')

insert into Thannhan(MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE)
VALUES ('005', 'Trinh', N'Nữ', '04/05/1976', 'Con gái')

insert into Thannhan(MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE)
VALUES ('005', 'Khang', 'Nam', '10/25/1973', 'Con trai')

insert into Thannhan(MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE)
VALUES ('005', N'Phương', N'Nữ', '05/03/1948', N'Vợ chồng')

insert into Thannhan(MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE)
VALUES ('001', 'Minh', 'Nam', '02/29/1932', N'Vợ chồng')

insert into Thannhan(MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE)
VALUES ('009', N'Tiến', 'Nam', '01/01/1978', 'Con trai')

insert into Thannhan(MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE)
VALUES ('009', N'Châu', N'Nữ', '12/30/1978', 'Con gái')

insert into Thannhan(MA_NVIEN,TENTN,PHAI,NGSINH,QUANHE)
VALUES ('009', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng')

update Nhanvien
set MA_NQL='005', PHG='5'
where MANV='009'

update Nhanvien
set MA_NQL='006', PHG='5'
where MANV='005'

update Nhanvien
set MA_NQL='001', PHG='4'
where MANV='007'

update Nhanvien
set MA_NQL='006', PHG='4'
where MANV='001'

update Nhanvien
set MA_NQL='005', PHG='5'
where MANV='003'

update Nhanvien
set MA_NQL=null, PHG='1'
where MANV='006'



