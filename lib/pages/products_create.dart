import 'package:flutter/material.dart';

class ProductsCreate extends StatefulWidget {
  final Function addProducts;
  ProductsCreate(this.addProducts);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductsCreate();
  }
}

class _ProductsCreate extends State<ProductsCreate> {
  String _titleValue;
  String _describe;
  double _priceValue;
  final GlobalKey<FormState> globalKey = GlobalKey();

  Widget _buildTitleField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Title',
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onSaved: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescribeField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Describe'),
      onSaved: (String value) {
        setState(() {
          _describe = value;
        });
      },
    );
  }

  Widget _buildPriceField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Price'),
      onSaved: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    globalKey.currentState.save();
    final Map<String, dynamic> products = {
      'title': _titleValue,
      'describe': _describe,
      'price': _priceValue,
      'imgURL': 'assets/food.jpg'
    };
    widget.addProducts(products);
    Navigator.pushReplacementNamed(context, '/home');
  }

  Widget _buildButtonSaveField() {
    return RaisedButton(
      child: Text('save'),
      color: Theme.of(context).accentColor,
      textColor: Colors.white,
      onPressed: () {
        _submitForm();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    // TODO: implement build
    return Form(
      key: globalKey,
      child: Container(
        margin: EdgeInsets.all(30.0),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          children: <Widget>[
            _buildTitleField(),
            _buildDescribeField(),
            _buildPriceField(),
            ButtonBar(
              children: <Widget>[_buildButtonSaveField()],
            )
          ],
        ),
      ),
    );
  }
}
