--Unrepeatable Read - Lai Gia Phú - 1712662
--T1
BEGIN TRAN
EXEC sp_XemThucDon 1,'2020-01-01'
Waitfor delay '00:00:10'
EXEC sp_XemThucDon 1,'2020-01-01'
COMMIT TRAN
--T2
BEGIN TRAN
EXEC sp_InDH null,null,1,N'Trực tiếp',N'Qua thẻ'
EXEC sp_InCTDH 1,1,5
COMMIT TRAN
--Sửa: cài mức cô lập Repeeatable Read ở T1
--T1
BEGIN TRAN
set tran isolation level Repeatable Read
EXEC sp_XemThucDon 1,'2020-01-01'
Waitfor delay '00:00:10'
EXEC sp_XemThucDon 1,'2020-01-01'
COMMIT TRAN