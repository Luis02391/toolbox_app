import 'package:flutter/material.dart';

import '../../models/university_model.dart';

class UniversityCard extends StatelessWidget {
  final UniversityModel university;

  const UniversityCard({super.key, required this.university});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              university.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Dominio: ${university.domain}'),
            const SizedBox(height: 8),
            GestureDetector(
              child: Text(
                university.webPage,
                style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
