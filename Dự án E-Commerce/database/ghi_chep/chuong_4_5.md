# Chương 4 & 5: Thiết kế DATABASE E-COMMERCE
## 1. Code này làm gì ?
- tạo ra ba bản nền móng cho sàn E-commerce:Người dùng (`users`), Sản phẩm (`products`), và Đơn hàng (`orders`).
### 2.Từ khoá code cần nhớ
- **SERIAL:** Máy bấm số tự động cho ID (1, 2, 3,...).<số liên tiếp>
- **VARCHAR /TEXT:** Hộp chứa chữ (<VARCHAR> giới hạn kí tự, <TEXT> dài vô biên).
- **NUMERIC(12,2):** Hộp chứa tiền (chính xác đến từ con số lẻ).
- **PRIMARY KEY (khoá chính):** số chứng minh của dòng dữ liệu(cấm trùng, cấm trống)
- **FOREIGN KEY (khoá ngoại):** Cột mượn từ bản khác sang để liên kết dữ liệu(Ví dụ: `orders` mượn `user_id` để biết ai mua).
## 3. Lưu ý xương máu
- **ON DELETE RESTRICT:** khoá của bảo vệ. Không cho xoá khách hàng nếu ông đó vẫn còn đơn hàng trong hệ thống.