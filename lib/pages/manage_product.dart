import 'package:flutter/material.dart';
import './products_create.dart';
import './products_list.dart';

class ManageProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  title: Text('Menu'),
                  automaticallyImplyLeading: false,
                ),
                ListTile(
                  title: Text('all products'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('Manage Products'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.create), text: 'Create'),
                Tab(icon: Icon(Icons.list), text: 'My')
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[ProductsCreate(), ProductsList()],
          )),
    );
  }
}
