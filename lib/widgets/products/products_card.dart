import 'package:flutter/material.dart';
import './prices_tag.dart';
import '../ui_component/title_default.dart';

class ProductsCard extends StatelessWidget {
  final Map<String, dynamic> products;
  final int productsIndex;

  ProductsCard(this.products, this.productsIndex);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products['imgURL']),
          Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TitleDefault(products['title']),
                  SizedBox(
                    width: 8.0,
                  ),
                  PriceTag(['price'].toString()),
                ],
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(4.0)),
            child: Text(
              'Union Square, San Francisec',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () => Navigator.pushNamed<bool>(
                      context, '/products/' + productsIndex.toString())),
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
