import 'package:flutter/material.dart';
import '../functions/convertNameToPath.dart';
import '../main.dart' show RecipeStorage;

class RecipePage extends StatefulWidget {
  const RecipePage(
      {super.key, required this.ingredients, required this.storage});

  final Map ingredients;
  final RecipeStorage storage;

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  List<String> items = [];

  //List<bool> addFavorite = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocalStorage();
  }

  getLocalStorage() {
    widget.storage.readRecipes().then((value) {
      setState(() {
        final splitValues = value.split(';');
        for (int i = 0; i < splitValues.length - 1; i++) {
          items.add(splitValues[i]);
        }
      });
    });
  }

  Future refresh() async {
    items.clear();
    getLocalStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.black),
          child: RefreshIndicator(
            onRefresh: () => refresh(),
            child: items.isEmpty
                ?  ListView(
                    children: [Text("No Recipes Found",style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,),],
                  )
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      if (index < items.length) {
                        final item = items[index].split(",");
                        //addFavorite.add(false);
        
                        return RecipeCard(
                            name: item[0],
                            ingredient1: item[1],
                            ingredient2: item[2],
                            ingredient3: item[3]);
                      }
                    },
                  ),
          ),
        ));
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.name,
    required this.ingredient1,
    required this.ingredient2,
    required this.ingredient3,
  });

  final String name;
  final String ingredient1;
  final String ingredient2;
  final String ingredient3;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth,
      height: screenHeight / 6,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffF2EBC9),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: 75,
                  height: 75,
                  color: const Color(0xffE1DBBF),
                  child: Image.asset(convertNameToPath(name)),
                  //image potion
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                          ),
                          // IconButton(
                          //   icon: addFavorite.elementAt(index)
                          //       ? const Icon(
                          //           Icons.star,
                          //         )
                          //       : const Icon(
                          //           Icons.star_border_outlined,
                          //         ),
                          //   onPressed: () {
                          //     setState(() {
                          //       addFavorite[index] =
                          //           !addFavorite
                          //               .elementAt(index);
                          //     });
                          //print(addFavorite);
                          //},
                          //),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: const Color(0xffE1DBBF),
                          child: Image.asset(convertNameToPath(ingredient1)),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          color: const Color(0xffE1DBBF),
                          child: Image.asset(convertNameToPath(ingredient2)),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          color: const Color(0xffE1DBBF),
                          child: Image.asset(convertNameToPath(ingredient3)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
