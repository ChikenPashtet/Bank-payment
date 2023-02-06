import 'package:donatello_project/screens/new_card_screen.dart';
import 'package:donatello_project/widgets/card_item.dart';
import 'package:donatello_project/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cards.dart';
import '../models/card.dart' as cartochka;
import '../styles/styles.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<Cards>(context);
    //Если строку выше расскоментить, то крах системы
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Styles.mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.mainColor,
        toolbarHeight: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top) *
            0.15,
        title: Padding(
          padding: EdgeInsets.only(top: height * 0.04),
          child: const Text(
            'Payment method',
            style: Styles.title,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white,
        ),
        height: height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              const Center(
                child: Text(
                  'Apple Pay',
                  style: Styles.titleForCard,
                ),
              ),
              SizedBox(
                height: height * 0.024,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: TextFieldCard(
                    'Amount in USD', 16, '', TextEditingController(), null),
              ),
              SizedBox(height: height * 0.01),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Add Money with ',
                        ),
                        Icon(
                          Icons.apple_sharp,
                          size: 15,
                        ),
                        Text('Pay'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              const Text(
                'Other payment methods',
                style: Styles.subTitle,
              ),
              SizedBox(height: height * 0.012),
              Container(
                height: height * 0.25,
                child: ListView.builder(
                  physics: PageScrollPhysics(),
                  //padding: EdgeInsets.only(left: width * 0.06),
                  scrollDirection: Axis.horizontal,
                  //itemCount: Cards.cards.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                      child: CardItem(
                          list.bcards[index].cardNumber,
                          list.bcards[index].cardYear,
                          list.bcards[index].cardMonth,
                          list.bcards[index].cardCode),
                    );
                    //можно просто карту передать)))
                  },
                  itemCount: list.bcards.length > 0 ? list.bcards.length : 0,
                ),
              ),
              SizedBox(height: height * 0.044),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(),
                    onPressed: () async {
                      cartochka.Card? card = await Navigator.of(context)
                              .pushNamed(NewCardScreen.routeName)
                          as cartochka.Card?;
                      //Как предотвратить возращение null?
                      setState(() {
                        if (card != null) {
                          list.addCard(card);
                        }
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.017),
                      child: Row(
                        children: [
                          Image.asset('assets/images/payment_card.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Pay with new card',
                            style: Styles.ordinaryFont,
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
