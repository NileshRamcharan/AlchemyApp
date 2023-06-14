import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iiatimd_app/views/crafting.dart';
import 'package:iiatimd_app/views/ingredients.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const AlchemyApp());
}

class AlchemyApp extends StatelessWidget {
  const AlchemyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Facts Test',
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AlchemyHolder>(
      future: alchemyFuture,
          builder: (context, snapshot){
            if (snapshot.hasData) {
                return (
                    PageView(
                      controller: info_controller,
                      children: [
                        IngredientView(ingredients: snapshot.data!.ingredients),
                        CraftingView(ingredients: snapshot.data!.ingredients,)
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

  const AlchemyHolder({
    required this.ingredients,
  });

  factory AlchemyHolder.fromJson(Map<String, dynamic> json) {
    return AlchemyHolder(
      ingredients: json['ingredients'],
    );
  }
}


