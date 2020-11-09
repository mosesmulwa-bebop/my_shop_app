import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../constants/constants.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showFavoritesOnly = true;
                } else if (selectedValue == FilterOptions.All) {
                  _showFavoritesOnly = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('Only Favorites'),
                    ],
                  ),
                  value: FilterOptions.Favorites),
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.article_outlined,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('Show All'),
                    ],
                  ),
                  value: FilterOptions.All),
            ],
          ),
          // SizedBox(
          //   width: 5.0,
          // ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              onPressed: (){
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: ProductsGrid(_showFavoritesOnly),
    );
  }
}
