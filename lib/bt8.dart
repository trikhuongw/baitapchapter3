import 'dart:io';

void main() {
  try {
    // Nhập chỉ số điện trên một dòng duy nhất
    print('Nhập chỉ số điện tiêu dùng (X1 Y1), sản xuất (X2 Y2), và kinh doanh (X3 Y3):');
    List<int> consumption = stdin.readLineSync()!
        .split(' ')
        .map((e) => int.parse(e))
        .toList();

    // Kiểm tra nếu người dùng nhập thiếu giá trị
    if (consumption.length != 6) {
      throw Exception("Vui lòng nhập đủ 6 giá trị cho chỉ số điện tiêu dùng, sản xuất và kinh doanh.");
    }

    // Nhập bảng giá điện cho các bậc thang trên một dòng duy nhất
    print('Nhập bảng giá điện (A1, B1, C1, A2, B2, C2, A3, B3, C3):');
    List<int> prices = stdin.readLineSync()!
        .split(' ')
        .map((e) => int.parse(e))
        .toList();

    // Kiểm tra nếu người dùng nhập thiếu giá trị bảng giá
    if (prices.length != 9) {
      throw Exception("Vui lòng nhập đủ 9 giá trị cho bảng giá điện.");
    }

    // Tính toán số lượng kWh tiêu thụ cho từng loại
    List<int> kWh = [
      consumption[1] - consumption[0], // kWh tiêu dùng
      consumption[3] - consumption[2], // kWh sản xuất
      consumption[5] - consumption[4]  // kWh kinh doanh
    ];

    // Kiểm tra các giá trị kWh phải >= 0
    for (int i = 0; i < kWh.length; i++) {
      if (kWh[i] < 0) {
        throw Exception("Lượng điện tiêu thụ không hợp lệ (kWh không được âm).");
      }
    }

    // Hàm tính tiền điện cho loại tiêu dùng
    int calculateBillForType1(int kWh, int a1, int b1, int c1) {
      int bill = 0;
      if (kWh > 150) {
        bill += 50 * a1 + 100 * b1 + (kWh - 150) * c1;
      } else if (kWh > 50) {
        bill += 50 * a1 + (kWh - 50) * b1;
      } else {
        bill += kWh * a1;
      }
      return bill;
    }

    // Hàm tính tiền điện cho loại sản xuất
    int calculateBillForType2(int kWh, int a2, int b2, int c2) {
      int bill = 0;
      if (kWh > 1000) {
        bill += 200 * a2 + 800 * b2 + (kWh - 1000) * c2;
      } else if (kWh > 200) {
        bill += 200 * a2 + (kWh - 200) * b2;
      } else {
        bill += kWh * a2;
      }
      return bill;
    }

    // Hàm tính tiền điện cho loại kinh doanh
    int calculateBillForType3(int kWh, int a3, int b3, int c3) {
      int bill = 0;
      if (kWh > 200) {
        bill += 100 * a3 + 100 * b3 + (kWh - 200) * c3;
      } else if (kWh > 100) {
        bill += 100 * a3 + (kWh - 100) * b3;
      } else {
        bill += kWh * a3;
      }
      return bill;
    }

    // Tính tổng tiền điện
    int totalBill = calculateBillForType1(kWh[0], prices[0], prices[1], prices[2]) +
        calculateBillForType2(kWh[1], prices[3], prices[4], prices[5]) +
        calculateBillForType3(kWh[2], prices[6], prices[7], prices[8]);

    // Xuất kết quả
    print("Tổng số tiền phải trả: $totalBill");

  } catch (e) {
    print("Lỗi: ${e.toString()}");
  }
}
