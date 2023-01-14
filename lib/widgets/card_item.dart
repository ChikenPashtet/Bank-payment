import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  String cardNumber;
  String cardYear;
  String cardMonth;
  String cardCode;


  CardItem(this.cardNumber, this.cardYear, this.cardMonth, this.cardCode);

  @override
  Widget build(BuildContext context) {
    String endOfCard = cardNumber.substring(12,);
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.86,
        decoration: BoxDecoration(
          color: Colors.black,
          border: const Border.fromBorderSide(
            BorderSide(
              width: 3,
            ),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: (MediaQuery.of(context).size.height * 0.02)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                      '/Users/pavel/StudioProjects/donatello_project/assets/images/Pay_System_Logo.png'),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '****',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFF5DF4D)),
                  ),
                  const Text('****',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFF5DF4D))),
                  const Text('****',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFF5DF4D))),
                  Text(endOfCard,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFF5DF4D))),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.02),
                        child: const Text(
                          'Pay',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5DF4D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
