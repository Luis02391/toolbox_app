class Pokemon {
  final String name;
  final String imageUrl;
  final int baseExperience;
  final List<String> abilities;

  Pokemon({
    required this.name,
    required this.imageUrl,
    required this.baseExperience,
    required this.abilities,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
      baseExperience: json['base_experience'],
      abilities: (json['abilities'] as List)
          .map((ability) => ability['ability']['name'] as String)
          .toList(),
    );
  }
}
