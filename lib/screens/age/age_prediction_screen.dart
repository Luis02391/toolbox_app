import 'package:flutter/material.dart';
import '../../../services/age/age_service.dart';
import 'age_result.dart';

class AgePredictionScreen extends StatefulWidget {
  const AgePredictionScreen({super.key});

  @override
  createState() => _AgePredictionScreenState();
}

class _AgePredictionScreenState extends State<AgePredictionScreen> {
  final TextEditingController _nameController = TextEditingController();
  int? _age;
  bool _isLoading = false;

  Future<void> _predictAge() async {
    setState(() => _isLoading = true);
    final age = await AgeService.predictAge(_nameController.text);
    setState(() {
      _age = age;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Predicción de Edad'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_age != null) ...[
              AgeResult(age: _age!),
              const SizedBox(height: 40),
            ],
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Ingrese un nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _predictAge,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                'Predecir Edad',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
