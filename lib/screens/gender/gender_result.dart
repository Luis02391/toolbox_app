import 'package:flutter/material.dart';

class GenderResult extends StatelessWidget {
  final String gender;

  const GenderResult({super.key, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: gender == 'male' ? Colors.blue : Colors.pink,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Genero predicho: ${gender == 'male' ? 'Masculino' : 'Femenino'}',
        style: const TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
