import 'package:donatello_project/screens/new_card_screen.dart';
import 'package:donatello_project/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cards.dart';
import '../models/card.dart' as cartochka;

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final create = (card) => setState(() {Cards.cards.add(card);});
    final cart = Provider.of<Cards>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF5DF4D),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF5DF4D),
        toolbarHeight: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top) *
            0.15,
        title: Padding(
          padding:
              EdgeInsets.only(top: (MediaQuery.of(context).size.height * 0.04)),
          child: const Text(
            'Payment method',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Center(
                child: Text(
                  'Apple Pay',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.048,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                child: TextField(
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    fillColor: const Color(0xFFF4F4F4),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Color(0xFFF4F4F4),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    // hintText: 'Amount in USD',
                    labelText: 'Amount in USD',
                    labelStyle: const TextStyle(
                      color: Color(0xFFABB4BD),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Add Money with ',
                        ),
                        const Icon(
                          Icons.apple_sharp,
                          size: 15,
                        ),
                        const Text('Pay'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              const Text(
                'Other payment methods',
                style: TextStyle(fontSize: 20, color: Color(0xFFABB4BD)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.012),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.06),
                  scrollDirection: Axis.horizontal,
                  itemCount: Cards.cards.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardItem(
                        Cards.cards[index].cardNumber,
                        Cards.cards[index].cardYear,
                        Cards.cards[index].cardMonth,
                        Cards.cards[index].cardCode);
                    //можно просто карту передать)))
                  },
                  //itemCount: cart.cards.length > 0 ? cart.cards.length : 0,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.044),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(),
                    onPressed: () {
                      setState(() async {
                        Cards.cards = await Navigator.of(context)
                                .pushNamed(NewCardScreen.routeName, arguments: {create})
                            as List<cartochka.Card>;
                      });
                      // Navigator.of(context).pushNamed(NewCardScreen.routeName);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.017),
                      child: Row(
                        children: [
                          Image.asset(
                              '/Users/pavel/StudioProjects/donatello_project/assets/images/payment_card.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Pay with new card',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
