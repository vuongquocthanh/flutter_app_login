import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyLoginState();
  }
}

class MyLoginState extends State<MyLogin> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final tffUsername = TextEditingController();
  final tffPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    tffUsername.dispose();
    tffPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("My Login App"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network("https://upload.wikimedia.org/wikipedia/commons/a/ac/Oikya_Front_Logo.png"),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: tffUsername,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.supervised_user_circle_sharp),
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.black45,
                        width: 1.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter some text";
                    } else if (value.length < 6) {
                      return "Username must have 6 characters at least";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, bottom: 8, right: 8),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: tffPassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_clock),
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.black45,
                        width: 1.0,
                      ),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter some text";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, bottom: 8, right: 8),
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text("Login", style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      showSnackbar(
                          "You already login with account: ${tffUsername.text}");
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }

  void showSnackbar(String content) {
    var snackbar = SnackBar(
      content: Text(content),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {},
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
