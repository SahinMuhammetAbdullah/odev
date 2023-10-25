import 'dart:io';

int add(int num1, [int num2 = 0]) {
  int sum = num1 + num2;
  return sum;
}

int sub(int num1, [int num2 = 0]) {
  int sub = num1 - num2;
  return sub;
}

int mul(int num1, [int num2 = 1]) {
  int mul = num1 * num2;
  return mul;
}

double div(int num1, [int num2 = 1]) {
  double div = num1 / num2;
  return div;
}

String? calculator({required String transactions}) {
  if (transactions == '+') {
    print("Lutfen islem yapmak istediginiz ilk sayiyi giriniz:");
    int? num1 = int.parse(stdin.readLineSync()!);
    print("Lutfen islem yapmak istediginiz ikinci sayiyi giriniz:");
    var num2 = int.tryParse(stdin.readLineSync()!);
    print("-------------------------------------------------------------");
    if (num2 == null) {
      print("Sonuc: ${add(num1)}");
    } else {
      print("Sonuc: ${add(num1, num2)}");
    }

    print("-------------------------------------------------------------");
    return '0';
  } else if (transactions == '-') {
    print("Lutfen islem yapmak istediginiz ilk sayiyi giriniz:");
    int? num1 = int.parse(stdin.readLineSync()!);
    print("Lutfen islem yapmak istediginiz ikinci sayiyi giriniz:");
    var num2 = int.tryParse(stdin.readLineSync()!);
    print("-------------------------------------------------------------");
    if (num2 == null) {
      print("Sonuc: ${sub(num1)}");
    } else {
      print("Sonuc: ${sub(num1, num2)}");
    }
    print("-------------------------------------------------------------");
    return '0';
  } else if (transactions == '*') {
    print("Lutfen islem yapmak istediginiz ilk sayiyi giriniz:");
    int? num1 = int.parse(stdin.readLineSync()!);
    print("Lutfen islem yapmak istediginiz ikinci sayiyi giriniz:");
    var num2 = int.tryParse(stdin.readLineSync()!);
    print("-------------------------------------------------------------");
    if (num2 == null) {
      print("Sonuc: ${mul(num1)}");
    } else {
      print("Sonuc: ${mul(num1, num2)}");
    }
    print("-------------------------------------------------------------");
    return '0';
  } else if (transactions == '/') {
    print("Lutfen islem yapmak istediginiz ilk sayiyi giriniz:");
    int? num1 = int.parse(stdin.readLineSync()!);
    print("Lutfen islem yapmak istediginiz ikinci sayiyi giriniz:");
    var num2 = int.tryParse(stdin.readLineSync()!);
    print("-------------------------------------------------------------");
    if (num2 == null) {
      print("Sonuc: ${div(num1)}");
    } else {
      print("Sonuc: ${div(num1, num2)}");
    }
    print("-------------------------------------------------------------");
    return '0';
  } else {
    return 'Hatali islem!!!';
  }
}

void main() {
  print("Hesap makinasina hosgeldiniz:");
  var tran;
  while (tran != 'x') {
    print(
        "Toplama islemi icin -> '+'\nCikartma islemi icin -> '-'\nCarpma islemi icin -> '*'\nBolme islemi icin -> '/'\nCikmak icin -> 'x'\nLutfen yapmak istediginiz islemi girinzi:");
    String? tran = stdin.readLineSync();
    tran = tran!;
    if (tran == 'x') {
      print("Hesap makinasi sonlandirildi...");
      break;
    }
    calculator(transactions: tran);
  }
}
