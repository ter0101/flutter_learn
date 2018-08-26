import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/product.dart';
import './pages/manage_product.dart';
import './pages/auth.dart';

void main() => runApp(MyApp());

// create state use for multi obj
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// create widget by class, create obj
class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProducts(index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
          accentColor: Colors.redAccent,
          primaryTextTheme: TextTheme(),
          brightness: Brightness.light),
      // home: AuthPage());
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/home': (BuildContext context) => HomePage(_products),
        '/manage': (BuildContext context) =>
            ManageProducts(_addProduct, _deleteProducts)
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') return null;
        if (pathElements[1] == 'products') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(
                  _products[index]['title'],
                  _products[index]['describe'],
                  _products[index]['price'],
                  _products[index]['imgURL']));
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => HomePage(_products));
      },
    );
  }
}
