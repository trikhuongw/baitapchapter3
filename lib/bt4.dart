import 'dart:io';
import 'dart:math';

void main() {
  // đọc số lượng đoạn đường n
  print('Nhập số đoạn đường: ');
  int n = int.parse(stdin.readLineSync()!);

  // Nhập các khoảng cách trung bịnh giữ các phương tiện giao thông trên các đoạn đuoờng
  List<int> distances = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  // Biến lưu độ lệch nhỏ nhất
  int minDifference = 109; // theo đề bài

  //Duyệt qua tất cả các cặp đường để tìm độ lệch nhỏ nhất
  for(var i = 0; i < n - 1; i++){
    for(var j = i + 1; j < n; j++){
      int difference = (distances[i] - distances[j]).abs(); // tính độ lệch
      minDifference = min(minDifference, difference); //cập nhật độ lệch nhỏ nhất
    }
  }

  // In ra kết quả độ lệch nhỏ nhất tìm được
  print('kết quả: $minDifference');
}