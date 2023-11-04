import 'dart:async';
import 'dart:io';

Future<void> main() async {
  List<int> inputList = await readIntegersFromInput();

  if (inputList.isEmpty) {
    print("The list is empty.");
    return;
  }

  List<int> modifiedList = await multiplyByTwoAsync(inputList);

  print("Modified List: $modifiedList");
}

Future<List<int>> readIntegersFromInput() async {
  print("Enter a list of integers separated by spaces:");
  String? input = stdin.readLineSync();

  List<int> inputList = input!.split(' ').map((String str) {
    try {
      return int.parse(str);
    } catch (e) {
      return 0; // Use 0 for non-integer inputs
    }
  }).toList();

  return inputList;
}

Future<List<int>> multiplyByTwoAsync(List<int> inputList) async {
  List<int> modifiedList = [];

  for (int number in inputList) {
    int result = await multiplyByTwo(number);
    modifiedList.add(result);
  }

  return modifiedList;
}

Future<int> multiplyByTwo(int number) async {
  await Future.delayed(Duration(seconds: 1)); // Simulate asynchronous operation
  return number * 2;
}
