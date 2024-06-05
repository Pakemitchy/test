import 'dart:convert';
import 'dart:io';

class JsonHandler {
  final String filePath;

  JsonHandler(this.filePath);

  Future<List<Map<String, String>>> readTestimonials() async {
    try {
      final file = File(filePath);
      final contents = await file.readAsString();
      final List<dynamic> jsonList = jsonDecode(contents);
      return jsonList.cast<Map<String, String>>();
    } catch (e) {
      print('Error reading file: $e');
      return [];
    }
  }

  Future<void> writeTestimonials(List<Map<String, String>> testimonials) async {
    try {
      final file = File(filePath);
      final encodedJson = jsonEncode(testimonials);
      await file.writeAsString(encodedJson);
    } catch (e) {
      print('Error writing file: $e');
    }
  }
}