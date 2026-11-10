# Chapter 02 — Java Servlet/JSP MVC

Dự án học tập dựa trên Chapter 02 slides, Murach’s Java Servlets/JSP (3rd Ed.).

## Cấu trúc
- src/main/webapp/index.html: form đăng ký.
- src/main/webapp/styles/main.css: định dạng giao diện.
- src/main/java/murach/email/EmailListServlet.java: Controller.
- src/main/java/murach/business/User.java: JavaBean chứa dữ liệu.
- src/main/java/murach/data/UserDB.java: lớp lưu dữ liệu minh họa.
- src/main/webapp/thanks.jsp: hiển thị kết quả.
- src/main/webapp/WEB-INF/web.xml: cấu hình URL và trang mặc định.
- pom.xml: cấu hình Maven.

## Chạy từng bước
1. Chuẩn bị JDK 8 trở lên, Maven và Apache Tomcat 9 (dự án dùng javax.servlet).
2. Giải nén ZIP. Mở thư mục Chapter02-MVC bằng IDE hỗ trợ Maven, hoặc mở terminal tại thư mục chứa pom.xml.
3. Chạy: `mvn clean package` (lần đầu cần Internet tải thư viện).
4. Chép target/chapter02-mvc.war vào thư mục webapps của Tomcat 9.
5. Khởi động Tomcat: Windows dùng bin/startup.bat; Linux/macOS dùng bin/startup.sh.
6. Mở http://localhost:8080/chapter02-mvc/ (nếu Tomcat dùng cổng khác, thay 8080).
7. Nhập email, tên và họ, nhấn Join Now. Trang cảm ơn hiển thị thông tin. Nhấn Return để quay lại.

Không mở index.html trực tiếp để chạy Servlet/JSP. Cần chạy qua Tomcat.

## Luồng dữ liệu
index.html gửi POST tới emailList. Servlet lấy các parameter, tạo User,
gọi UserDB.insert, đặt attribute user rồi forward tới thanks.jsp.
JSP đọc thuộc tính của User bằng EL, xuất nội dung qua c:out.

## Phần bổ sung so với slide
Slide chưa có mã UserDB: bản này bổ sung lưu trong bộ nhớ để minh họa,
không dùng SQL và không cần cấu hình database. Dữ liệu mất khi ứng dụng khởi động lại.
Đã bổ sung pom.xml, UTF-8, kiểm tra đầu vào cơ bản và escape dữ liệu đầu ra bằng JSTL.
GET hiển thị form; POST xử lý đăng ký. Đây là dự án học tập.
Chưa build/chạy trên Tomcat trong môi trường tạo tệp nếu không có Maven/Tomcat.
