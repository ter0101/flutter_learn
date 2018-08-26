import 'package:flutter/material.dart';
import '../widgets/products/products.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  HomePage(this.products);

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
                leading: Icon(Icons.edit),
                title: Text('Manage Product'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/manage');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          textTheme: Theme.of(context).primaryTextTheme,
          title: Text('Easy List'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            )
          ],
        ),
        body: Products(products));
  }
}
