## BƯỚP TRANH TỔNG THỂ

## 1. Quyển sổ <users>(Quản lý con người).
- Nhiệm vụ: Lưu thông của tất cả những ai đặt chân lên sàn (khách mua, người mua, admin).
- Quy định: Mỗi người có mã định danh <user_id> riêng. Email cấm được trùm nhau.

## 2. Quyển sổ <categories>(Quản lý danh mục).
- Nhiệm vụ: chia nhóm hàng hoá cho ngăn lắp(vd: điện thoại, laptop).
- Quy định danh mục cha, danh mục con lồng vào nhau để sau này khách dễ tìm kiếm.

## 3. Quyển sổ <products>(Quản lý hàng hoá)
- Nhiệm vụ: lưu tên sản phẩm(iphone, samsung,...) giá tiền số lượng tồn trong kho.
- Quy định: giá tiền và số lượng cấm vượt qua tiền số âm. Mỗi sản phẩm phải được nhãn dán thuộc danh mục nào (category_id).

## 4. Quyển sổ <orders>(Quản lý đơn tổng)
- Nhiệm vụ: Ghi lại thông tin chung khi có người bấm nút "Mua hàng".
- Dữ liệu lưu trữ: Mã đơn hàng, Ai mua(user_id), ngày giờ mua, địa chỉ ship và Tổng số tiền của hoá đơn đó.

## 5. Quyển sổ <order_items> (Chi tiết giỏ hàng)
- Nhiệm vụ: đây là quyển sổ trung gian, giải quyết 1 bài toán 1 người mua nhiều món một lúc.
- Cách hoạt động: Nó ghi rõ đơn Hàng số 1 gồm những món nào: 1 cái Iphone(22tr) và 1 cái macbook(   25tr). Nó là 1 công thức tự động nhân tiền: Số lượng * đơn giá =  thành tiền.

## "JOIN" NGHĨA LÀ GÌ ? TẠI SAO PHẢI DÙNG NÓ ?

khi tách thành 5 quyển sổ độc lập như trên, dữ liệu sẽ rất sạch sẽ. Nhưng sếp bảo: "Xuất cho tôi báo cáo xem Đơn hàng số 1 là ai mua và mua những món gì?", bạn <không thể đưa> 5 quyển sổ bắt sếp tự dò được.

JOIN chính là hành động `"đặt các quyển sổ cạnh nhau và nối chúng lại"` dựa trên các mã số chung:

- Nhìn vào Đơn hàng thấy `user_id = 1` -> JOIN sang quyển sổ users để `bốc cái tên "Nguyen Van A" ra`.
- Nhìn vào Chi tiết giỏ hàng thấy `product_id = SP001` -> JOIN sang quyển sổ products để `lấy cái tên "iPhone 15"`.

