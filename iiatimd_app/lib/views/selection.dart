import 'package:flutter/material.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key, required this.ingredients});

  final Map ingredients;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipes (infinitescroll)'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 450) {
            return TabletLayout(
              ingredients: ingredients,
            );
          } else {
            return PhoneLayout(
              ingredients: ingredients,
            );
          }
        })
        //filter
        //ingredients
        );
  }
}

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key, required this.ingredients});

  final Map ingredients;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 80,
        child: Column(
          children: [
            const Expanded(child: SelectedCardsPhone()),
            Expanded(child: FilterContainer(ingredients: ingredients))
          ],
        ),
      ),
    );
  }
}

class PhoneLayout extends StatelessWidget {
  const PhoneLayout({super.key, required this.ingredients});

  final Map ingredients;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(child: SelectedCardsPhone()),
          Expanded(child: FilterContainer(ingredients: ingredients))
        ],
      ),
    );
  }
}

//Card for selected ingredients on the main page
class SelectedCardsPhone extends StatefulWidget {
  const SelectedCardsPhone({super.key});

  @override
  State<SelectedCardsPhone> createState() => _SelectedCardsPhone();
}

class _SelectedCardsPhone extends State<SelectedCardsPhone> {
  //get state of active ingredients

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: 3, //list.length
            itemBuilder: (context, index) {
              if (index < 3) {
                //if index = list.length
                return const ActiveCards(
                    name: "Abecaen longfin",
                    effect1: "Weakness to frost",
                    effect2: "Fortify sneak",
                    effect3: "Weakness to poison",
                    effect4: "Fortify restoration",
                    location: "Collected by catching Abacean Longfin fish.");
              } else {
                return const AddIngredientCard();
              }
            }),
      ),
    );
  }
}

class ActiveCards extends StatelessWidget {
  const ActiveCards(
      {super.key,
      required this.name,
      required this.effect1,
      required this.effect2,
      required this.effect3,
      required this.effect4,
      required this.location});

  final String name;

  final String effect1;
  final String effect2;
  final String effect3;
  final String effect4;

  final String location;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          children: [
            Container(
                width: 75,
                height: 75,
                color: Colors.blue,
                child: const Icon(Icons.add_circle_outline_outlined)),
            Column(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                    child: Text(
                      name, //list.item.title
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: screenWidth - 130,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                  effect1, //list.item.title.component[0]
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white)),
                            ),
                            Flexible(
                              child: Text(
                                  effect2, //list.item.title.component[1]
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                effect3, //list.item.title.component[2]
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                  effect4, //list.item.title.component[3]
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth - 130,
                  child: Text(
                    location,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddIngredientCard extends StatelessWidget {
  const AddIngredientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.white),
        ),
        child: const Row(children: [
          SizedBox(
              width: 75,
              height: 75,
              child: Icon(
                Icons.add_circle_outline_outlined,
                color: Colors.white,
              )),
          Center(
            child: Text(
              'Add ingredient',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ]),
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
  const FilterButton(
      {super.key, required this.name, required this.onChangeState});

  final String name;
  final Function(String) onChangeState;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onChangeState(name);
        }, // Image tapped
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF75704E),
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(7))),
              child: Padding(
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
  late List currentIngredient;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5 - 33,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index < ingredients[state.toLowerCase()].length) {
              // for (int i = 0; i < ingredients[state.toLowerCase()].length;) {
              //   return ActiveCards(
              //       name: ingredients[state.toLowerCase()][i]['ingredient'],
              //       effect1: ingredients[state.toLowerCase()][i]['effect1'],
              //       effect2: ingredients[state.toLowerCase()][i]['effect2'],
              //       effect3: ingredients[state.toLowerCase()][i]['effect3'],
              //       effect4: ingredients[state.toLowerCase()][i]['effect4'],
              //       location: ingredients[state.toLowerCase()][i]['blurb']);
              // }

              return ActiveCards(
                  name: ingredients[state.toLowerCase()][index]['ingredient'],
                  effect1: ingredients[state.toLowerCase()][index]['effect1'],
                  effect2: ingredients[state.toLowerCase()][index]['effect2'],
                  effect3: ingredients[state.toLowerCase()][index]['effect3'],
                  effect4: ingredients[state.toLowerCase()][index]['effect4'],
                  location: ingredients[state.toLowerCase()][index]['blurb']);
            }
          }),
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

  void onchangeState(String newState) {
    setState(() => state = newState);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Filter(state: state, onChangeState: onchangeState),
        Container(
            color: Colors.red,
            child: ListChoice(state: state, ingredients: widget.ingredients))
      ],
    );
  }
}
