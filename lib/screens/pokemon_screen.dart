import 'package:flutter/material.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Información de Pokémon')),
      body: const Center(
        child: Text('Hola Mundo - Información de Pokémon'),
      ),
    );
  }
}
