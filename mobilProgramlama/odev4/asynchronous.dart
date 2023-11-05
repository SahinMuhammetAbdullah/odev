import 'dart:async';

Future<void> main() async {
  final List<int> inputList = [1, 2, 3, 4, 5];
  final List<int> modifiedList = await multiplyAsync(inputList);

  print('Original List: $inputList');
  print('Modified List: $modifiedList');
}

Future<List<int>> multiplyAsync(List<int> inputList) async {
  final List<Future<int>> futures = inputList.map((int value) async {
    await Future.delayed(
        Duration(seconds: 1));
    return value * 2;
  }).toList();

  final List<int> modifiedList = await Future.wait(futures);

  return modifiedList;
}
