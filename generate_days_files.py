from os import makedirs, path
from sys import argv

listOfFiles = ['example_text_part1.txt', 'example_text_part2.txt', 'input_text_part1.txt', 'input_text_part2.txt', 'part1.dart', 'part2.dart']

def generateDaysFiles(day):
  directory_path = path.join('.', f'day{day}')
  if not path.exists(directory_path):
    try:
        makedirs(directory_path)
        print(f'Success(Directory {directory_path} created)')
    except OSError:
        print(f'Creation of the directory {directory_path} failed.')
  else:
    print(f'Directory {directory_path} already exists.')
    return
  for idx, file in enumerate(listOfFiles):
    try:
      with open(path.join(directory_path, file), 'x') as f:
        if idx <= len(listOfFiles) - 2:
          f.write('')
        if idx == len(listOfFiles) - 2:
          f.write(f"// Advent of Code 2023 Day {day} Part 1\n\nimport \'../utils/read_files.dart\';\n\nvoid main(List<String> args) async {{\n\tfinal bool test = true;\n\tfinal String inputFile =\n\t\t\ttest ? \'example_text_part1.txt\' :\'input_text_part1.txt\';\n\tfinal List<String> linesOfFile = await readLinesOfFileFromPath('$inputFile');\n\tfinal int answer = resolve(linesOfFile);\n\n\tprint(\'The answer is: $answer\');\n}}\n\nint resolve(List<String> linesOfFile) {{\n\tint sum = 0;\n\n\tlinesOfFile.forEach((line) {{\n\t\t// TODO: implement logic here\n\t}});\n\treturn sum;\n}}\n")
        elif idx == len(listOfFiles) - 1:
          f.write(f"// Advent of Code 2023 Day {day} Part 2\n\nimport \'../utils/read_files.dart\';\n\nvoid main(List<String> args) async {{\n\tfinal bool test = true;\n\tfinal String inputFile =\n\t\t\ttest ? \'example_text_part2.txt\' :\'input_text_part2.txt\';\n\tfinal List<String> linesOfFile = await readLinesOfFileFromPath('$inputFile');\n\tfinal int answer = resolve(linesOfFile);\n\n\tprint(\'The answer is: $answer\');\n}}\n\nint resolve(List<String> linesOfFile) {{\n\tint sum = 0;\n\n\tlinesOfFile.forEach((line) {{\n\t\t// TODO: implement logic here\n\t}});\n\treturn sum;\n}}\n")
      print(f'Success(File {file} created in {directory_path} directory')
    except FileExistsError:
      print(f'File {file} already exists in ./day{day} directory')
      return
    
if __name__ == "__main__":
  try:
    day = argv[1].zfill(2)
    if int(day) < 1 or int(day) > 25:
      raise ValueError
    generateDaysFiles(day)
  except ValueError:
    print('Day must be a number between 1 and 25')