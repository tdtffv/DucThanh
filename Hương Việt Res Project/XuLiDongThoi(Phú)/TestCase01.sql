--Dirty Read - Lai Gia Phú - 1712662
--T1
BEGIN TRAN
EXEC sp_CapNhatSoPhanAn 1,1,'2019-01-01',50,10
Waitfor delay '00:00:10'
ROLLBACK TRAN
--T2
BEGIN TRAN
set tran isolation level READ UNCOMMITTED
EXEC sp_XemThucDon 1,'2019-01-01'
COMMIT TRAN
--Sửa mức cô lập T2 thành READ COMMITTED
--T2
BEGIN TRAN
set tran isolation level READ COMMITTED
EXEC sp_XemThucDon 1,'2019-01-01'
COMMIT TRAN
