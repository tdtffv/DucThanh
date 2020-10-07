--Deadlock
--T1
BEGIN TRAN
EXEC sp_ThemMonThucDon 1,1,'2019-01-02',50,50
Waitfor delay '00:00:05'
EXEC sp_XemThucDon 2,'2019-01-02'
COMMIT TRAN
--T2
BEGIN TRAN
EXEC sp_ThemMonThucDon 2,1,'2019-01-02',50,50
Waitfor delay '00:00:10'
EXEC sp_XemThucDon 1,'2019-01-02'
COMMIT TRAN
--SQL chọn T2 là victim Deadlock và bắt thực hiện lại sau