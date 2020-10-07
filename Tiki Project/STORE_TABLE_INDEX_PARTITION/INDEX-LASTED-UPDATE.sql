﻿
-------------------------------------------------------TẠO INDEX--------------------------------------------------------- 
-- TẠO INDEX TRÊN BẢNG PHIẾU GIAO HÀNG
CREATE NONCLUSTERED INDEX PGIAOH1 ON PHIEUGIAOHANG(KHUVUC,MAHD) 

-- TẠO INDEX TRÊN BẢNG MATHANG
CREATE NONCLUSTERED INDEX MHLH1 ON MATHANG(LOAIHANG) INCLUDE (MAMH)

-- TẠO INDEX TRÊN BẢNG NHACUNGCAP
CREATE NONCLUSTERED INDEX NCC1 ON NHACUNGCAP(TEN_NCC) 

---------------------------------------------------CÁC CÂU TRUY VẤN-------------------------------------------------------
-- TÌM KIẾM TÀI KHOẢN KHÁCH HÀNG CÓ ĐỊA CHỈ LÀ Ở KHU VỰC NỘI THÀNH VÀ NGÀY ĐẶT LÀ 2018-02-14	
SELECT TK.* FROM TKKHACHHANG TK ,HOADON HD, PHIEUGIAOHANG PGH 
WHERE TK.MATK=HD.MATK AND HD.MAHD = PGH.MAHD AND PGH.KHUVUC = N'NỘI THÀNH' AND HD.NGAYDAT = '2019-09-05'

--ĐẾM SỐ HÓA ĐƠN CÓ MẶT HÀNG CÓ MẶT HÀNG LÀ LOẠI = SÁCH
SELECT COUNT (*) FROM HOADON HD,MH_HD,dbo.MATHANG MH 
WHERE HD.MAHD = dbo.MH_HD.MAHD AND MH.MAMH= MH_HD.MAMH AND MH.LOAIHANG = N'SÁCH' 


-- TÌM KIẾM LOẠI MẶT HANG MÀ NHÀ CUNG CẤP CÓ MÃ KINH DOANH SOD37205 KINH DOANH
SELECT MH.LOAIHANG FROM dbo.NHACUNGCAP NCC, MH_NCC, MATHANG MH 
WHERE NCC.MA_NCC=MH_NCC.MAMH AND MH_NCC.MAMH = MH.MAMH AND NCC.TEN_NCC = N'Varglibewentor Holdings '

