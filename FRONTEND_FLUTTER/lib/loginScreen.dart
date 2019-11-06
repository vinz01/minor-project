import 'package:flutter/material.dart';
import 'package:flutterimageapp/homePage.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      performLogin();
    }
  
  }

  void performLogin() {
    final snackbar = new SnackBar(
      content: new Text("Email : $_email, password : $_password"),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
    Navigator
    .of(context)
    .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          title: new Text("LOGIN"),
          backgroundColor: Colors.black,
        ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left:25,right:25),
          child: new Form(
            key: formKey,
            child: new Column(
              children: <Widget>[
                new Image.asset(
                  'images/logo_black.png',
                height: 200,
                width: 200
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: "User ID"),
                  validator: (val) =>
                      !val.contains('@') ? 'Invalid Email' : null,
                  onSaved: (val) => _email = val,
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: "Password"),
                  validator: (val) =>
                      val.length < 6 ? 'Password too short' : null,
                  onSaved: (val) => _password = val,
                  obscureText: true,
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                new RaisedButton(
                  child: new Text(
                    "LOGIN",
                    style: new TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  color: Colors.redAccent,
                  onPressed: _submit,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
