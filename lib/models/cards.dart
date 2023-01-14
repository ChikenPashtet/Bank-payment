import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/card.dart' as cart;

class Cards with ChangeNotifier {
  static List<cart.Card> _cards = [
    cart.Card('1234567812345678', '1', '1', '1'),
    cart.Card('1234567812341234', '2', '2', '2'),
    cart.Card('1234567812340987', '3', '3', '3'),
  ];


  static set cards(List<cart.Card> value) {
    _cards = value;
  }

  static List<cart.Card> get cards {
    return _cards;
  }

  void add(cart.Card cartos) {
    cards.add(cartos);
    notifyListeners();
  }

  int get itemCount {
    // notifyListeners();
    return _cards.length;
  }
}
