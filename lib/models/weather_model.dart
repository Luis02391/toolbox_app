class WeatherModel {
  final String city;
  final String region;
  final String country;
  final double temperature;
  final String description;
  final String iconUrl;
  final double feelsLike;
  final int humidity;
  final double windSpeed;

  WeatherModel({
    required this.city,
    required this.region,
    required this.country,
    required this.temperature,
    required this.description,
    required this.iconUrl,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['location']['name'],
      region: json['location']['region'],
      country: json['location']['country'],
      temperature: json['current']['temp_c'].toDouble(),
      description: json['current']['condition']['text'],
      iconUrl: 'https:${json['current']['condition']['icon']}',
      feelsLike: json['current']['feelslike_c'].toDouble(),
      humidity: json['current']['humidity'],
      windSpeed: json['current']['wind_kph'].toDouble(),
    );
  }
}
