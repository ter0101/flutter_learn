import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPage();
  }
}

_showErrorDialof(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Fail!!'),
          content: Text('email or password is not correct.'),
          actions: <Widget>[
            FlatButton(
              child: Text('close'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}

class _AuthPage extends State<AuthPage> {
  String _emailValue = '';
  String _passwordValue = '';

  String email = 'ter52285@hotmail.com';
  String password = 'abc123';

  bool _acceptTerms = true;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    // TODO: implement build
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            repeat: ImageRepeat.noRepeat,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.darken)),
      ),
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: targetWidth,
            child: Column(
              children: <Widget>[
                Text('Welcome to Products APP',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        fontFamily: 'Oswald')),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      filled: true,
                      fillColor: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String value) {
                    setState(() {
                      _emailValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  onChanged: (String value) {
                    setState(() {
                      _passwordValue = value;
                    });
                  },
                ),
                SwitchListTile(
                  value: _acceptTerms,
                  onChanged: (bool value) {
                    setState(() {
                      _acceptTerms = value;
                    });
                  },
                  title: Text(
                    'Accept Terms',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  color: Colors.red,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_emailValue == email && _passwordValue == password) {
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      _showErrorDialof(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
