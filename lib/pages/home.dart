import 'package:flutter/material.dart';
import '../products_manager.dart';
import './manage_product.dart';

class HomePage extends StatelessWidget {
  final List<Map <String,String>> products;
  final Function addProducts;
  final Function deleteProduct;

  HomePage(this.products, this.addProducts, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Menu'),
              ),
              ListTile(
                title: Text('Manage Product'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ManageProducts()));
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
            textTheme: Theme.of(context).primaryTextTheme,
            title: Text('Easy List')),
        body: ProductsManager(products,addProducts,deleteProduct));
  }
}
