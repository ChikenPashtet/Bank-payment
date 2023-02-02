import 'package:donatello_project/widgets/card_item.dart';
import 'package:donatello_project/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/card.dart' as cartochka;
import '../styles/styles.dart';

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Styles.mainColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Styles.mainColor,
        toolbarHeight: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top) *
            0.15,
        title: Padding(
          padding: EdgeInsets.only(top: (height * 0.04)),
          child: const Text(
            'Bank Card',
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
        width: width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.09, vertical: height * 0.043),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Вill to',
                    style: Styles.titleForCard,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: TextFieldCard(
                              'FirstName', 16, '', firstNameController, validator(false,false,true,false,0))),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Expanded(
                          child: TextFieldCard(
                              'LastName', 16, '', lastNameController, validator(false,false,true,false,0))),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.008,
                  ),
                  TextFieldCard(
                      'Company Name', 16, '', companyNameController, null),
                  SizedBox(
                    height: height * 0.008,
                  ),
                  TextFieldCard(
                      'Address Line 1', 16, '', adressOneNameController, null),
                  SizedBox(
                    height: height * 0.008,
                  ),
                  TextFieldCard('Address Line 2', 16, '',
                      adressSecondNameController, null),
                  SizedBox(
                    height: height * 0.008,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: TextFieldCard(
                              'City', 16, '', cityController, validator(false,false,true,false,0))),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Expanded(
                          child: TextFieldCard(
                              'State', 16, '', stateController, validator(false,false,true,false,0))),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.008,
                  ),
                  TextFieldCard('Zip Code', 16, '', zipCodeController, null),
                  SizedBox(
                    height: height * 0.016,
                  ),
                  const Text(
                    'Payment details',
                    style: Styles.titleForCard,
                  ),
                  SizedBox(
                    height: height * 0.016,
                  ),
                  TextFieldCard(
                      'Amount in USD', 16, '', amountController, validator(false,true,false,false,0)),
                  SizedBox(
                    height: height * 0.008,
                  ),
                  TextFieldCard('Card number', 16, '', myController,
                      validator(true, true, false, true, 16)),
                  SizedBox(
                    height: height * 0.008,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFieldCard(
                          'Card’s expiration year',
                          16,
                          'Year (YYYY)',
                          yearController,
                          validator(true, true, false, true, 4),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Expanded(
                          child: TextFieldCard(
                              'Card’s expiration month',
                              16,
                              'Month (MM)',
                              monthController,
                              validator(true, true, false, true, 4))),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.024,
                  ),
                  TextFieldCard('Card code (CVV Code)', 16, '', cvvController,
                      validator(true, true, false, true, 3)),
                  SizedBox(
                    height: height * 0.008,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Save card data',
                        style: Styles.fontForSwitcher,
                      ),
                      CupertinoSwitch(
                        value: isNeedSave,
                        onChanged: (bool value) {
                          setState(() {
                            isNeedSave = value;
                          });
                        },
                        activeColor: Styles.mainColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        isNeedSave
                            ? Navigator.pop(
                                context,
                                cartochka.Card(
                                    myController.text,
                                    yearController.text,
                                    monthController.text,
                                    cvvController.text))
                            : Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Styles.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? Function(String?)? validator(
    bool requiredField,
    bool onlyNumbers,
    bool onlyText,
    bool exactLength,
    int length,
  ) {
    return (value) {
      if (requiredField && (value == null || value.isEmpty)) {
        return 'Это обязательное поле';
      }
      if (exactLength && value?.length != length) {
        return "Номер карты должен быть 16 символов";
      }
      if ((requiredField && (value?.length ?? 1) < 3)) {
        return "Логин должен быть не короче 3 символов";
      }
      if (value?.contains(" ") ?? false) {
        return 'Логин не может содержать пробелов';
      }
      if (onlyNumbers && (value?.contains(RegExp(r'\D')) ?? false)) {
        return 'Должны быть только цифры';
      }
      if (onlyText && (value?.contains(RegExp(r'\d')) ?? false)) {
        return 'Должны быть только буквы';
      }
      return null;
    };
  }
}
