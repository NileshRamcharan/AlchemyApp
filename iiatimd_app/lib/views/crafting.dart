import 'package:flutter/material.dart';

class CraftingView extends StatelessWidget {
  const CraftingView({super.key, required this.ingredients});

  final Map ingredients;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(ingredients.toString()),
      ),
    );
  }
}