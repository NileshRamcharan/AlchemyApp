import 'package:flutter/material.dart';

class CraftingView extends StatelessWidget {
  const CraftingView({super.key, required this.ingredients});

  final Map ingredients;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height* 0.375,
            child: DecoratedBox(
               decoration: const BoxDecoration(color: Colors.blue),
            ),
          ),
          SizedBox(

          )
        ],
      )
    );
  }
}