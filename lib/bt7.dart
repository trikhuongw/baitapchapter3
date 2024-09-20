import 'dart:io';

Set<int> findDivisibleBy3(int n) {
  Set<int> numbers = Set(); // Sử dụng Set để tránh trùng lặp

  // Đổi số nguyên thành chuỗi
  String numStr = n.toString();
  numbers.add(n); // Thêm số nguyên gốc vào tập hợp

  // Tạo các số mới bằng cách xóa từng chữ số
  for (int i = 0; i < numStr.length; i++) {
    for (int j = i + 1; j <= numStr.length; j++) {
      String substring = numStr.substring(0, i) + numStr.substring(j);

      // Kiểm tra nếu chuỗi không trống và không bắt đầu bằng '0' (trừ trường hợp chuỗi chỉ có '0')
      if (substring.isNotEmpty && (substring[0] != '0' || substring == '0')) {
        try {
          // Chuyển chuỗi thành số nếu hợp lệ
          int num = int.parse(substring);
          numbers.add(num);
        } catch (e) {
          // Bắt lỗi trong trường hợp không thể chuyển đổi chuỗi thành số
          print("Không thể chuyển chuỗi '$substring' thành số.");
        }
      }
    }
  }

  // Lọc các số chia hết cho 3
  Set<int> divisibleBy3 = numbers.where((num) => num % 3 == 0).toSet();

  return divisibleBy3;
}

void main() {
  print('Nhập số nguyên dương n: ');
  try {
    int n = int.parse(stdin.readLineSync()!);
    Set<int> result = findDivisibleBy3(n);

    print("Các số chia hết cho 3:");
    for (int num in result) {
      print(num);
    }
    print("Số lượng số chia hết cho 3: ${result.length}");
  } catch (e) {
    print("Lỗi: Vui lòng nhập một số nguyên dương hợp lệ.");
  }
}

