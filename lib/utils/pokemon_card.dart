import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int baseExperience;
  final List<String> abilities;

  const PokemonCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.baseExperience,
    required this.abilities,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(imageUrl, height: 120, errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.image_not_supported, size: 100, color: Colors.grey);
            }),
            const SizedBox(height: 10),
            Text(
              name.toUpperCase(),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              'Experiencia Base: $baseExperience',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              'Habilidades: ${abilities.isNotEmpty ? abilities.join(", ") : "N/A"}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
