import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:iiatimd_app/views/crafting.dart';

import 'package:path_provider/path_provider.dart';
import 'package:iiatimd_app/views/recipes.dart';
import 'package:iiatimd_app/views/selection.dart';

void main() {
  runApp(const AlchemyApp());
}

class AlchemyApp extends StatelessWidget {
  const AlchemyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlchemyApp',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const InitPage(),
    );
  }
}

class RecipeStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/recipe.txt');
  }

  Future<String> readRecipes() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return '';
    }
  }

  Future<File> writeRecipes(String title, String ingredient1,
      String ingredient2, String? ingredient3) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$title,$ingredient1,$ingredient2,$ingredient3;',
        mode: FileMode.append);
  }
}

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  //final info_controller = PageController(initialPage: 1,);
  late PageController info_controller;
  late Future<AlchemyHolder> alchemyFuture;

  @override
  void initState() {
    super.initState();
    alchemyFuture = fetchAlchemy();
  }

  @override
  void dispose() {
    info_controller.dispose();
    super.dispose();
  }

  List selectedIngredients = [];

  List physics = [NeverScrollableScrollPhysics(), ClampingScrollPhysics()];
  int index = 1;

  void giveMainSelectedIngredients(List newSelection) {
    setState(() => selectedIngredients = newSelection);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AlchemyHolder>(
        future: alchemyFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (MediaQuery.of(context).size.width > 450) {
              info_controller = PageController(
                viewportFraction: 1 / 3,
                initialPage: 1,
              );
              index = 0;
            } else {
              info_controller = PageController(
                initialPage: 1,
              );
            }
            return (PageView(
                controller: info_controller,
                physics: physics[index],
                children: [
                  SelectionPage(
                    ingredients: snapshot.data!.ingredients,
                    selectedIngredients: selectedIngredients,
                  ),
                  CraftingView(
                    ingredients: snapshot.data!.ingredients,
                    giveMainSelectedIngredients: giveMainSelectedIngredients,
                    recipes: snapshot.data!.recipes,
                    storage: RecipeStorage(),
                  ),
                  RecipePage(
                    ingredients: snapshot.data!.ingredients,
                    storage: RecipeStorage(),
                  )
                ]));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        });
  }
}

Future<AlchemyHolder> fetchAlchemy() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firebase = FirebaseFirestore.instance.collection("alchemy");
  final ingredients = firebase.doc("ingredients");
  final recipes = firebase.doc("potions");
  DocumentSnapshot ing = await ingredients.get();
  DocumentSnapshot rec = await recipes.get();
  final mapIngredients = ing.data() as Map<String, dynamic>;
  final mapRecipes = rec.data() as Map<String, dynamic>;

  return AlchemyHolder(ingredients: mapIngredients, recipes: mapRecipes);
}

class AlchemyHolder {
  final Map ingredients;
  final Map recipes;

  const AlchemyHolder({
    required this.ingredients,
    required this.recipes,
  });

  factory AlchemyHolder.fromJson(Map<String, dynamic> json) {
    return AlchemyHolder(
      ingredients: json['ingredients'],
      recipes: json['potions'],
    );
  }
}
