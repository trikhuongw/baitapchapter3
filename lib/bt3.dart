import 'dart:io';

BigInt giaiThua(BigInt n) {
  BigInt result = BigInt.one;
  for (BigInt i = BigInt.from(2); i <= n; i = i + BigInt.one) {
    result *= i;
  }
  return result;
}

int fibonacci(int n) {
  List<int> fib = [0, 1];
  for (int i = 2; i <= n; i++) {
    fib.add(fib[i - 1] + fib[i - 2]);
  }
  return fib[n];
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
    print('Số Fibonacci thứ $soThu2LonNhat là: ${fibonacci(soThu2LonNhat)}');
  }
}


