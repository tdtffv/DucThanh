--Deadlock - Lai Gia Phú - 1712662
--T1
BEGIN TRAN
EXEC sp_CapNhatSoPhanAn 1,1,'2019-01-01',50,40
Waitfor delay '00:00:05'
EXEC sp_XemThucDon 2,'2019-01-01'
COMMIT TRAN
--T2
BEGIN TRAN
EXEC sp_CapNhatSoPhanAn 2,1,'2019-01-01',50,30
Waitfor delay '00:00:10'
EXEC sp_XemThucDon 1,'2019-01-01'
COMMIT TRAN
--SQL chọn T2 là victim Deadlock và bắt thực hiện lại sau