import 'package:flutter/material.dart';

class ProductController extends StatelessWidget {
  final Function addProduct;
  ProductController(this.addProduct);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      color: Theme.of(context).accentColor,
      onPressed: () {
        addProduct({'title': 'Food', 'imageURL': 'assets/food.jpg'});
      },
      child: Text('Add Product'),
    );
  }
}
