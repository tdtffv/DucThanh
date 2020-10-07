﻿-------------------------------------------THÊM DỮ LIỆU CHO CÁC BẢNG LIÊN QUAN ĐẾN DEMO TRANH CHẤP------------------------------------------------
--THÊM DỮ LIỆU CHO BẢNG CHI NHÁNH
INSERT INTO CHINHANH1 VALUES (1,N'CHI NHÁNH 1',N'777 NGUYỄN THIỆN THUẬT',N'PHƯỜNG 12',N'QUẬN 3',N'THÀNH PHỐ HCM','0987567112')
INSERT INTO CHINHANH1 VALUES (2,N'CHI NHÁNH 2',N'98 NGUYỄN THI MINH KHAI',N'PHƯỜNG BẾN NGHÉ',N'QUẬN 1',N'THÀNH PHỐ HCM','0987567113')
INSERT INTO CHINHANH1 VALUES (3,N'CHI NHÁNH 3',N'110 LÝ THƯỜNG KIỆT',N'PHƯỜNG 5',N'QUẬN 11',N'THÀNH PHỐ HCM','0987567114')

--THÊM DỮ LIỆU CHO BẢNG MÓN ĂN
INSERT INTO MONAN VALUES (1,N'PHỞ',1,50000)
INSERT INTO MONAN VALUES (2,N'BÚN CHẢ',1,50000)
INSERT INTO MONAN VALUES (3,N'BÚN NEM NƯỚNG',1,40000)
INSERT INTO MONAN VALUES (4,N'CƠM CHIÊN',2,30000)
INSERT INTO MONAN VALUES (5,N'BÁNH XÈO',3,30000)
INSERT INTO MONAN VALUES (6,N'BÁNH BÈO',3,25000)
INSERT INTO MONAN VALUES (7,N'BÁNH KHỌT',3,20000)
INSERT INTO MONAN VALUES (8,N'CHÈ BƯỞI',4,20000)
INSERT INTO MONAN VALUES (9,N'CHÈ HẠT SEN',4,20000)
INSERT INTO MONAN VALUES (10,N'CHÈ KHÚC BẠCH',4,30000)

--THÊM DỮ LIỆU CHO BẢNG LOẠI MÓN ĂN
INSERT INTO LOAIMON VALUES (1,N'MÓN NƯỚC')
INSERT INTO LOAIMON VALUES (2,N'CƠM')
INSERT INTO LOAIMON VALUES (3,N'BÁNH MẶN')
INSERT INTO LOAIMON VALUES (4,N'CHÈ')

--THÊM DỮ LIỆU CHO BẢNG THỰC ĐƠN
INSERT INTO THUCDON VALUES (1,1,'2019-01-01',50,50)
INSERT INTO THUCDON VALUES (1,2,'2019-01-01',50,50)
INSERT INTO THUCDON VALUES (1,3,'2019-01-01',50,50)
INSERT INTO THUCDON VALUES (1,4,'2019-01-01',50,50)
INSERT INTO THUCDON VALUES (1,5,'2019-01-01',50,50)
INSERT INTO THUCDON VALUES (1,6,'2019-01-01',50,50)
INSERT INTO THUCDON VALUES (1,7,'2019-01-01',50,50)
INSERT INTO THUCDON VALUES (1,8,'2019-01-01',50,50)
INSERT INTO THUCDON VALUES (1,9,'2019-01-01',50,50)
INSERT INTO THUCDON VALUES (1,10,'2019-01-01',50,50)

--THÊM DỮ LIỆU CHO BẢNG NHÂN VIÊN
INSERT INTO NHANVIEN VALUES (1,1,N'NGUYỄN THỊ A',N'390 CAO THẮNG, PHƯỜNG 12, QUẬN 10, TP HCM',N'QUẢN LÝ CHI NHÁNH')
INSERT INTO NHANVIEN VALUES (2,1,N'NGUYỄN THỊ B',N'390 CAO THẮNG, PHƯỜNG 12, QUẬN 10, TP HCM',N'QUẢN LÝ KHÁCH HÀNG')
INSERT INTO NHANVIEN VALUES (3,1,N'NGUYỄN VĂN C',N'390 CAO THẮNG, PHƯỜNG 12, QUẬN 10, TP HCM',N'GIAO HÀNG')
INSERT INTO NHANVIEN VALUES (4,2,N'NGUYỄN THỊ A',N'390 CAO THẮNG, PHƯỜNG 12, QUẬN 10, TP HCM',N'QUẢN LÝ CHI NHÁNH')
INSERT INTO NHANVIEN VALUES (5,2,N'NGUYỄN THỊ B',N'390 CAO THẮNG, PHƯỜNG 12, QUẬN 10, TP HCM',N'QUẢN LÝ KHÁCH HÀNG')
INSERT INTO NHANVIEN VALUES (6,2,N'NGUYỄN VĂN C',N'390 CAO THẮNG, PHƯỜNG 12, QUẬN 10, TP HCM',N'GIAO HÀNG')
INSERT INTO NHANVIEN VALUES (7,3,N'NGUYỄN THỊ A',N'390 CAO THẮNG, PHƯỜNG 12, QUẬN 10, TP HCM',N'QUẢN LÝ CHI NHÁNH')
INSERT INTO NHANVIEN VALUES (8,3,N'NGUYỄN THỊ B',N'390 CAO THẮNG, PHƯỜNG 12, QUẬN 10, TP HCM',N'QUẢN LÝ KHÁCH HÀNG')
INSERT INTO NHANVIEN VALUES (9,3,N'NGUYỄN VĂN C',N'390 CAO THẮNG, PHƯỜNG 12, QUẬN 10, TP HCM',N'GIAO HÀNG')
GO

--THÊM DỮ LIỆU CHO BẢNG THÀNH VIÊN
INSERT INTO THANHVIEN VALUES (1,N'AAA',1,'321456984','2000-03-17',N'112 Nguyễn Văn Cừ, Phường 6, Quận 5',1,'AAA@GMAIL.COM',NULL,'SILVER')
INSERT INTO THANHVIEN VALUES (2,N'AAB',1,'321456985','1998-08-09',N'237 Nguyễn Đình Chiểu, Phường 5, Quận 3',1,'AAB@GMAIL.COM',NULL,'SILVER')
INSERT INTO THANHVIEN VALUES (3,N'AAC',1,'321456986','1980-11-13',N'88 Cao Thắng, Phường 12, Quận 10',1,'AAC@GMAIL.COM',NULL,'SILVER')
INSERT INTO THANHVIEN VALUES (4,N'BBA',1,'321456903','2000-03-17',N'270 Võ Văn Ngân, Phường 4, Quận Thủ Đức',2,'BBA@GMAIL.COM',NULL,'SILVER')
INSERT INTO THANHVIEN VALUES (5,N'BBB',1,'321456954','2002-09-20',N'70 Dương Gia Trí, Phường 8, Quận Bình Thạnh',2,'BBB@GMAIL.COM',NULL,'SILVER')
INSERT INTO THANHVIEN VALUES (6,N'BBC',1,'321456955','1970-03-17',N'325 Nguyễn Hữu Cảnh, Phường 7, Quận 2',2,'BBC@GMAIL.COM',NULL,'SILVER')
INSERT INTO THANHVIEN VALUES (7,N'CCA',1,'321456922','1994-06-30',N'23 Phạm Ngũ Lão, Phường ĐaKao, Quận 1',3,'CCA@GMAIL.COM',NULL,'SILVER')
INSERT INTO THANHVIEN VALUES (8,N'CCB',1,'321456923','1992-05-05',N' 146 Tên Lửa, Phường 4, Quận Bình Tân',3,'CCB@GMAIL.COM',NULL,'SILVER')
INSERT INTO THANHVIEN VALUES (9,N'CCC',1,'321456924','1996-10-12',N'259 Khuông Việt, Phường 3, Quận Tân Phú',3,'CCC@GMAIL.COM',NULL,'SILVER')
INSERT INTO THANHVIEN VALUES (23,N'BCD',1,'33222233','1996-09-21',N'Phường 6, Quận 10, TP HCM',1,'CCC@GMAIL.COM',NULL,'SILVER')

SELECT * FROM CHINHANH1
SELECT * FROM MONAN
SELECT * FROM LOAIMON
SELECT * FROM MONAN
SELECT * FROM THUCDON
SELECT * FROM NHANVIEN
SELECT * FROM THANHVIEN