import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/news_model.dart';

class NewsService {
  final String apiUrl =
      'https://techcrunch.com/wp-json/wp/v2/posts?_embed&per_page=3';

  Future<List<News>> fetchLatestNews() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((item) => News.fromJson(item)).toList();
      } else {
        throw Exception('Error al obtener noticias: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error en la solicitud: $e');
    }
  }
}
