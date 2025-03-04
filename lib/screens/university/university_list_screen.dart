import 'package:flutter/material.dart';

import '../../models/university_model.dart';
import '../../services/university/university_service.dart';
import '../../utils/university_card.dart';

class UniversityListScreen extends StatefulWidget {
  const UniversityListScreen({super.key});

  @override
  createState() => _UniversityListScreenState();
}

class _UniversityListScreenState extends State<UniversityListScreen> {
  final TextEditingController _countryController = TextEditingController();
  List<UniversityModel> _universities = [];
  bool _isLoading = false;

  Future<void> _fetchUniversities() async {
    setState(() => _isLoading = true);
    try {
      final universities =
          await UniversityService.fetchUniversities(_countryController.text);
      setState(() => _universities = universities);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Universidades'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _countryController,
              decoration: InputDecoration(
                labelText: 'Ingrese un país en inglés',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _fetchUniversities,
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Buscar Universidades'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _universities.isEmpty
                  ? const Center(child: Text('No hay resultados'))
                  : ListView.builder(
                      itemCount: _universities.length,
                      itemBuilder: (context, index) =>
                          UniversityCard(university: _universities[index]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
