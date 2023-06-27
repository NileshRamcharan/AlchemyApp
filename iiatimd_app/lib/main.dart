import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iiatimd_app/views/crafting.dart';
import 'package:iiatimd_app/views/ingredients.dart';

import 'package:http/http.dart' as http;
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

  void giveMainSelectedIngredients(List newSelection){
    setState(() => selectedIngredients = newSelection);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AlchemyHolder>(
      future: alchemyFuture,
          builder: (context, snapshot){
            if (snapshot.hasData) {
              if (MediaQuery.of(context).size.width > 450)
              {
                info_controller = PageController(viewportFraction: 1 / 3);
              }
              else{
                info_controller = PageController(initialPage: 1,);
              }
                return (
                    PageView(
                      
                      controller: info_controller,
                      children: [
                        SelectionPage(ingredients: snapshot.data!.ingredients),
                        CraftingView(ingredients: snapshot.data!.ingredients, giveMainSelectedIngredients: giveMainSelectedIngredients, recipes: snapshot.data!.recipes,),
                        RecipePage(title: "recipe")
                      ]
                    )
                  );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
          }
    );
  }
}

// return LayoutBuilder(builder: (context,constraints)){
//                   if(constraints.maxWidth > 450)
//                   {
//                     info_controller = PageController(viewportFraction: 1 / 3);
//                   }
//                   else{
//                     info_controller = PageController(initialPage: 1,);
//                   }
//                   return PageView(
//                         controller: info_controller,
//                         children: [
//                           SelectionPage(ingredients: snapshot.data!.ingredients),
//                           CraftingView(ingredients: snapshot.data!.ingredients),
//                           RecipePage(title: "recipe")
//                         ]
//                       );
//                 }

Future<AlchemyHolder> fetchAlchemy() async {
  final response = await http
      .get(Uri.parse('http://10.0.2.2:8000/api/all'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    
    return AlchemyHolder.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
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


