import 'dart:io';

void main() {
  // Nhập giá trị a và b từ bàn phím
  print("Nhập giá trị a:");
  int a = int.parse(stdin.readLineSync()!);

  print("Nhập giá trị b:");
  int b = int.parse(stdin.readLineSync()!);

  // Tìm số chia hết cho 6 đầu tiên lớn hơn hoặc bằng a
  int start = (a % 6 == 0) ? a : a + (6 - a % 6);

  // Tìm số chia hết cho 6 cuối cùng nhỏ hơn hoặc bằng b
  int end = b - (b % 6);

  // Nếu không có số nào chia hết cho 6 trong khoảng [a, b]
  if (start > end) {
    print("Không có số nào thỏa mãn trong khoảng [$a, $b].");
    return;
  }

  // Tính số lượng các số chia hết cho 6
  int count = ((end - start) ~/ 6) + 1;

  // Tính tổng các số chia hết cho 6 trong khoảng [start, end]
  int sum = (count * (start + end)) ~/ 2;

  // Xuất kết quả
  print("Số lượng các số chẵn chia hết cho 3 trong khoảng [$a, $b]: $count");
  print("Tổng của các số này: $sum");
}
