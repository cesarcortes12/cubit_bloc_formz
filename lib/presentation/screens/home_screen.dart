import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        ListTile(
          title: Text('Cubits'),
          subtitle: Text('gestor de estado simple'),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
          onTap: () => {context.push('/cubits')},
        ),
        ListTile(
          title: Text('Bloc'),
          subtitle: Text('gestor estado bloc'),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
          onTap: () => {context.push('/bloc')},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(),
        ),
        ListTile(
          title: Text('Nuevo Usuario'),
          subtitle: Text('Manejo de fomularios'),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
          onTap: () => {context.push('/new-user')},
        ),
      ],
    ));
  }
}
