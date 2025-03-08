import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/weather_model.dart';

class WeatherService {

  static Future<WeatherModel?> getWeather() async {
    final response = await http.get(
      Uri.parse('https://api.weatherapi.com/v1/current.json?key=696e24afb47e4652a32224358250303&q=Dominican%20Republic&aqi=no'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      return WeatherModel.fromJson(jsonData);
    } else {
      return null;
    }
  }
}
