import 'package:donatello_project/models/cards.dart';
import 'package:donatello_project/screens/my_home_page.dart';
import 'package:donatello_project/screens/new_card_screen.dart';
import 'package:donatello_project/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/card.dart' as cart;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFFF5DF4D),
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            Cards();
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            MyHomePage();
          },
        )
      ], child: MyHomePage()),
      routes: {
        NewCardScreen.routeName: (ctx) => NewCardScreen(),
      },
    );
  }
}
