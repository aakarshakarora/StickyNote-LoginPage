import 'package:flutter/cupertino.dart';
import 'package:loginPage/data/databaseHelper.dart';
import 'package:loginPage/modal/user.dart';

import 'package:flutter/material.dart';

import 'loginpresenter.dart';

class LoginPage extends StatefulWidget {
@override
_LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  LoginPagePresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text("User Successfully Logged In"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("Login"),
      color: Colors.orange,
    );
    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          "StickyNote Login",
          textScaleFactor: 2.0,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                new TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (val) => _username = val,
                  decoration: new InputDecoration(labelText: "Username"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Password"),autofocus: false,
                  obscureText: true,
                ),
              )
            ],
          ),
        ),
        loginBtn
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("StickyNote"),
        centerTitle: true,
      ),
      key: scaffoldKey,
      body: new Container(
        child: new Center(
          child: loginForm,
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
    _showSnackBar(error);
    setState(()  async {
      _isLoading = true;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    // TODO: implement onLoginSuccess
    _showSnackBar(user.toString());
    setState(()   async {
      _isLoading = false;
      var db = new DatabaseHelper();
      await db.saveUser(user);
      Navigator.of(context).pushNamed("/home");
    });

  }
}
