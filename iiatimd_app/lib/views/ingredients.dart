import 'package:flutter/material.dart';

class IngredientView extends StatelessWidget {
  const IngredientView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        //test column om real applicatie van card te zien zonder api
        child: Column(
          children: [
            IngredientCard(name: "Abecaen longfin", effect1: "Weakness to frost", effect2: "Fortify sneak", effect3: "Weakness to poison", effect4: "Fortify restoration", location: "Collected by catching Abacean Longfin fish."),
            IngredientCard(name: "Blue mountain flower", effect1: "Restore health", effect2: "Fortify Conjuration", effect3: "Fortify health", effect4: "Damage magicka regen", location: "Harvested from the blue variety of Mountain Flower."),
            IngredientCard(name: "Abecaen longfin", effect1: "Weakness to frost", effect2: "Fortify sneak", effect3: "Weakness to poison", effect4: "Fortify restoration", location: "Collected by catching Abacean Longfin fish."),
            IngredientCard(name: "Blue mountain flower", effect1: "Restore health", effect2: "Fortify Conjuration", effect3: "Fortify health", effect4: "Damage magicka regen", location: "Harvested from the blue variety of Mountain Flower."),
          ],
        ),
      )
    );
  }
}

class IngredientCard extends StatelessWidget {
  const IngredientCard({super.key, required this.name, required this.effect1, required this.effect2, required this.effect3, required this.effect4, required this.location});

  final String name;

  final String effect1;
  final String effect2;
  final String effect3;
  final String effect4;

  final String location;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: 350,
          height: 150,
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Row(
            children: [
              const SizedBox(
                width:100,
                child: Center(
                  child: SizedBox(
                    width: 90,
                    height: 90,
    
                    //temp decobox waar later de image van het ingredient ingeladen moet worden
                    child: DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: Column(
                  children: [
                    Text(name),
                    SizedBox(
                      height: 100,
                      child: GridView.count(
                        padding: const EdgeInsets.all(10),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        childAspectRatio: (90 / 30),
                        children: [
                          Align(alignment: Alignment.topLeft,child: Text(effect1)),
                          Align(alignment: Alignment.topRight,child: Text(effect2)),
                          Align(alignment: Alignment.bottomLeft,child: Text(effect3)),
                          Align(alignment: Alignment.bottomRight,child: Text(effect4)),
                        ],
                      ),
                    ),
                    Text(location),
                  ],
                ),
              )
            ],
          )
          )
           
        ),
    );
  }
}