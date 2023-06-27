import 'package:flutter/material.dart';
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
  final controller = ScrollController();

  List<String> items = [];
  List<bool> addFavorite = [];
  bool hasMore = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.storage.readRecipes().then((value) {
      setState(() {
        final splitValues = value.split(';');
        for (int i = 0; i < splitValues.length - 1; i++) {
          items.add(splitValues[i]);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipes (infinitescroll)'),
        ),
        body: items.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                controller: controller,
                itemCount: items.length + 1,
                itemBuilder: (context, index) {
                  if (index < items.length) {
                    final item = items[index];
                    addFavorite.add(false);

                    return SizedBox(
                      width: screenWidth,
                      height: screenWidth > 450
                          ? screenHeight / 6
                          : screenHeight / 6,
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
                                  //image potion
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 35),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            // TEXT
                                            item,
                                          ),
                                          IconButton(
                                            icon: addFavorite.elementAt(index)
                                                ? const Icon(
                                                    Icons.star,
                                                  )
                                                : const Icon(
                                                    Icons.star_border_outlined,
                                                  ),
                                            onPressed: () {
                                              setState(() {
                                                addFavorite[index] =
                                                    !addFavorite
                                                        .elementAt(index);
                                              });
                                              //print(addFavorite);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          color: const Color(0xffE1DBBF),
                                        ),
                                        Container(
                                          width: 50,
                                          height: 50,
                                          color: const Color(0xffE1DBBF),
                                        ),
                                        Container(
                                          width: 50,
                                          height: 50,
                                          color: const Color(0xffE1DBBF),
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
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Center(
                        child: hasMore
                            ? const CircularProgressIndicator()
                            : const Text('no more data'),
                      ),
                    );
                  }
                },
              ));
  }
}
