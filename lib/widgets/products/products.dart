import 'package:flutter/material.dart';
import './products_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function delete;

  Products([this.products, this.delete]) {
    print('[Products Widget] Constructor');
  }

  Widget _productsListBuild() {
    Widget productsList;
    if (products.length > 0) {
      productsList = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductsCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productsList = Center(
        child: Text('add some products'),
      );
    }
    return productsList;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    // TODO: implement build
    return _productsListBuild();
  }
}
