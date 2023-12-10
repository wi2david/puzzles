// Advent of Code 2023 Day 01 Part 1

import '../utils/read_files.dart';

void main(List<String> args) async {
  final bool test = false;
  final String inputFile =
      test ? 'example_text_part1.txt' : 'input_text_part1_and_part2.txt';
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
  final RegExp regExp = RegExp(r'(\d)');
  try {
    final int compositeNumber;
    final String firstDigit = regExp.firstMatch(line)!.group(0)!;
    // print(firstDigit);

    final String lineReversed = line.split('').reversed.join();
    final String lastDigit = regExp.firstMatch(lineReversed)!.group(0)!;
    // print(lastDigit);

    compositeNumber = int.parse(firstDigit + lastDigit);
    return compositeNumber;
  } catch (e) {
    throw Exception('No number found in line: $line');
  }
}
