import 'package:flutter/material.dart';
import 'package:iiatimd_app/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SelectionView',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SelectionPage(title: 'Flutter Selection Page'));
  }
}

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes (infinitescroll)'),
      ),
      body: const SelectedCards(),
      //filter
      //ingredients
    );
  }
}

//Card for selected ingredients on the main page
class SelectedCards extends StatefulWidget {
  const SelectedCards({super.key});

  @override
  State<SelectedCards> createState() => _SelectedCards();
}

class _SelectedCards extends State<SelectedCards> {
  //get state of active ingredients

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3, //list.length
        itemBuilder: (context, index) {
          if (index < 3) {
            //if index = list.length
            return const ActiveCards();
          } else {
            return const AddIngredientCard();
          }
        });
  }
}

class ActiveCards extends StatefulWidget {
  const ActiveCards({super.key});

  @override
  State<ActiveCards> createState() => _ActiveCardsState();
}

class _ActiveCardsState extends State<ActiveCards> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                child: Icon(Icons.add_circle_outline_outlined)),
            Column(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                    child: const Text(
                      'ingredient name', //list.item.title
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: screenWidth - 130,
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                  '  component 1', //list.item.title.component[0]
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Flexible(
                              child: Text(
                                  'component 2', //list.item.title.component[1]
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                'longer component 3', //list.item.title.component[2]
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                  'super long  component 4', //list.item.title.component[3]
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Text('Extra info', style: TextStyle(color: Colors.white))
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
