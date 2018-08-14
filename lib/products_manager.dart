import 'package:flutter/material.dart';
import './products.dart';
import './products_controller.dart';

class ProductsManager extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProducts;
  final Function deleteProducts;

  ProductsManager(this.products, this.addProducts, this.deleteProducts);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('[ProductsManager Widget] build()');
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(10.0),
                child: ProductController(addProducts)),
          ],
        ),
        Expanded(child: Products(products, deleteProducts))
      ],
    );
  }
}
