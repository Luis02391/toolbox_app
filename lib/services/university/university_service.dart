import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/university_model.dart';

class UniversityService {
  static Future<List<UniversityModel>> fetchUniversities(String country) async {
    final url = Uri.parse('http://universities.hipolabs.com/search?country=$country');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => UniversityModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar universidades');
    }
  }
}
