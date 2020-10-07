﻿--Người thực hiện: Trịnh Đức Thanh - 1712769

--Lỗi 1: Dirty Read
BEGIN TRAN
UPDATE MONAN 
SET GIATIEN=25000 
WHERE MAMON=2
Waitfor delay '00:00:20'
ROLLBACK


--Người thực hiện: Trịnh Đức Thanh - 1712769

--Lỗi 2: Unrepeatable
BEGIN TRAN
SELECT SL_CONLAI 
FROM THUCDON 
WHERE MAMON = 1 AND MACN = 1
waitfor delay'00:00:20'

SELECT SL_CONLAI
FROM THUCDON 
WHERE MAMON = 1 AND MACN = 1
COMMIT

--Người thực hiện: Trịnh Đức Thanh - 1712769

--Lỗi 3: Phantom
BEGIN TRAN
SELECT * FROM THANHVIEN 
WHERE LOAITHE='Gold' AND CHINHANHDK=1
waitfor delay'00:00:20'

SELECT * FROM THANHVIEN 
WHERE LOAITHE='Gold' AND CHINHANHDK=1
COMMIT

--Người thực hiện: Trịnh Đức Thanh - 1712769

--Lỗi 4: Lost Update
BEGIN TRAN
SELECT SL_CONLAI 
FROM THUCDON 
WHERE MAMON = 1 AND MACN = 1
waitfor delay'00:00:20'

UPDATE THUCDON 
SET SL_CONLAI =19 
WHERE MAMON = 1 AND MACN = 1
COMMIT

--Người thực hiện: Trịnh Đức Thanh - 1712769

--Lỗi 5: Deadlock
BEGIN TRAN
SET TRAN ISOLATION LEVEL SERIALIZABLE
SELECT*FROM DONHANG 
WHERE MADH=3
waitfor delay '00:00:20'

UPDATE DONHANG 
SET TRANGTHAI=N'Đang chuẩn bị' 
WHERE MADH=3
COMMIT
