import 'package:flutter/material.dart';

class DeleteConfirm extends StatelessWidget {

  _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('dlete this subject.'),
            actions: <Widget>[
              FlatButton(
                child: Text('close'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('delete'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, false);
                },
              )
            ],
          );
        });
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return _showDialog(context);
    }
}