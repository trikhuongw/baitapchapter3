import 'dart:io';

// Hàm giải mã chuỗi, tìm lại M từ N
String decode(String encoded) {
  // Giữ chuỗi hiện tại là chuỗi kết quả ban đầu
  String current = encoded;

  while (true) {
    String next = '';
    int i = 0;

    // Thực hiện việc giải mã theo dạng: "2" -> số lần lặp, "1" -> số xuất hiện
    while (i < current.length) {
      // Kiểm tra nếu chỉ mục tiếp theo nằm ngoài phạm vi chuỗi
      if (i + 1 >= current.length) {
        print("Lỗi: Chuỗi đầu vào không hợp lệ.");
        return "";
      }

      int repeatCount = int.parse(current[i]); // Số lần lặp của số
      String digit = current[i + 1];           // Số cần lặp
      next += digit * repeatCount;             // Thêm vào kết quả số được lặp nhiều lần
      i += 2;                                  // Tăng i để bỏ qua số đã được xử lý
    }

    // Kiểm tra điều kiện dừng: Nếu chiều dài chuỗi giải mã <= 3, chuỗi đã quay về trạng thái ban đầu
    if (next.length <= 3) {
      return next;  // Đây là số M ban đầu
    }
    current = next;  // Cập nhật chuỗi cho lần lặp tiếp theo
  }
}

void main() {
  // Nhập chuỗi N từ người dùng
  print("Khai báo biến N:");
  String N = stdin.readLineSync()!;

  // Kiểm tra chuỗi N có độ dài chẵn hay không (mỗi số phải có một ký tự đi kèm)
  if (N.length % 2 != 0) {
    print("Lỗi: Chuỗi đầu vào không hợp lệ.");
    return;
  }

  // Tìm số M
  String M = decode(N);

  // Xuất kết quả nếu không có lỗi
  if (M.isNotEmpty) {
    print("Số M tìm được là: $M");
  }
}

