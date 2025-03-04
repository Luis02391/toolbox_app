import 'dart:convert';
import 'package:http/http.dart' as http;

class GenderService {
  static Future<String?> predictGender(String name) async {
    final response =
        await http.get(Uri.parse('https://api.genderize.io/?name=$name'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['gender'] as String?;
    } else {
      return null;
    }
  }
}
