import 'dart:io';

Future<List<String>> readLinesOfFileFromPath(String path) async {
  try {
    Future<List<String>> linesOfFile = File(path).readAsLines();
    return await linesOfFile;
  } catch (e) {
    print("Ocurred an error when tried to read file: $e");
    return [];
  }
}
