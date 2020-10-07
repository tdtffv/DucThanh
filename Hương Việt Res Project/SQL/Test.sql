﻿USE HuongViet
GO

--TEST HƯƠNG VIỆT
--INSERT DỮ LIỆU TEST

INSERT INTO CHINHANH VALUES(1,N'CN1',N'612 Ngô Gia Tự','6','11',N'TP HCM','0672346272')
GO
SELECT*FROM CHINHANH

INSERT INTO THANHVIEN VALUES(1,N'Dương Khánh Vi','1','365213809','1999-04-24',N'Tiệm cầm đồ Anh Vũ, Huyện An Phú, Tỉnh An Giang',1,'quinnduong99@gmail.com',4900000,'Silver')
GO
SELECT*FROM THANHVIEN

INSERT INTO NHANVIEN VALUES(1,1,N'Trần Quốc Bảo',N'1230, Đào Duy Từ, Quận 10, TPHCM',N'Giao hàng'),
							(2,1,N'Nguyễn Thị Ngọc Hân',N'333, Cao Thắng, Quận 11, TPHCM',N'Lễ tân')
GO
SELECT*FROM NHANVIEN

INSERT INTO LOAIMON VALUES(1,N'Nước'),(2,N'Cơm')
GO
SELECT*FROM LOAIMON

INSERT INTO MONAN VALUES(1,N'Cơm sườn 2 trứng',2,30000),(2,N'Cơm gà xối mỡ',2,25000),(3,N'Cam ép',1,20000),(4,N'Coca cola',1,10000)
GO
SELECT*FROM MONAN

INSERT INTO THUCDON VALUES(1,1,'2016-10-05',700,57),(1,2,'2016-12-15',90,72),(1,3,'2016-08-19',1000,857),(1,4,'2016-07-05',9800,6753)
GO
SELECT*FROM THUCDON


--INSERT ĐƠN HÀNG
EXEC sp_InDH 
	@MANV=2,
	@MATV=1,
	@MACN=1,
	@KENHDH=N'Điện thoại',
	@PTTT=N'Trực tiếp'
GO

EXEC sp_InDH 
	@MANV=2,
	@MATV=1,
	@MACN=1,
	@KENHDH=N'Online',
	@PTTT=N'Trực tiếp'
GO
SELECT*FROM DONHANG

--NHÂN VIÊN CẬP NHẬT TÌNH TRẠNG ĐƠN HÀNG
EXEC sp_UpDH @MADH=1,@TRANGTHAI=N'Hoàn tất'
GO
SELECT*FROM DONHANG
SELECT*FROM THANHVIEN

--KHÁCH HOẶC NHÂN VIÊN HỦY ĐƠN
EXEC sp_UpDH_HuyDon @MADH=2,@HUYDON=1
GO

--CHI TIẾT ĐƠN HÀNG
--INSERT
EXEC sp_InCTDH 2,3,21
GO

EXEC sp_InCTDH 3,4,9
GO

--UPDATE
EXEC sp_UpCTDH @MADH=2,@MAMON=1,@SL=14
GO

EXEC sp_UpCTDH 3,1,4
GO

--DELETE
EXEC sp_DelCTDH 3,4,NULL,'D'
GO

SELECT*FROM CHITIETDONHANG
SELECT*FROM DONHANG
GO

--ĐƠN HÀNG TRỰC TUYẾN
--INSERT 
EXEC sp_InDHTT @MADH=3,
	@NVGIAOHANG=1,
	@TENKH=N'A',
	@SDT='0222222123',
	@SONHA='1',
	@PHUONG='1',
	@QUAN_HUYEN=N'Huyện Nhà Bè',
	@TINH_TP=N'TP HCM'
GO

SELECT*FROM DHTRUCTUYEN
SELECT*FROM DONHANG
SELECT*FROM NHANVIEN
SELECT*FROM CHINHANH
GO

--UPDATE
EXEC sp_UpDHTT 3,1
GO

--KHÔNG CHO PHÉP DELETE