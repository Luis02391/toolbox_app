import 'package:flutter/material.dart';
import 'package:toolbox_app/widgets/menu_item.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toolbox App'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        children: const [
          MenuItem(title: 'Genero', icon: Icons.person, route: '/gender'),
          MenuItem(title: 'Edad', icon: Icons.cake, route: '/age'),
          MenuItem(
              title: 'Universidades',
              icon: Icons.school,
              route: '/universities'),
          MenuItem(title: 'Clima RD', icon: Icons.cloud, route: '/weather'),
          MenuItem(
              title: 'Pokemon',
              icon: Icons.catching_pokemon,
              route: '/pokemon'),
          MenuItem(title: 'Noticias', icon: Icons.article, route: '/news'),
          MenuItem(title: 'Acerca de', icon: Icons.info, route: '/about'),
        ],
      ),
    );
  }
}
