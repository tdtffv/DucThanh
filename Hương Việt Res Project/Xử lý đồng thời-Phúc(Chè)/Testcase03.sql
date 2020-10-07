--Lost update
--T1
BEGIN TRAN
select * from THANHVIEN where MATV = 1
Waitfor delay '00:00:10'
EXEC sp_UPTHETV3 1,1,2
COMMIT TRAN
--T2	
BEGIN TRAN
select * from THANHVIEN where MATV = 1
EXEC sp_UPTHETV3 1,1,3
COMMIT TRAN
-- Sửa : mức cô lập Serializable ở T1 nhưng gặp Deadlock và thực hiện lại T2
--T1
BEGIN TRAN
set tran isolation level Serializable
select * from THANHVIEN where MATV = 1
Waitfor delay '00:00:10'
EXEC sp_UPTHETV3 1,1,2
COMMIT TRAN

select * from THANHVIEN where MATV = 1