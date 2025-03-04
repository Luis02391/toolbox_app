import 'package:flutter/material.dart';
import '../../services/gender/gender_service.dart';
import 'gender_result.dart';

class GenderPredictionScreen extends StatefulWidget {
  const GenderPredictionScreen({super.key});

  @override
  createState() => _GenderPredictionScreenState();
}

class _GenderPredictionScreenState extends State<GenderPredictionScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _gender;
  bool _isLoading = false;

  Future<void> _predictGender() async {
    setState(() => _isLoading = true);
    final gender = await GenderService.predictGender(_nameController.text);
    setState(() {
      _gender = gender;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Predicción de Genero'),
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
            if (_gender != null) ...[
              GenderResult(gender: _gender!),
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
              onPressed: _isLoading ? null : _predictGender,
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
                'Predecir Genero',
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
