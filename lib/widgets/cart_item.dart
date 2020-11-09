import 'package:flutter/material.dart';

class CartItemCart extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;

  CartItemCart({this.id, this.price, this.quantity, this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 15,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Text('\$ $price'),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${(quantity * price)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
