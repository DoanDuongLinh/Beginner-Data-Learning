-- =========================================================================
-- 1. XÓA BẢNG CŨ CÓ SẴN (TRÁNH LỖI KHI CHẠY LẠI)
-- =========================================================================
DROP TABLE IF EXISTS DATPHONG;
DROP TABLE IF EXISTS PHONG;
DROP TABLE IF EXISTS SINHVIEN;
DROP TABLE IF EXISTS LOP;

-- =========================================================================
-- 2. KHỞI TẠO CẤU TRÚC BẢNG (DATABASE SCHEMA)
-- =========================================================================
CREATE TABLE LOP (
    MaLop VARCHAR(10) PRIMARY KEY,
    TenLop NVARCHAR(100),
    NamBD INT,
    NamKT INT
);

CREATE TABLE SINHVIEN (
    MaSV VARCHAR(10) PRIMARY KEY,
    TenSV NVARCHAR(100),
    MaLop VARCHAR(10),
    FOREIGN KEY (MaLop) REFERENCES LOP(MaLop)
);

CREATE TABLE PHONG (
    MaP VARCHAR(10) PRIMARY KEY,
    LoaiP NVARCHAR(50),
    TinhTrang NVARCHAR(50)
);

CREATE TABLE DATPHONG (
    MaP VARCHAR(10),
    MaSV VARCHAR(10),
    NgayMuon DATE,
    NgayTra DATE,
    NguoiGiao NVARCHAR(100),
    PRIMARY KEY (MaP, MaSV, NgayMuon),
    FOREIGN KEY (MaP) REFERENCES PHONG(MaP),
    FOREIGN KEY (MaSV) REFERENCES SINHVIEN(MaSV)
);

-- =========================================================================
-- 3. CHÈN DỮ LIỆU THỬ NGHIỆM (MỖI BẢNG 5 DÒNG)
-- =========================================================================
INSERT INTO LOP (MaLop, TenLop, NamBD, NamKT) VALUES
('L01', N'Công nghệ thông tin A', 2020, 2024),
('L02', N'Công nghệ thông tin B', 2021, 2025),
('L03', N'Kế toán A', 2020, 2024),
('L04', N'Ngôn ngữ Anh A', 2022, 2026),
('L05', N'Quản trị kinh doanh A', 2023, 2027);

INSERT INTO SINHVIEN (MaSV, TenSV, MaLop) VALUES
('SV01', N'Trần Văn B', 'L01'),
('SV02', N'Lê Thị C', 'L01'),
('SV03', N'Phạm Văn D', 'L02'),
('SV04', N'Hoàng Thị E', 'L03'),
('SV05', N'Ngô Văn F', 'L04');

INSERT INTO PHONG (MaP, LoaiP, TinhTrang) VALUES
('P01', N'Máy lạnh', N'Tốt'),
('P02', N'Quạt trần', N'Hỏng'),
('P03', N'Máy lạnh', N'Hỏng'),
('P04', N'Máy chiếu', N'Tốt'),
('P05', N'Phòng Lab', N'Tốt');

INSERT INTO DATPHONG (MaP, MaSV, NgayMuon, NgayTra, NguoiGiao) VALUES
('P01', 'SV01', '2023-10-01', '2023-10-01', N'Nguyễn Văn A'),
('P02', 'SV03', '2023-10-02', '2023-10-02', N'Trần Thị B'),
('P03', 'SV04', '2023-10-03', '2023-10-03', N'Nguyễn Văn A'),
('P04', 'SV01', '2023-10-05', '2023-10-05', N'Lê Văn C'),
('P01', 'SV03', '2023-10-10', '2023-10-10', N'Nguyễn Văn A');

-- =========================================================================
-- 4. BỘ TRUY VẤN TỐI ƯU GỌN GÀNG (CHUẨN DATA ENGINEER)
-- =========================================================================

-- Câu 1: Mã phòng và loại phòng có tình trạng 'Hỏng'
SELECT MaP, LoaiP
FROM PHONG
WHERE TinhTrang = N'Hỏng';

-- Câu 2: Mã sinh viên đã từng mượn phòng 'Máy lạnh'
SELECT DISTINCT dp.MaSV
FROM DATPHONG dp
INNER JOIN PHONG p ON dp.MaP = p.MaP
WHERE p.LoaiP = N'Máy lạnh';

-- Câu 3: Mã phòng chưa từng được ai mượn
SELECT p.MaP
FROM PHONG p
LEFT JOIN DATPHONG dp ON p.MaP = dp.MaP
WHERE dp.MaP IS NULL;

-- Câu 4: Tên sinh viên thuộc lớp bắt đầu năm 2020 và đã từng mượn phòng
SELECT DISTINCT sv.TenSV
FROM LOP l
INNER JOIN SINHVIEN sv ON l.MaLop = sv.MaLop
INNER JOIN DATPHONG dp ON sv.MaSV = dp.MaSV
WHERE l.NamBD = 2020;

-- Câu 5: Mã phòng được bàn giao bởi 'Nguyễn Văn A' (Không cần JOIN bảng PHONG)
SELECT DISTINCT MaP
FROM DATPHONG
WHERE NguoiGiao = N'Nguyễn Văn A';