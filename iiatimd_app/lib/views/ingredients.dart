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
            Text("data"),
            FilterContainer()
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

class Filter extends StatelessWidget {
  const Filter({super.key, required this.state, required this.onChangeState});

  final String state;
  final Function(String) onChangeState;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilterButton(name: "Mushrooms", onChangeState: onChangeState),
        FilterButton(name: "Plants", onChangeState: onChangeState),
        FilterButton(name: "Monsters", onChangeState: onChangeState),
        FilterButton(name: "Animals", onChangeState: onChangeState),
        FilterButton(name: "Harvestables", onChangeState: onChangeState),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, required this.name, required this.onChangeState});

  final String name;
  final Function(String) onChangeState;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {onChangeState(name);}, // Image tapped
      child:Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(decoration:  BoxDecoration(color: Color(0xFF75704E), border: Border.all(color: Colors.black), borderRadius: BorderRadius.all(Radius.circular(7))), child: Padding(
          padding: const EdgeInsets.all(3.5),
          child: Text(name, style: const TextStyle(color: Colors.white)),
        )),
      ));
  }
}

class ListChoice extends StatelessWidget {
  const ListChoice({super.key, required this.state});

  final String state;

  @override
  Widget build(BuildContext context) {
    switch(state){
      case "Mushrooms":
        return const Column(
          children: [
            IngredientCard(name: "Abecaen longfin", effect1: "Weakness to frost", effect2: "Fortify sneak", effect3: "Weakness to poison", effect4: "Fortify restoration", location: "Collected by catching Abacean Longfin fish."),
            IngredientCard(name: "Blue mountain flower", effect1: "Restore health", effect2: "Fortify Conjuration", effect3: "Fortify health", effect4: "Damage magicka regen", location: "Harvested from the blue variety of Mountain Flower."),
            IngredientCard(name: "Abecaen longfin", effect1: "Weakness to frost", effect2: "Fortify sneak", effect3: "Weakness to poison", effect4: "Fortify restoration", location: "Collected by catching Abacean Longfin fish."),
            IngredientCard(name: "Blue mountain flower", effect1: "Restore health", effect2: "Fortify Conjuration", effect3: "Fortify health", effect4: "Damage magicka regen", location: "Harvested from the blue variety of Mountain Flower."),
          ],
        );
      case "Plants":
        return const Column(
          children: [
            IngredientCard(name: "Abecaen longfin", effect1: "Weakness to frost", effect2: "Fortify sneak", effect3: "Weakness to poison", effect4: "Fortify restoration", location: "Collected by catching Abacean Longfin fish."),
            IngredientCard(name: "Blue mountain flower", effect1: "Restore health", effect2: "Fortify Conjuration", effect3: "Fortify health", effect4: "Damage magicka regen", location: "Harvested from the blue variety of Mountain Flower."),
            IngredientCard(name: "Abecaen longfin", effect1: "Weakness to frost", effect2: "Fortify sneak", effect3: "Weakness to poison", effect4: "Fortify restoration", location: "Collected by catching Abacean Longfin fish."),
            IngredientCard(name: "Blue mountain flower", effect1: "Restore health", effect2: "Fortify Conjuration", effect3: "Fortify health", effect4: "Damage magicka regen", location: "Harvested from the blue variety of Mountain Flower."),
          ],
        );
      case "Monsters":
        return const Text("f");
      case "Animals":
        return const Text(" ");
      case "Harvestables":
        return const Text("c");
      default:
        return const Text("x");
    }
    
  }
}

class FilterContainer extends StatefulWidget {
  const FilterContainer({super.key});

  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {

  String state = "Mushrooms";

  void onchangeState(String newState){
    setState(() => state = newState);
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Filter(state: state, onChangeState: onchangeState),
        ListChoice(state: state)
      ],
    );
  }
}