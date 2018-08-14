import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageURl;
  ProductPage(this.title, this.imageURl);

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
            Navigator.pop(context, false);
            return Future.value(false); 
          },
          child: Column(
            children: <Widget>[
              Image.asset(imageURl),
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Center(
                  child: RaisedButton(
                    child: Text('Delete'),
                    onPressed: () => Navigator.pop(context, true),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
