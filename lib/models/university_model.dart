class UniversityModel {
  final String name;
  final String domain;
  final String webPage;

  UniversityModel({required this.name, required this.domain, required this.webPage});

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      name: json['name'] ?? 'Sin nombre',
      domain: (json['domains'] as List<dynamic>).isNotEmpty
          ? json['domains'][0]
          : 'Sin dominio',
      webPage: (json['web_pages'] as List<dynamic>).isNotEmpty
          ? json['web_pages'][0]
          : 'Sin página web',
    );
  }
}
