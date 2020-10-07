/*=======================================================PHAN HE HAI=======================================================*/

--------------------------------------------------------- CO CHE DAC ---------------------------------------------------------

-- a) DAC1: Bác sĩ không được xem thông tin khác của những bệnh nhân do bác sĩ khác điều trị hoặc những thông tin khác trong hệ thống.
CREATE OR REPLACE PROCEDURE sp_DAC1 (MANV IN VARCHAR2, user_name IN varchar2)
IS
BEGIN
	EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW VIEW_HSBN_'||MANV||user_name||' AS SELECT HSBN.* FROM ADMIN1.HSBENHNHAN HSBN,
                                                                               ADMIN1.PHIEUKHAMBENH PKB WHERE HSBN.MABN = PKB.MABN
                                                                               AND PKB.MANV = '||MANV;
	EXECUTE IMMEDIATE 'GRANT SELECT ON ADMIN1.VIEW_HSBN_'||MANV||user_name||' TO '||user_name;
END;
/
EXEC sp_DAC1('NV4','NV4');

-- b) DAC2: Bác sĩ chỉ được xem toa thuốc của bệnh nhân mình điều trị.
CREATE OR REPLACE PROCEDURE sp_DAC2 (MANV IN VARCHAR2, user_name IN varchar2)
IS
BEGIN
	EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW VIEW_TOATHUOC_'||MANV||user_name||' AS SELECT T.MANV,T.MATOA, T.MABN, CT.MATHUOC, CT.SOLUONG ,CT.GIATIEN, T.THANHTIEN 
        FROM TOATHUOC T, CHITIETTOATHUOC CT WHERE T.MATOA = CT.MATOA AND T.MANV = '||MANV;
	EXECUTE IMMEDIATE 'GRANT SELECT ON ADMIN1.VIEW_TOATHUOC_'||MANV||user_name||' TO '||user_name;
END;
/
EXEC sp_DAC2('NV4','NV4');

--------------------------------------------------------- CO CHE RBAC ---------------------------------------------------------

--a) RBAC1: Nhóm quản lý chuyên môn được xem tất cả thông tin trong đó có thông tin điều trị bệnh của các bác sĩ để theo dõi về chuyên môn của bệnh viện, không được chỉnh sửa bất cứ thông tin nào.
--B1: Tạo role QLCM (Giao diện form9)
EXEC sp_CreateRole_NOTIDENTIFIED_user('QLCM');

--B2: Tạo user NV9, NV18 (Giao diện form7)
EXEC sp_create_user('NV9','9');
EXEC sp_create_user('NV18','18');

--B3: Gán user cho role (Giao diện form11)
EXEC sp_GrantPriRole('QLCM','NV9',0);
EXEC sp_GrantPriRole('QLCM','NV18',0);

--B4: Gán quyền cho role QLCM (Giao diện form11)
EXEC sp_GrantPriRole('SELECT ANY TABLE','QLCM',0);


--b) RBAC2: Bộ phận tiếp tân và điều phối bệnh được quyền thêm, xóa, sửa, tìm kiếm thông tin bệnh nhân. 
--B1: Tạo role TIEPTAN_DIEUPHOI (Giao diện form9)
EXEC sp_CreateRole_NOTIDENTIFIED_user('TIEPTAN_DIEUPHOI');

--B2: Tạo user NV2, NV3, NV12, NV13 (Giao diện form7)
EXEC sp_create_user('NV2','2');
EXEC sp_create_user('NV3','3');
EXEC sp_create_user('NV12','12');
EXEC sp_create_user('NV13','13');

--B3: Gán user cho role bằng stored sp_GrantPriRole (Giao diện form11)
EXEC sp_GrantPriRole('TIEPTAN_DIEUPHOI','NV2',0);
EXEC sp_GrantPriRole('TIEPTAN_DIEUPHOI','NV3',0);
EXEC sp_GrantPriRole('TIEPTAN_DIEUPHOI','NV12',0);
EXEC sp_GrantPriRole('TIEPTAN_DIEUPHOI','NV13',0);

--B4: gán quyền cho role TT_ĐP bằng sp_GrantPri (Giao diện form11)
EXEC sp_GrantPri ('SELECT',NULL,'HSBENHNHAN','TIEPTAN_DIEUPHOI');
EXEC sp_GrantPri ('INSERT',NULL,'HSBENHNHAN','TIEPTAN_DIEUPHOI');
EXEC sp_GrantPri ('UPDAtE',NULL,'HSBENHNHAN','TIEPTAN_DIEUPHOI');
EXEC sp_GrantPri ('DELETE',NULL,'HSBENHNHAN','TIEPTAN_DIEUPHOI');


--------------------------------------------------------- CO CHE VPD ---------------------------------------------------------

--a) VPD1: Bác sĩ có thể thêm/sửa thông tin liên quan đến việc điều trị bệnh và các loại thuốc phải dùng, liều dùng cho bệnh nhân cho bệnh nhân mà mình chịu trách nhiệm.
CREATE OR REPLACE FUNCTION Select_ThongTinBN (
p_schema IN VARCHAR2 DEFAULT NULL,
p_object IN VARCHAR2 DEFAULT NULL)
RETURN VARCHAR2 
AS
N_MABN NUMBER(10);
CURSOR C_TTBN IS SELECT DISTINCT HS.MABN FROM ADMIN1.HSBENHNHAN HS,ADMIN1.PHIEUKHAMBENH PKB WHERE HS.MABN=PKB.MABN AND PKB.MANV = USER;
BEGIN
    OPEN C_TTBN ;
    LOOP
        FETCH C_TTBN INTO N_MABN;
        RETURN 'MABN= '||N_MABN;
    END LOOP;
END;
/

BEGIN
DBMS_RLS.add_policy
(object_schema => 'ADMIN1',
object_name => 'HSBENHNHAN',
policy_name => 'POL_HSBN',
function_schema => 'ADMIN1',
policy_function => 'Select_ThongTinBN',
statement_types => 'SELECT, UPDATE');
END;
/

--Xoa ham 
BEGIN
DBMS_RLS.drop_policy
(object_schema => 'ADMIN1',
object_name => 'HSBENHNHAN',
policy_name => 'POL_HSBN');
END;
/

--b) VPD2: Mỗi nhân viên chỉ được xem lương của chính họ.
--Tao ham
CREATE OR REPLACE FUNCTION Select_Luong_NhanVien (
p_schema IN VARCHAR2 DEFAULT NULL,
p_object IN VARCHAR2 DEFAULT NULL)
RETURN VARCHAR2 
AS
num number;
BEGIN
  Select count (*) into num from ADMIN1.NHANVIEN where user IS NULL;
  if (num > 0) then
  RETURN '';
  ELSE
  RETURN 'MANV = USER';
  END IF;
EXCEPTION
      WHEN OTHERS THEN RETURN '1 = 0';
END;
/

--Gan ham vao chinh sach
BEGIN
DBMS_RLS.add_policy
(object_schema => 'ADMIN1',
object_name => 'NHANVIEN',
policy_name => 'POL_NHANVIEN',
function_schema => 'ADMIN1',
policy_function => 'Select_Luong_NhanVien',
sec_relevant_cols=>'LUONG',
sec_relevant_cols_opt=>dbms_rls.ALL_ROWS);
END;
/

--Xoa ham 
BEGIN
DBMS_RLS.drop_policy
(object_schema => 'ADMIN1',
object_name => 'NHANVIEN',
policy_name => 'POL_NHANVIEN');
END;
/


--------------------------------------------------------- CO CHE MAC (OLS) ---------------------------------------------------------

--MAC: Nhân viên thuộc bộ phận quản lý được xem thông báo cấp quản lý ở khu vực mình trực thuộc.

-- Trước khi thực hiện chính sách thì cần tạo 1 schema
-- + SCHEMA : SEC_MGR ĐỂ THỰC HIỆN CHÍNH SÁCH BẢO MẬT
CREATE USER SEC_MGR IDENTIFIED BY SECMGR1;
-- + GÁN CÁC QUYỀN CHO SCHEMA VỪA TẠO

-- B1: Tao du lieu mau (BẢNG THÔNG BÁO ĐÃ TẠO BÊN SCRIPT DATA), TẠO CHÍNH SÁCH OLS, GÁN QUYỀN CHO USER SEC_MGR
EXECUTE SA_SYSDBA.CREATE_POLICY(POLICY_NAME => 'ACCESS_NHANVIEN', COLUMN_NAME => 'OLS_NHANVIEN');
GRANT ACCESS_NHANVIEN_DBA TO SEC_MGR;
GRANT EXECUTE ON sa_components TO SEC_MGR;
GRANT EXECUTE ON sa_laBel_admin TO SEC_MGR;
GRANT EXECUTE ON sa_user_admin TO SEC_MGR;

-- TAO 3 level ung voi 3 cap thong tin nhay cam (THÔNG THƯỜNG, GIỚI HẠN, BÍ MẬT)
BEGIN sa_components.create_level
(
policy_name => 'ACCESS_NHANVIEN',
long_name => 'THONGTHUONG',
short_name => 'TT',
level_num => 500);
)
END; 
BEGIN sa_components.create_level
(
policy_name => 'ACCESS_NHANVIEN',
long_name => 'GIOIHAN',
short_name => 'GH',
level_num => 1000);
) 
END;
BEGIN sa_components.create_level
(
policy_name => 'ACCESS_NHANVIEN',
long_name => 'BIMAT',
short_name => 'BM',
level_num => 200);
) 
END;

-- TAO 3 COMPARTMENT UNG VOI 3 CẤP NHÂN VIÊN 
EXECUTE sa_components.create_compartment ('ACCESS_NHANVIEN', 1000, 'NV' ,'NHANVIEN');
EXECUTE sa_components.create_compartment ('ACCESS_NHANVIEN', 2000, 'KT', 'KETOAN');
EXECUTE sa_components.create_compartment ('ACCESS_NHANVIEN', 3000, 'QL', 'QUANLY');

-- TAO 1 GROUP TÊN LÀ HỆ THỐNG BỆNH VIỆN ĐỂ XEM THÔNG BÁO CHUNG, 1 GROUP CHO NV KHU VỰC A, 1 GROUP CHO B
BEGIN
sa_components.create_group
(policy_name => 'ACCESS_NHANVIEN',
long_name => 'HETHONGBENHVIEN',
short_name => 'HTBV',
group_num => 1000,
parent_name => NULL);
END;

sa_components.create_group
(policy_name => 'ACCESS_NHANVIEN',
long_name => 'KHU_A',
short_name => 'A',
group_num => 2000,
parent_name => 'HTBV');

sa_components.create_group
(policy_name => 'ACCESS_NHANVIEN',
long_name => 'KHU_B',
short_name => 'B',
group_num => 3000,
parent_name => 'HTBV');

--LABEL
-- Dán nhãn cho thông báo chung
sa_label_admin.create_label
(policy_name => 'ACCESS_NHANVIEN',
label_tag => 100,
label_values => 'TT:NV,KT,QL:HTBV');
-- Dán nhãn thông báo cho bộ phận quản lý ở khu a
sa_label_admin.create_label
(policy_name => 'ACCESS_NHANVIEN',
label_tag => 100,
label_values => 'BM:QL:A');
--Dán nhãn cho thông báo cho bộ phận quản lý ở khu b
sa_label_admin.create_label
(policy_name => 'ACCESS_NHANVIEN',
label_tag => 300,
label_values => 'BM:QL:B');
-- Dán nhãn cho những thông báo thuộc về khu a
sa_label_admin.create_label
(policy_name => 'ACCESS_NHANVIEN',
label_tag => 600,
label_values => 'GH:QL,KT,NV:A');
-- Dán nhãn cho những thông báo thuộc về khu b
sa_label_admin.create_label
(policy_name => 'ACCESS_NHANVIEN',
label_tag => 900,
label_values => 'GH:QL,KT,NV:B');

---------------------------------------- APPLY CHÍNH SÁCH ----------------------------------------
--APLLY CHÍNH SÁCH THÔNG BÁO
BEGIN
sa_policy_admin.apply_table_policy
(policy_name => 'ACCESS_NHANVIEN',
schema_name => 'ADMIN1',
table_name => 'THONGBAO',
table_options => 'NO_CONTROL');
END;

--GÁN NHÃN DỮ LIỆU CHO BẢNG THÔNG BÁO
UPDATE THONGBAO SET OLS_NHANVIEN = char_to_label ('ACCESS_NHANVIEN', 'GH:QL,KT,NV:A')
WHERE STT = 1;
UPDATE THONGBAO SET OLS_NHANVIEN = char_to_label ('ACCESS_NHANVIEN', 'BM:QL:A')
WHERE STT = 2;
UPDATE THONGBAO SET OLS_NHANVIEN = char_to_label ('ACCESS_NHANVIEN', 'GH:QL,KT,NV:B')
WHERE STT = 3;
UPDATE THONGBAO SET OLS_NHANVIEN = char_to_label ('ACCESS_NHANVIEN', 'BM:QL:B')
WHERE STT = 4;
UPDATE THONGBAO SET OLS_NHANVIEN = char_to_label ('ACCESS_NHANVIEN', 'TT')
WHERE STT = 5;

---------------------------------------- APPLY CHÍNH SÁCH BPQL CỦA MỖI KHU ĐƯỢC XEM THÔNG BÁO CỦA KHU MÌNH ----------------------------------------
--BPQL KHU A
BEGIN
sa_user_admin.set_user_labels
(policy_name => 'ACCESS_NHANVIEN',
user_name => 'NV1',
max_read_label => 'BM:QL:A',
def_label => 'BM:QL:A',
row_label => 'BM:QL:A');
END;
BEGIN
sa_user_admin.set_user_labels
(policy_name => 'ACCESS_NHANVIEN',
user_name => 'NV8',
max_read_label => 'BM:QL:A',
def_label => 'BM:QL:A',
row_label => 'BM:QL:A');
END;
BEGIN
sa_user_admin.set_user_labels
(policy_name => 'ACCESS_NHANVIEN',
user_name => 'NV9',
max_read_label => 'BM:QL:A',
def_label => 'BM:QL:A',
row_label => 'BM:QL:A');
END;

--BPQL KHU B
BEGIN
sa_user_admin.set_user_labels
(policy_name => 'ACCESS_NHANVIEN',
user_name => 'NV11',
max_read_label => 'BM:QL:B',
def_label => 'BM:QL:B',
row_label => 'BM:QL:B');
END;
BEGIN
sa_user_admin.set_user_labels
(policy_name => 'ACCESS_NHANVIEN',
user_name => 'NV17',
max_read_label => 'BM:QL:B',
def_label => 'BM:QL:B',
row_label => 'BM:QL:B');
END;
BEGIN
sa_user_admin.set_user_labels
(policy_name => 'ACCESS_NHANVIEN',
user_name => 'NV18',
max_read_label => 'BM:QL:B',
def_label => 'BM:QL:B',
row_label => 'BM:QL:B');
END;

--XÓA CHÍNH SÁCH VÀ APPLY LẠI
BEGIN
sa_policy_admin.remove_table_policy
(policy_name => 'ACCESS_NHANVIEN',
schema_name => 'ADMIN1',
table_name => 'THONGBAO');
END;
BEGIN
sa_policy_admin.apply_table_policy
(policy_name => 'ACCESS_NHANVIEN',
schema_name => 'ADMIN1',
table_name => 'THONGBAO',
table_options => 'READ_CONTROL');
END;
