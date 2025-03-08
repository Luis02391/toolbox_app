import 'package:flutter/material.dart';

import '../../models/pokemon_model.dart';
import '../../services/pokemon/pokemon_service.dart';
import '../../utils/pokemon_card.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final TextEditingController _controller = TextEditingController();
  Pokemon? _pokemon;
  bool _isLoading = false;

  Future<void> _fetchPokemon() async {
    setState(() => _isLoading = true);
    final response =
        await PokemonService.getPokemon(_controller.text.trim().toLowerCase());
    setState(() {
      _pokemon = Pokemon.fromJson(response!);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información de Pokémon'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_pokemon != null)
              PokemonCard(
                name: _pokemon!.name,
                imageUrl: _pokemon!.imageUrl,
                baseExperience: _pokemon!.baseExperience,
                abilities: _pokemon!.abilities,
              ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Ingrese el nombre del Pokemon',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _fetchPokemon,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Buscar Pokemon',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
