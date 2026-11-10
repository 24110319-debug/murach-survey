# EX4 — Java Servlet/JSP Survey

Dự án học tập sử dụng Java Servlet, JSP và Maven. Ứng dụng nhận thông tin
đăng ký email và hiển thị trang xác nhận.

## Cấu trúc
- `src/main/webapp/index.html`: form đăng ký.
- `src/main/webapp/styles/main.css`: định dạng giao diện.
- `src/main/java/murach/email/EmailListServlet.java`: nhận và kiểm tra dữ liệu.
- `src/main/java/murach/business/User.java`: JavaBean chứa thông tin đăng ký.
- `src/main/java/murach/data/UserDB.java`: lưu dữ liệu minh họa trong bộ nhớ.
- `src/main/webapp/thanks.jsp`: hiển thị xác nhận.
- `src/main/webapp/WEB-INF/web.xml`: cấu hình Servlet.
- `pom.xml`: cấu hình Maven và tạo `ex4.war`.

## Build và chạy
1. Cài JDK 8 trở lên, Maven và Apache Tomcat 10.1.61.
2. Mở terminal tại thư mục chứa `pom.xml`.
3. Chạy `mvn clean package` để tạo `target/ex4.war`.
4. Chép `target/ex4.war` vào thư mục `webapps` của Tomcat 10.1.61 rồi khởi động Tomcat.
5. Mở `http://localhost:8080/ex4/`.

Không mở `index.html` trực tiếp; Servlet và JSP cần chạy qua Tomcat.

## Luồng dữ liệu
Form gửi POST tới `/emailList`. Servlet kiểm tra và chuẩn hóa tên, email,
tạo `User` với ngày sinh và các lựa chọn khảo sát, gọi `UserDB.insert`,
sau đó chuyển tiếp tới `thanks.jsp`. Trang xác nhận hiển thị ngày sinh
theo định dạng `dd/MM/yyyy`, các lựa chọn đã gửi và xuất dữ liệu bằng
JSTL `c:out`. Giao diện dùng màu chữ xanh nước biển.

`UserDB` chỉ là nơi lưu tạm trong bộ nhớ để phục vụ bài tập; dữ liệu bị xóa
khi ứng dụng khởi động lại. Đây không phải hệ thống lưu trữ production.

## Docker
Từ thư mục chứa `Dockerfile`, chạy:

```sh
docker build -t ex4 .
docker run --rm -p 8080:8080 ex4
```

Sau đó mở `http://localhost:8080/`.
