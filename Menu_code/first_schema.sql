CREATE TABLE HO_KHAU(
    So_HK VARCHAR(20) PRIMARY KEY,
    SotheChuho VARCHAR(20),
    Diachi NVARCHAR(200),
)
CREATE TABLE CONG_DAN(
    SotheCD VARCHAR(20) PRIMARY KEY,
    tenCD NVARCHAR(100),
    ngaysinh DATE,
    SotheChuho VARCHAR(20),
    quanheChuho NVARCHAR(100)
)
CREATE TABLE QL_KHU(
    SoKhu VARCHAR(20),
    So_HK VARCHAR(20),
    soluongNhanKhau INT,
    PRIMARY KEY(SoKhu, So_HK),
)

INSERT INTO HO_KHAU (So_HK, SotheChuho, Diachi) VALUES
('HK001', 'CD001', N'123 Đường A, Phường B, Quận C'),
('HK002', 'CD002', N'456 Đường D, Phường E, Quận F'),
('HK003', 'CD003', N'789 Đường G, Phường H, Quận I');

INSERT INTO CONG_DAN (SotheCD, tenCD, ngaysinh, SotheChuho, quanheChuho) VALUES
('CD001', N'Nguyen Van A', '1990-01-01', 'CD001', N'Chủ hộ'),
('CD002', N'Tran Thi B', '1992-02-02', 'CD002', N'Vợ'),
('CD003', N'Le Van C', '1995-03-03', 'CD003', N'Con');

INSERT INTO QL_KHU (SoKhu, So_HK, soluongNhanKhau) VALUES
('KHU001', 'HK001', 3),
('KHU002', 'HK002', 2),
('KHU003', 'HK003', 1);