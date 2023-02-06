import 'package:flutter/cupertino.dart';

import 'card.dart' as cartochka;

class Cards with ChangeNotifier{
   final List<cartochka.Card> _bcards = [
    cartochka.Card('1234567812345678', '1', '1', '1')
  ];


   List<cartochka.Card> get bcards => _bcards;

  void removeCard(String cardNumber){
     bcards.removeWhere((element) => element.cardNumber == cardNumber);
     notifyListeners();
   }
   void addCard(cartochka.Card card){
    _bcards.add(card);
    notifyListeners();
   }
}
