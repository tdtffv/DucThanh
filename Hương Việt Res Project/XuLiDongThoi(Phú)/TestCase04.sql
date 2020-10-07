--Phantom - Lai Gia Phú - 1712662
--T1
BEGIN TRAN
EXEC sp_XemThucDon 1,'2020-01-01'
Waitfor delay '00:00:10'
EXEC sp_XemThucDon 1,'2020-01-01'
COMMIT TRAN
--T2
BEGIN TRAN
EXEC sp_ThemMonThucDon 1,2,'2020-01-01',50,50
COMMIT TRAN
--Sửa: mức cô lập Serializable ở T1
--EXEC sp_XoaMonThucDon 1,2,'2020-01-01'
--T1
set tran isolation level SERIALIZABLE
BEGIN TRAN
EXEC sp_XemThucDon 1,'2020-01-01'
Waitfor delay '00:00:10'
EXEC sp_XemThucDon 1,'2020-01-01'
COMMIT TRAN