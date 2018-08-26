import 'package:flutter/material.dart';
import '../widgets/products/prices_tag.dart';
import '../widgets/ui_component/title_default.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String describe;
  final double price;
  final String imageURl;
  ProductPage(this.title, this.describe, this.price, this.imageURl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(title + ' Detail'),
        ),
        body: WillPopScope(
          onWillPop: () {
            print('back');
            Navigator.pop(context);
            return Future.value(false);
          },
          child: ListView(
            children: <Widget>[
              Image.asset(imageURl),
              Container(
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TitleDefault(title),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Union Square, San Francisec |',
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 3.0,
                            ),
                            PriceTag(price.toString())
                            // Text(
                            //   '\$${price.toString()}',
                            //   style: TextStyle(
                            //       color: Colors.red,
                            //       fontSize: 18.0,
                            //       fontWeight: FontWeight.bold),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          describe,
                          style:
                              TextStyle(color: Colors.black38, fontSize: 18.0),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
