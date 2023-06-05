import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecipeView(infinitescroll)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RecipePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class RecipePage extends StatefulWidget {
  const RecipePage({super.key, required this.title});

  final String title;

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final controller = ScrollController();
  List<String> items = [];
  List<bool> addFavorite = [];
  bool hasMore = true;
  int page = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    fetch();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Future fetch() async {
    if (isLoading) return;
    isLoading = true;

    const limit = 10;
    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List newItems = json.decode(response.body);

      setState(() {
        page++;
        isLoading = false;

        if (newItems.length < limit) {
          hasMore = false;
        }
        items.addAll(newItems.map<String>((item) {
          final number = item['id'];

          return 'Potion of\nRegenerate Stamina';
        }).toList());
      });
    }
  }

  Future refresh() async {
    setState(() {
      items.clear();
      page = 1;
      hasMore = true;
      isLoading = false;
    });

    fetch();
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
            : RefreshIndicator(
                onRefresh: refresh,
                child: ListView.builder(
                  controller: controller,
                  padding: const EdgeInsets.all(8),
                  itemCount: items.length + 1,
                  itemBuilder: (context, index) {
                    if (index < items.length) {
                      final item = items[index];
                      addFavorite.add(false);

                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: SizedBox(
                          width: screenWidth - 10,
                          height: screenHeight / 6,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xffF2EBC9),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 110,
                                  // color: Colors.red,

                                  child: Center(
                                    child: Container(
                                      width: 90,
                                      height: 90,
                                      color: Color(0xffE1DBBF),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: screenWidth - 128,
                                  // color: Colors.blue,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 28),
                                            child: Text(
                                              item,
                                            ),
                                          ),
                                          const Spacer(),
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
                                              print(addFavorite);
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            color: Color(0xffE1DBBF),
                                          ),
                                          Container(
                                            width: 50,
                                            height: 50,
                                            color: Color(0xffE1DBBF),
                                          ),
                                          Container(
                                            width: 50,
                                            height: 50,
                                            color: Color(0xffE1DBBF),
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
                ),
              ));
  }
}
