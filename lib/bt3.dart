import 'dart:io';

BigInt giaiThua(BigInt n) {
  BigInt result = BigInt.one;
  for (BigInt i = BigInt.from(2); i <= n; i = i + BigInt.one) {
    result *= i;
  }
  return result;
}

BigInt fibonacciMatrix(int n) {
  if (n < 0) return BigInt.zero;
  if (n == 0) return BigInt.zero;
  if (n == 1) return BigInt.one;

  // Ma trận cơ sở [[1, 1], [1, 0]]
  List<List<BigInt>> F = [
    [BigInt.one, BigInt.one],
    [BigInt.one, BigInt.zero]
  ];

  // Nâng ma trận cơ sở lên lũy thừa (n - 1)
  _matrixPower(F, n - 1);

  // Kết quả Fibonacci là F[0][0] sau khi tính xong
  return F[0][0];
}

void _matrixPower(List<List<BigInt>> F, int n) {
  if (n <= 1) return;

  // Ma trận cơ sở để nhân
  List<List<BigInt>> M = [
    [BigInt.one, BigInt.one],
    [BigInt.one, BigInt.zero]
  ];

  _matrixPower(F, n ~/ 2); // Đệ quy tính lũy thừa ma trận
  _multiplyMatrices(F, F); // Nhân ma trận F với chính nó

  if (n % 2 != 0) {
    _multiplyMatrices(F, M); // Nhân thêm ma trận cơ sở nếu n lẻ
  }
}

void _multiplyMatrices(List<List<BigInt>> F, List<List<BigInt>> M) {
  // Tính toán nhân hai ma trận 2x2
  BigInt x = F[0][0] * M[0][0] + F[0][1] * M[1][0];
  BigInt y = F[0][0] * M[0][1] + F[0][1] * M[1][1];
  BigInt z = F[1][0] * M[0][0] + F[1][1] * M[1][0];
  BigInt w = F[1][0] * M[0][1] + F[1][1] * M[1][1];

  F[0][0] = x;
  F[0][1] = y;
  F[1][0] = z;
  F[1][1] = w;
}

bool isPrime(int n) {
  if (n <= 1) {
    return false;
  }
  if (n <= 3) {
    return true;
  }
  if (n % 2 == 0 || n % 3 == 0) {
    return false;
  }
  for (var i = 5; i * i <= n; i += 6) {
    if (n % i == 0 || n % (i + 2) == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  print('Nhập các phần tử của dãy (cách nhau bởi dấu phẩy): ');
  String input = stdin.readLineSync()!;

  // Chia chuỗi đầu vào thành các phần tử và chuyển sang dạng số nguyên
  List<String> numbersStr = input.split(',');
  List<int> numbers = [];

  for (String numberStr in numbersStr) {
    try {
      int number = int.parse(numberStr.trim());
      numbers.add(number);
    } catch (e) {
      print('Lỗi: Vui lòng nhập số nguyên hợp lệ.');
    }
  }

  // Sắp xếp giảm dần và kiểm tra số lượng phần tử
  if (numbers.length < 2) {
    print('Không đủ phần tử để tìm số lớn thứ hai.');
  } else {
    // Sắp xếp danh sách giảm dần
    numbers.sort((a, b) => b - a);

    // Lấy số lớn thứ hai
    int soThu2LonNhat = numbers[1];
    print('Số thứ hai lớn nhất là: $soThu2LonNhat');

    // Kiểm tra tính chất của số thứ hai
    print('Số lớn thứ hai là số ${soThu2LonNhat % 2 == 0 ? 'chẵn' : 'lẻ'}');
    print('Số lớn thứ hai ${isPrime(soThu2LonNhat) ? 'là' : 'không phải là'} số nguyên tố');
    print('Giai thừa của số lớn thứ hai là: ${giaiThua(BigInt.from(soThu2LonNhat))}');
    print('Số Fibonacci thứ $soThu2LonNhat là: ${fibonacciMatrix(soThu2LonNhat)}');
  }
}


