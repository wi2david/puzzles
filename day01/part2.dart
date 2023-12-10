// Advent of Code 2023 Day 01 Part 2

import '../utils/read_files.dart';

void main(List<String> args) async {
	final bool test = true;
	final String inputFile =
			test ? 'example_text_part2.txt' :'input_text_part2.txt';
	final List<String> linesOfFile = await readLinesOfFileFromPath('$inputFile');
	final int answer = resolve(linesOfFile);

	print('The answer is: $answer');
}

int resolve(List<String> linesOfFile) {
	int sum = 0;

	linesOfFile.forEach((line) {
		// TODO: implement logic here
	});
	return sum;
}
