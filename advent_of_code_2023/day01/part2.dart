// Advent of Code 2023 Day 01 Part 2

import '../utils/read_files.dart';

void main(List<String> args) async {
  final bool test = false;
  final String inputFile =
      test ? 'example_text_part2.txt' : 'input_text_part1_and_part2.txt';
  final List<String> linesOfFile = await readLinesOfFileFromPath(inputFile);
  final int answer = resolve(linesOfFile);

  print('The answer is: $answer');
}

int resolve(List<String> linesOfFile) {
  int sum = 0;

  linesOfFile.forEach((line) {
    // TODO: implement logic here
    final int number = findNumber(line);
    // print('Number: $number');
    sum += number;
  });
  // print(sum);
  return sum;
}

// Auxiliar functions go here

int findNumber(String line) {
  final Map<String, int> numbersMap = {
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9,
    '1': 1,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9
  };
  try {
    final int compositeNumber;

    final RegExp regExp = RegExp('(${numbersMap.keys.join('|')})');
    // print(regExp);

    final String firstDigit = regExp.allMatches(line).first.group(0)!;
    // print(firstDigit);

    final RegExp reversedRegExp =
        RegExp('(${numbersMap.keys.map((key) => reversed(key)).join('|')})');
    // print(reversedRegExp);

    final String reversedLine = reversed(line);
    // print(reversedLine);
    final String lastDigit =
        reversedRegExp.allMatches(reversedLine).first.group(0)!;
    // print(lastDigit);

    compositeNumber =
        (numbersMap[firstDigit]! * 10) + numbersMap[reversed(lastDigit)]!;
    //print(compositeNumber);
    return compositeNumber;
  } catch (e) {
    throw Exception('No number found in line: $line');
  }
}

String reversed(String str) => str.split('').reversed.join();
