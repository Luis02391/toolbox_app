import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const MenuItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50.0, color: Colors.blueAccent),
            const SizedBox(height: 10.0),
            Text(title,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
