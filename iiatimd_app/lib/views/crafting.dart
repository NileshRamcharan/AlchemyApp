import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../main.dart' show RecipeStorage;

class CraftingView extends StatelessWidget {
  CraftingView({super.key, required this.ingredients, required this.storage});

  final Map ingredients;
  final RecipeStorage storage;

  late double maxWidth;
  late double maxHeight;

  @override
  Widget build(BuildContext context) {
    maxHeight = MediaQuery.of(context).size.height;
    if (MediaQuery.of(context).size.width < 450) {
      maxWidth = MediaQuery.of(context).size.width;
    } else {
      maxWidth = MediaQuery.of(context).size.width / 3;
    }
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: maxHeight * 0.375,
          width: maxWidth,
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Alchemy",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SelectionSlot(),
                    SelectionSlot(),
                    SelectionSlot(),
                  ],
                ),
                Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Color(0xffE1DBBF)),
                    ),
                  ),
                ),
                // CraftButton(),
                FloatingActionButton(
                  onPressed: () => storage.writeRecipes(
                      'potion of mana', 'patat', 'aardappel', 'pizza'),
                  tooltip: 'craft',
                  child: Text('Craft'),
                ),
                FloatingActionButton(
                  onPressed: () => storage.readRecipes().then((value) {
                    print(value);
                  }),
                  child: Text('print list'),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: maxHeight * 0.625,
          width: maxWidth,
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Color(0xffE1DBBF)),
          ),
        )
      ],
    ));
  }
}

class SelectionSlot extends StatelessWidget {
  const SelectionSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Color(0xffE1DBBF)),
      ),
    );
  }
}

class CraftButton extends StatelessWidget {
  const CraftButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {}, // Image tapped
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
              width: 200,
              decoration: BoxDecoration(
                  color: const Color(0xFF006989),
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(7))),
              child: const Padding(
                padding: EdgeInsets.all(3.5),
                child: Text(
                  "Craft",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )),
        ));
  }
}
