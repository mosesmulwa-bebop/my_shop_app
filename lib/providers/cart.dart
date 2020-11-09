import 'package:flutter/material.dart';
import 'dart:math';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  double roundDouble(double value, int places){ 
   double mod = pow(10.0, places); 
   return ((value * mod).round().toDouble() / mod); 
}

  int get itemCount {
//return _items == null ? 0 :_items.length;
    return _items.length;
  }

  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, cartItem) { 
      total += cartItem.price * cartItem.quantity;
    });
    return roundDouble(total, 2);
  }


  void addItem({
    String productID,
    double price,
    String title,
  }) {
    if (_items.containsKey(productID)) {
      //increase quantity
      _items.update(
          productID,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      //..add new entry
      _items.putIfAbsent(
          productID,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }
}
