import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function delete;
  Products([this.products, this.delete]) {
    print('[Products Widget] Constructor');
  }

  Widget _productsBuild(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['imageURL']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  child: Text('detail'),
                  onPressed: () => Navigator
                      .pushNamed<bool>(context, '/products/' + index.toString())
                      .then((bool value) => delete(index)))
            ],
          )
        ],
      ),
    );
  }

  Widget _productsListBuild() {
    Widget productsList;
    if (products.length > 0) {
      productsList = ListView.builder(
        itemBuilder: _productsBuild,
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
