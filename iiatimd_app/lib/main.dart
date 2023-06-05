import 'package:flutter/material.dart';
import 'package:iiatimd_app/views/crafting.dart';
import 'package:iiatimd_app/views/ingredients.dart';

void main() {
  runApp(const AlchemyApp());
}

class AlchemyApp extends StatelessWidget {
  const AlchemyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alchemy App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const InitPage(),
    );
  }
}

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final info_controller = PageController(initialPage: 1,);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: info_controller,
      children: [
        IngredientView(),
        CraftingView()
      ]
    );
  }
}