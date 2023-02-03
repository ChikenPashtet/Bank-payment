import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cards.dart';
import '../styles/styles.dart';

class CardItem extends StatefulWidget {
  String cardNumber;
  String cardYear;
  String cardMonth;
  String cardCode;

  CardItem(this.cardNumber, this.cardYear, this.cardMonth, this.cardCode);

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String endOfCard = widget.cardNumber.substring(12, 16);
    return Container(
      width: width * 0.86,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Styles.firstGradientColor,
            Styles.secondGradientColor,
          ],
        ),
        border: const Border.fromBorderSide(
          BorderSide(width: 0),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/Pay_System_Logo.png'),
                IconButton(
                    onPressed: () {
                      simpleDialog(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('****', style: Styles.fontForCard),
                const Text('****', style: Styles.fontForCard),
                const Text('****', style: Styles.fontForCard),
                Text(endOfCard, style: Styles.fontForCard),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(height * 0.02),
                      child: const Text(
                        'Pay',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Styles.mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future simpleDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Remove the card',
            style: Styles.ordinaryFont,
          ),
          content: Text(
            'Are sure you want to delete this card?',
            style: Styles.ordinaryFont,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Nope',
                      style: Styles.ordinaryFont,
                    )),
                TextButton(
                  child: Text(
                    'Yep',
                    style: Styles.ordinaryFont,
                  ),
                  onPressed: () {
                    //Provider.of<Cards>(context, listen: false).removeCard(widget.cardNumber);
                    // context.read<Cards>().removeCard(widget.cardNumber);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
