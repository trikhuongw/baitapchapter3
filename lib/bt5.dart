
import 'dart:io';

int minRoomsRequired(List<List<int>> contests) {
  // Sắp xếp các cuộc thi dựa trên thời gian bắt đầu
  contests.sort((a, b) => a[0].compareTo(b[0]));

  // Danh sách để theo dõi thời gian kết thúc của các cuộc thi (giả lập min-heap)
  List<int> endTimes = [];

  // Thêm thời gian kết thúc của cuộc thi đầu tiên vào danh sách
  endTimes.add(contests[0][1]);

  // Duyệt qua các cuộc thi còn lại
  for (int i = 1; i < contests.length; i++) {
    // Sắp xếp lại danh sách thời gian kết thúc (giả lập min-heap)
    endTimes.sort();

    // Nếu thời gian bắt đầu của cuộc thi hiện tại >= thời gian kết thúc sớm nhất
    if (contests[i][0] >= endTimes.first) {
      // Tái sử dụng phòng, loại bỏ cuộc thi kết thúc sớm nhất
      endTimes.removeAt(0);
    }
    // Thêm thời gian kết thúc của cuộc thi hiện tại vào danh sách
    endTimes.add(contests[i][1]);
  }

  // Số phòng cần thiết chính là số phần tử còn lại trong danh sách
  return endTimes.length;
}

void main() {
  // Đọc dữ liệu đầu vào từ người dùng
  print('Nhập số lượng cuộc thi:');
  int N = int.parse(stdin.readLineSync()!);  // Số lượng cuộc thi
  List<List<int>> contests = [];

  print('Nhập thời gian bắt đầu và kết thúc của mỗi cuộc thi:');
  for (int i = 0; i < N; i++) {
    List<int> contest = stdin.readLineSync()!
        .split(' ')
        .map((e) => int.parse(e))
        .toList();
    contests.add(contest);
  }

  // Tính số phòng ít nhất cần thiết
  int result = minRoomsRequired(contests);

  // Ghi kết quả ra màn hình
  print('Số phòng cần thiết: $result');
}
