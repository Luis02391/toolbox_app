import 'package:flutter/material.dart';

class AgeResult extends StatelessWidget {
  final int age;

  const AgeResult({super.key, required this.age});

  String getAgeCategory() {
    if (age < 18) {
      return 'Joven';
    } else if (age < 60) {
      return 'Adulto';
    } else {
      return 'Anciano';
    }
  }

  String getImagePath() {
    if (age < 18) {
      return 'assets/images/joven.png';
    } else if (age < 60) {
      return 'assets/images/adulto.png';
    } else {
      return 'assets/images/anciano.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Edad estimada: $age años',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          'Categoría: ${getAgeCategory()}',
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
        const SizedBox(height: 20),
        Image.asset(
          getImagePath(),
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
