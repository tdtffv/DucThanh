/*=======================================================PHAN HE MOT=======================================================*/
-- THEM DONG LENH NAY DE FIX LOI TAO USER
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
-- TAO USER ADMIN VOI TOAN QUYEN HE THONG
CREATE USER ADMIN1 IDENTIFIED BY admin1;
-- GAN QUYEN DANG NHAP VÀO 1 CONNECTION
GRANT CREATE SESSION TO ADMIN1 WITH ADMIN OPTION;
GRANT SELECT ANY DICTIONARY TO ADMIN1; 
GRANT ALL PRIVILEGES TO ADMIN1;
grant connect, resource, select any transaction to ADMIN1;


---------------------------- YEU CAU 1: XEM DS ALL USER, XEM DANH SACH CAC DOI TUONG HIEN CO TREN CSDL ----------------------------

-- + XEM DANH SACH TAT CA USER
CREATE OR REPLACE PROCEDURE sp_RetrieveAll_User (
V_CUR_RETRIEVE OUT SYS_REFCURSOR)
AS
BEGIN
	OPEN V_CUR_RETRIEVE FOR
    SELECT GRANTEE FROM DBA_COL_PRIVS WHERE OWNER = 'ADMIN1';
END sp_RetrieveAll_User;
/
VARIABLE CUR_TEST REFCURSOR
EXEC sp_RetrieveAll_User(:CUR_TEST)
PRINT CUR_TEST;

-- +Xem CAC BANG MA ADMIN1 TAO
CREATE OR REPLACE PROCEDURE sp_Retrieve_Table( V_CURSOR_RETRVTABLE OUT SYS_REFCURSOR)
AS
BEGIN
	OPEN V_CURSOR_RETRVTABLE FOR
    SELECT table_name FROM user_tables;
END sp_Retrieve_Table;
/
VARIABLE CUR_TEST_TABLE REFCURSOR
EXEC sp_Retrieve_Table(:CUR_TEST_TABLE)
PRINT CUR_TEST_TABLE;

-- +XEM VIEW CUA ADMIN1 TAO
CREATE OR REPLACE PROCEDURE sp_Retrieve_VIEW( V_CURSOR_RETRV_VIEW OUT SYS_REFCURSOR)
AS
BEGIN
	OPEN V_CURSOR_RETRV_VIEW FOR
    SELECT view_name FROM user_views;
END sp_Retrieve_VIEW;
/
variable CUR_TEST_view REFCURSOR
EXEC sp_Retrieve_VIEW(:CUR_TEST_VIEW)
PRINT CUR_TEST_VIEW;


---------------------------- YEU CAU 2: THONG TIN VE QUYEN CUA MOI USER/ROLE TREN CAC DOI TUONG DU LIEU ----------------------------

-- + XEM QUYEN CUA CAC USER TREN DOI TUONG DU LIEU LA COT
CREATE OR REPLACE PROCEDURE sp_RetrieveColPri_User (
V_CUR_RETRIEVE_Col OUT SYS_REFCURSOR)
AS
BEGIN
	OPEN V_CUR_RETRIEVE_Col FOR
    SELECT GRANTEE, TABLE_NAME, COLUMN_NAME, PRIVILEGE FROM DBA_COL_PRIVS WHERE OWNER = 'ADMIN1';
END sp_RetrieveColPri_User;
/
variable CUR_TEST_ColPriv REFCURSOR
EXEC sp_RetrieveColPri_User(:CUR_TEST_ColPriv)
PRINT CUR_TEST_ColPriv;

-- + XEM QUYEN CUA CAC USER TREN DOI TUONG DU LIEU LA BANG
CREATE OR REPLACE PROCEDURE sp_RetrievePri_User (
V_CUR_RETRIEVE_Pri OUT SYS_REFCURSOR)
AS
BEGIN
	OPEN V_CUR_RETRIEVE_Pri FOR
    SELECT GRANTEE, TABLE_NAME, PRIVILEGE FROM USER_TAB_PRIVS WHERE OWNER = 'ADMIN1';
END sp_RetrievePri_User;
/
variable CUR_TEST_Priv REFCURSOR
EXEC sp_RetrievePri_User(:CUR_TEST_Priv)
PRINT CUR_TEST_Priv;


-------------------------- YEU CAU 3: CHO PHEP TAO MOI/XOA/SUA USER HOAC ROLE -------------------------- 

--+ TAO MOI USER
 create or replace procedure sp_create_user
    (user_name IN varchar2 , u_password IN varchar2 )
    IS
    tmp_query varchar(150);
    user_name_upper varchar(30) := UPPER(user_name) ;
  BEGIN
    EXECUTE IMMEDIATE ('ALTER SESSION SET "_ORACLE_SCRIPT"=true');
    tmp_query := 'create user ' || user_name_upper || ' identified by ' || u_password;
    EXECUTE IMMEDIATE ( tmp_query );
    tmp_query := 'grant create session to ' || user_name_upper ;
    EXECUTE IMMEDIATE ( tmp_query );
   END;
   /
exec ADMIN1.sp_create_user('nana', 'lovely');
exec ADMIN1.sp_create_user('SEC_MGR', 'secmgr');
SELECT * FROM all_users;

--+ XOA USER
create or replace procedure sp_drop_user 
    (user_name IN varchar2)
    IS
    begin
    EXECUTE IMMEDIATE ('ALTER SESSION SET "_ORACLE_SCRIPT"=true');
    execute IMMEDIATE 'drop user ' || user_name || 'CASCADE';
    end;
/
exec ADMIN1.sp_drop_user('nana');

--+ ALTER USER
--  Alter password user
create or replace procedure sp_alterpass_user
    (user_name IN varchar2, u_password IN varchar2)
    AS
    BEGIN
    EXECUTE IMMEDIATE ('ALTER SESSION SET "_ORACLE_SCRIPT"=true');
    execute immediate 'alter user '||user_name||' identified by ' || u_password;
    dbms_output.put_line('Thay doi thanh cong');
    END;
/
exec ADMIN1.sp_alterpass_user('JOY', '123123');
-- Alter lock user
create or replace procedure sp_alterlock_user
    (user_name IN varchar2) 
    IS
    BEGIN
    EXECUTE IMMEDIATE ('ALTER SESSION SET "_ORACLE_SCRIPT"=true');
    execute immediate 'alter user '||user_name||' ACCOUNT lock ';
    END;
/
exec sp_alterlock_user('JAKE');
-- Alter unlock user
create or replace procedure sp_alterUnlock_user
    (user_name IN varchar2) 
    IS
    BEGIN
    EXECUTE IMMEDIATE ('ALTER SESSION SET "_ORACLE_SCRIPT"=true');
    execute immediate 'alter user '||user_name||' ACCOUNT unlock ';
    END;
/
exec sp_alterUnlock_user('JAKE');

-- TAO ROLE
--+ Create role NOT IDENTIFIED (Khong mat khau)
CREATE OR REPLACE procedure sp_CreateRole_NOTIDENTIFIED_user
    (role_name IN varchar2)
    IS
    BEGIN
    EXECUTE IMMEDIATE ('ALTER SESSION SET "_ORACLE_SCRIPT"=true');
    EXECUTE IMMEDIATE 'CREATE ROLE ' || role_name;
    END;
/
exec sp_CreateRole_NOTIDENTIFIED_user('TiepTan_DieuPhoi');
select * from dba_roles where role = 'TIEPTAN_DIEUPHOI';

--+ Create role IDENTIFIED (Co mat khau)
CREATE OR REPLACE procedure sp_CreateRole_IDENTIFIED_user
    (role_name IN varchar2, role_password IN varchar2)
    IS
    BEGIN
    EXECUTE IMMEDIATE ('ALTER SESSION SET "_ORACLE_SCRIPT"=true');
    EXECUTE IMMEDIATE 'CREATE ROLE ' || role_name || ' identified by ' || role_password;
    END;
/
exec ADMIN1.sp_CreateRole_IDENTIFIED_user('drop_table', 'drop');

-- Xoa role
CREATE OR REPLACE PROCEDURE sp_DropRole_user (role_name varchar2)
    IS
    BEGIN
    EXECUTE IMMEDIATE ('ALTER SESSION SET "_ORACLE_SCRIPT"=true');
    EXECUTE IMMEDIATE 'DROP ROLE ' || role_name ;   
    END;
/
exec ADMIN1.sp_DropRole_user('VIEW_TABLE');
SELECT * FROM DBA_ROLES ;

-- ALTER ROLE
-- + ENABLE ROLE
CREATE OR REPLACE PROCEDURE sp_Enable_Role (role_name IN varchar2)
IS
BEGIN
    EXECUTE IMMEDIATE ' SET ROLE ' || role_name;
END;
/
-- + DISABLE ROLE
CREATE OR REPLACE PROCEDURE sp_Disable_Role (role_name IN varchar2)
IS
BEGIN
    EXECUTE IMMEDIATE ' SET ROLE ' || role_name || ' NONE ';
END;
/
-- + ALTER ROLE IDENTIFIED (Sua mat khau cho role)
CREATE OR REPLACE PROCEDURE sp_AlterRole_Identified (role_name IN varchar2, new_role_pass IN varchar2)
IS
BEGIN
    EXECUTE IMMEDIATE ' ALTER ROLE ' || role_name || ' IDENTIFIED BY ' || new_role_pass;
END;
/
-- + ALTER ROLE NOT IDENTIFIED (Them mat khau cho role)
CREATE OR REPLACE PROCEDURE sp_AlterRole_Identified (role_name IN varchar2)
IS
BEGIN
    EXECUTE IMMEDIATE ' ALTER ROLE ' || role_name || ' IDENTIFIED BY ' || new_role_pass;
END;
/
-- +ALTER ROLE
CREATE OR REPLACE PROCEDURE sp_AlterRole (role_name IN varchar2,check_status IN number)
    IS
    BEGIN
        IF (check_status = 1) THEN
            EXECUTE IMMEDIATE ' ALTER ROLE ' || role_name || ' NOT IDENTIFIED ' ;
        END IF;
        IF (check_status = 2) THEN
            EXECUTE IMMEDIATE ' ALTER ROLE ' || role_name || ' IDENTIFIED EXTERNALLY ' ;
        END IF;
        IF (check_status = 3) THEN
            EXECUTE IMMEDIATE ' ALTER ROLE ' || role_name || ' IDENTIFIED GLOBALLY ' ;
        END IF;
    END;
/

-- GRANT CONNECT, RESOURCE TO USER
CREATE OR REPLACE PROCEDURE sp_Grant_User_CONNECT (user_name IN varchar2)
AUTHID CURRENT_USER AS
    BEGIN
    EXECUTE IMMEDIATE 'GRANT CONNECT TO ' || user_name;
    END;
/
EXEC sp_Grant_User_CONNECT('JOY');


---------------------------- YEU CAU 4: GAN QUYEN CHO USER/ ROLE. GAN ROLE CHO USER ----------------------------

﻿CREATE OR REPLACE PROCEDURE sp_GrantPriRole (user_pri varchar2,user_name varchar2,user_wgo number)
--Grant cac quyen khong phai select, insert, update, delete cho user/role. Va gan role cho user
IS
BEGIN
    IF (user_wgo = 1) THEN --=1 la WITH GRANT OPTION
		EXECUTE IMMEDIATE 'GRANT '||user_pri||' TO '||user_name||' WITH GRANT OPTION';
	ELSE IF (user_wgo = 0) THEN
		EXECUTE IMMEDIATE 'GRANT '||user_pri||' TO '||user_name;
    END IF;
    END IF;
END;
/
EXECUTE sp_GrantPriRole('CREATE TABLE','JOY',0); --Gan quyen CREATE TABLE cho user JOY
EXECUTE sp_GrantPriRole('CREATE PROCEDURE','TIEPTAN_DIEUPHOI',0); --Gan quyen CREATE PROCEDURE cho role TIEPTAN_DIEUPHOI
EXECUTE sp_GrantPriRole('TIEPTAN_DIEUPHOI','JOY',0); --Gan role TIEPTAN_DIEUPHOI cho user JOY

--Gan cac quyen la select, insert, update, delete
CREATE OR REPLACE PROCEDURE sp_GrantPri (user_pri varchar2,user_col varchar2,user_obj varchar2,user_name varchar2)
IS
BEGIN
    IF((user_pri = 'SELECT' OR user_pri = 'UPDATE') AND user_col IS NOT NULL) THEN
        IF(user_pri='SELECT') THEN
            EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW TestView_'||user_pri||user_col|| user_name|| ' AS SELECT ('||user_col||') FROM ADMIN1.'||user_obj;
            EXECUTE IMMEDIATE 'GRANT SELECT ON TestView_'||user_pri||user_col|| user_name|| ' TO ' ||user_name;
        ELSE IF(user_pri='UPDATE') THEN
            EXECUTE IMMEDIATE 'GRANT SELECT ON ADMIN1.' || user_obj ||' TO '||user_name||' WITH GRANT OPTION';--Cap quyen nay de cho update tren 1 cot
            EXECUTE IMMEDIATE 'GRANT UPDATE (' ||user_col||')' ||' ON ADMIN1.' || user_obj ||' TO '||user_name;
        END IF;
        END IF;
    ELSE
        EXECUTE IMMEDIATE 'GRANT ' || user_pri ||' ON ADMIN1.' || user_obj ||' TO '||user_name;
    END IF;
END;
/
EXECUTE sp_GrantPri ('UPDATE','LUONG','NHANVIEN','JOY');


---------------------------- YEU CAU 4: THU HOI QUYEN CUA USER/ ROLE ----------------------------

CREATE OR REPLACE PROCEDURE sp_RevokePri (user_pri varchar2,user_obj varchar2,user_name varchar2)
IS
BEGIN
	IF(user_obj IS NULL) THEN
		EXECUTE IMMEDIATE 'REVOKE '||user_pri||' FROM '||user_name;
	ELSE
		EXECUTE IMMEDIATE 'REVOKE '||user_pri||' ON '||user_obj||' FROM '||user_name;
	END IF;
END;
/
EXECUTE sp_RevokePri('INSERT','NHANVIEN','JOY');

--Kiem tra lai cac quyen
variable CUR_TEST REFCURSOR
EXEC sp_CheckPri(:CUR_TEST)
PRINT CUR_TEST;


---------------------------------YEU CAU 6: KIEM TRA QUYEN CUA USER ---------------------------------

-- + XEM QUYEN CUA TAT CA USER DA TAO 
CREATE OR REPLACE PROCEDURE sp_CheckPri (
V_CUR_RETRIEVE OUT SYS_REFCURSOR)
AS
BEGIN
	OPEN V_CUR_RETRIEVE FOR
	SELECT*FROM user_tab_privs;
END sp_CheckPri;
/
variable CUR_TEST REFCURSOR
EXEC sp_CheckPri(:CUR_TEST)
PRINT CUR_TEST;

-- +XEM CAC QUYEN CUA CHU THE VUA DUOC CAP QUYEN
CREATE OR REPLACE PROCEDURE sp_Check_UserPrivs (user_name IN varchar2,V_CURSOR OUT SYS_REFCURSOR)--DONE
IS
BEGIN
    
    OPEN V_CURSOR FOR
        SELECT GRANTEE, TABLE_NAME, PRIVILEGE FROM user_tab_privs WHERE GRANTEE = user_name;
END sp_Check_UserPrivs;
/
variable CUR_TEST REFCURSOR
EXEC sp_Check_UserPrivs('JOY',:CUR_TEST)
PRINT CUR_TEST;

---------------------------------YEU CAU 7: DA THUC HIEN O CAC YEU CAU 3,4 NEN KHONG LAM NUA -----------------------------------

-----------------------------------YEU CAU 8: ENABLE, DISABLE AUDIT -----------------------------------

--Enable auditing:
alter system set audit_trail=db,extended scope=spfile;
shutdown immediate;
startup
-----------------------ADD----------------------------
BEGIN
DBMS_FGA.ADD_POLICY(
object_schema ='ADMIN1',
object_name ='THONGBAO',
policy_name ='chk_hr_emp',
statement_types='insert,update,delete,select');
END;
--------------------Disable auditing-------------------------
BEGIN
DBMS_FGA.disable_policy(
object_schema ='ADMIN1',
object_name ='THONGBAO',
policy_name ='chk_hr_emp');
END;


----------------------------------- YEU CAU 9: Admin duoc chi dinh ghi nhat ky cua nhung hanh dong thuc hien boi user nao tren nhung doi tuong cu the -----------------------------------

-------------------------------------- Standard Auditing --------------------------------------
--Có thể audit:
--Trên đối tượng là table/ view.
--Việc thực thi proc.
--Các đặc quyền hệ thống (tắt kích hoạt 1 trigger).
--Trên 1 số user cụ thể.
--Trên các hành động thành công hoặc không thành công.
-----------------------------------------------------------------------------------------------
-- Kích hoạt bằng lệnh sau:
alter system set audit_trail=db,extended scope=spfile;
shutdown immediate;
startup
--------------------------------------------------------------------------------------------------
--BY ACCESS: Ghi một record cho mỗi câu lệnh và hoạt động được audit
--BY SESSION: Ghi một record cho tất cả các câu lệnh SQL cùng loại và tất cả các hoạt động cùng loại được
--thực hiện trên cùng một đối tượng schema trong cùng một session

Audit all on ADMIN1.HSBenhNhan by access;
Audit all on ADMIN1.PHIEUKHAMBENH by access;
Audit all on ADMIN1.THUOC by access;
Audit all on ADMIN1.NHANVIEN by access;
Audit all on ADMIN1.THONGBAO by access ;
Audit all on ADMIN1.DV_BN by access;
Audit all on ADMIN1.DICHVU by access;
Audit all on ADMIN1.CHITIETTOATHUOC by access;
Audit all on ADMIN1.TOATHUOC by access;
Audit all on ADMIN1.PHIEUKHAMBENH by access;
Audit all on ADMIN1.PHONGKHAM by access;

----------------------------- Audit User Logon and verify the settings -----------------------------
--Check the audit log
audit session by access;
SELECT * FROM dba_stmt_audit_opts union SELECT * FROM
dba_priv_audit_opts;

-- Lấy thông tin các hành động của user
select username, owner, obj_name,action_name,Sql_Text,Timestamp from
dba_audit_trail ;

-- Sys xóa audit
--DELETE FROM SYS.AUD$;
-- Tat audit khi select xong thông báo
--NOAUDIT SELECT on THONGBAO WHENEVER SUCCESSFUL;



----------------------------------- YEU CAU 10: KIEM TRA DU LIEU NHAT KY HE THONG -----------------------------------

-- Sau khi thuc hien yeu cau 9 ta thuc hien lenh duoi day de kiem tra nhat ky he thong
select * from dba_audit_trail ;