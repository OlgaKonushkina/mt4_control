import 'package:flutter/material.dart';
import 'core/connection_factory.dart';
import 'features/generator/generator.dart';
import 'shared/di_container.dart';

void main() {
  setupDependencies(type: ConnectionType.mock); // поменяй на serial или ethernet при необходимости
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'МТ-4 Пульт',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ПУЛЬТ МТ-4 АБ')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: GeneratorWidget(),
      ),
    );
  }
}