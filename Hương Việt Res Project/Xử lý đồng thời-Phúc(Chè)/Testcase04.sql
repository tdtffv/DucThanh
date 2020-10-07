--Phantom
--T1
BEGIN TRAN
EXEC sp_ThongKeTheoNgayCN 1
Waitfor delay '00:00:10'
EXEC sp_ThongKeTheoNgayCN 1
COMMIT TRAN
--T2
BEGIN TRAN
EXEC sp_InDH null,null,1,N'Trực tiếp',N'Qua thẻ'
EXEC sp_InCTDH 1,1,5
COMMIT TRAN
--Sửa: mức cô lập Serializable ở T1
--T1
BEGIN TRAN
set tran isolation level SERIALIZABLE
EXEC sp_ThongKeTheoNgayCN 1
Waitfor delay '00:00:10'
EXEC sp_ThongKeTheoNgayCN 1
COMMIT TRAN