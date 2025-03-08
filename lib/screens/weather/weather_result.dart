import 'package:flutter/material.dart';
import '../../models/weather_model.dart';

class WeatherResult extends StatelessWidget {
  final WeatherModel weather;

  const WeatherResult({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${weather.city}, ${weather.region}, ${weather.country}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Image.network(weather.iconUrl, width: 100, height: 100),
          const SizedBox(height: 10),
          Text(
            '${weather.temperature}°C',
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            weather.description,
            style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 10),
          _weatherDetailRow(Icons.thermostat, 'Sensacion termica: ${weather.feelsLike}°C'),
          _weatherDetailRow(Icons.water_drop, 'Humedad: ${weather.humidity}%'),
          _weatherDetailRow(Icons.air, 'Viento: ${weather.windSpeed} km/h'),
        ],
      ),
    );
  }

  Widget _weatherDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.blueAccent),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
