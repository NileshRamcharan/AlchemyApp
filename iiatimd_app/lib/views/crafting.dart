import 'package:flutter/material.dart';

class CraftingView extends StatelessWidget {
  CraftingView({super.key, required this.ingredients});

  final Map ingredients;

  late double maxWidth;
  late double maxHeight;

  @override
  Widget build(BuildContext context) {
    maxHeight = MediaQuery.of(context).size.height;
    if( MediaQuery.of(context).size.width < 450)
    {
      maxWidth = MediaQuery.of(context).size.width;
    }
    else
    {
      maxWidth = MediaQuery.of(context).size.width/3;
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
                  Text("Alchemy", style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),),
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
                      width: 70,
                      height: 70,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xffE1DBBF)
                        ),
                      ),
                    ),
                  ),
                  CraftButton(),
                ],
               ),
            ),
          ),

          SizedBox(
            height: maxHeight * 0.625,
            width: maxWidth,
            child: DecoratedBox(
               decoration: const BoxDecoration(color: Color(0xffE1DBBF)),
               child: FilterContainer(ingredients: ingredients),
            ),
          )
        ],
      )
    );
  }
}

class SelectionSlot extends StatelessWidget {
  const SelectionSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 70,
      height: 70,
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
      child:Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 200,
          decoration:  BoxDecoration(color: Color(0xFF006989), 
          border: Border.all(color: Colors.white), 
          borderRadius: BorderRadius.all(Radius.circular(7))), 
          child: Padding(
          padding: const EdgeInsets.all(3.5),
          child: Text("Craft", style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,),
        )),
      ));
  }
}

class IngredientSlot extends StatelessWidget {
  const IngredientSlot({super.key, required this.ingredient});

  final Map ingredient;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.black),
        child: Center(child: Text(ingredient["ingredient"], style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
  ListChoice({super.key, required this.state, required this.ingredients});

  final String state;
  final Map ingredients;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/2,
      child: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 4,
        childAspectRatio: (50 / 50),
        children: [
          for (int i = 0; i < ingredients[state.toLowerCase()].length; i++) IngredientSlot(ingredient: ingredients[state.toLowerCase()][i]),
        ],
      ),
    );
  }
}

class FilterContainer extends StatefulWidget {
  const FilterContainer({super.key, required this.ingredients});

  final Map ingredients;

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
        ListChoice(state: state, ingredients: widget.ingredients)
      ],
    );
  }
}