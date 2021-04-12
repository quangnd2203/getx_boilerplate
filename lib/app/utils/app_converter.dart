import 'dart:convert';

class AppConverter {
  AppConverter._();

  static Map<String, dynamic> parseSocketData(dynamic input) {
    if (input == null) return null;
    try {
      if (input is String) {
        return jsonDecode(input);
      }
      return jsonDecode(jsonEncode(input));
    } catch (e) {
      return input;
    }
  }
}
