import 'dart:io';

void main() {
  print("Ilk sayiyi girin:");
  int firstNumber = int.parse(stdin.readLineSync()!);

  print("Ikinci :");
  int secondNumber = int.parse(stdin.readLineSync()!);

  print("3 saniye bekleyinz...");
  Future.delayed(Duration(seconds: 3), () {
    int sum = firstNumber + secondNumber;
    print("$firstNumber + $secondNumber = $sum");
  });
}
