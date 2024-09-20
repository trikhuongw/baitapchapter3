import 'dart:io';

List<int> findBeautifulNumbers(int A, int B) {
  // Sieve of Eratosthenes để tìm các số nguyên tố
  List<bool> isPrime = List.generate(B, (i) => true);
  for (int p = 2; p * p < B; p++) {
    if (isPrime[p]) {
      for (int i = p * p; i < B; i += p) {
        isPrime[i] = false;
      }
    }
  }

  List<int> beautifulNumbers = [];
  for (int i = A; i < B; i++) {
    if (isPrime[i] && isPalindrome(i)) {
      beautifulNumbers.add(i);
    }
  }
  return beautifulNumbers;
}

bool isPalindrome(int number) {
  String numStr = number.toString();
  return numStr == numStr.split('').reversed.join();
}

void main() {
  print('Nhập số A: ');
  int A = int.parse(stdin.readLineSync()!);

  print('Nhập số B: ');
  int B = int.parse(stdin.readLineSync()!);
  // int A = 11111;
  // int B = 22222;
  List<int> results = findBeautifulNumbers(A, B);
  print("Số lượng biển số đẹp: ${results.length}");
  print("Các biển số đẹp: $results");
}