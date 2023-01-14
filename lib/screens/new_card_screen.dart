import 'package:donatello_project/widgets/card_item.dart';
import 'package:donatello_project/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cards.dart';
import '../models/card.dart' as cartochka;

class NewCardScreen extends StatefulWidget {
  static const routeName = '/new_card_screen';
  late String cardNumber;
  late String cardYear;
  late String cardMonth;
  late String cardCode;

  static final Map<String, String> infoAboutCard = {};

  @override
  State<NewCardScreen> createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> {
  bool isNeedSave = true;


  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final companyNameController = TextEditingController();
    final adressOneNameController = TextEditingController();
    final adressSecondNameController = TextEditingController();
    final cityController = TextEditingController();
    final stateController = TextEditingController();
    final zipCodeController = TextEditingController();
    final amountController = TextEditingController();
    final myController = TextEditingController();
    final yearController = TextEditingController();
    final monthController = TextEditingController();
    final cvvController = TextEditingController();
    //final cart = Provider.of<Cards>(context);
    final create = ModalRoute.of(context)?.settings.arguments as dynamic;
    final cart = context.read<Cards>();
    return Scaffold(
      backgroundColor: const Color(0xFFF5DF4D),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Color(0xFFF5DF4D),
        toolbarHeight: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top) *
            0.15,
        title: Padding(
          padding:
              EdgeInsets.only(top: (MediaQuery.of(context).size.height * 0.04)),
          child: const Text(
            'Bank Card',
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
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.09,
                vertical: MediaQuery.of(context).size.height * 0.043),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Вill to',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextFieldCard(
                            'FirstName', 16, '', firstNameController)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Expanded(
                        child: TextFieldCard(
                            'LastName', 16, '', lastNameController)),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFieldCard('Company Name', 16, '', companyNameController),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFieldCard(
                    'Address Line 1', 16, '', adressOneNameController),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFieldCard(
                    'Address Line 2', 16, '', adressSecondNameController),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextFieldCard('City', 16, '', cityController)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Expanded(
                        child: TextFieldCard('State', 16, '', stateController)),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFieldCard('Zip Code', 16, '', zipCodeController),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.043,
                ),
                const Text(
                  'Payment details',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFieldCard('Amount in USD', 16, '', amountController),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFieldCard('Card number', 16, '', myController),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextFieldCard('Card’s expiration year', 16,
                            'Year (YYYY)', yearController)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Expanded(
                        child: TextFieldCard('Card’s expiration month', 16,
                            'Month (MM)', monthController)),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFieldCard('Card code (CVV Code)', 16, '', cvvController),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Save card data',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                    CupertinoSwitch(
                      value: isNeedSave,
                      onChanged: (bool value) {
                        setState(() {
                          isNeedSave = value;
                        });
                      },
                      activeColor: Color(0xFFF5DF4D),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                ElevatedButton(
                  onPressed: () {
                    // create(Cards.cards.add(cartochka.Card(
                    //     myController.text,
                    //     yearController.text,
                    //     monthController.text,
                    //     cvvController.text)));
                    // Navigator.of(context).setState(() {
                    //   Cards.cards.add(cartochka.Card(
                    //       myController.text,
                    //       yearController.text,
                    //       monthController.text,
                    //       cvvController.text));
                    // });
                    // setState(() {
                    //   Cards.cards.add(cartochka.Card(
                    //       myController.text,
                    //       yearController.text,
                    //       monthController.text,
                    //       cvvController.text));
                    // });
                    print(Cards.cards.last.cardNumber);
                    print(Cards.cards.length);
                    Navigator.pop(context, cartochka.Card(myController.text,
                            yearController.text,
                            monthController.text,
                            cvvController.text));
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.02),
                          child: Text(
                            'Pay',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF5DF4D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
