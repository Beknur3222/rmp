import 'package:untitled10/five.dart';
import 'package:untitled10/first.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Six extends StatefulWidget {
  const Six({Key? key}) : super(key: key);

  @override
  _Six createState() => _Six();
}

class LoginData {
  String username = "";
  String password = " ";
}

class _Six extends State {
  LoginData _loginData = new LoginData();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Form',
              ),
            ),
            drawer: Drawer(
              width: 150,
              backgroundColor: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const First()));
                      },
                      child: Text("1 page")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Five()));
                      },
                      child: Text("5 page")),
                ],
              ),
            ),
            body: Container(
                padding: EdgeInsets.all(50.0),
                child: Form(
                  key: this._formKey,
                  child: Column(children: [
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (String? inValue) {
                          if (inValue!.length ==0){
                            return "Please enter username";
                          }
                          return null;
                        },
                        onSaved: (String? inValue){
                          this._loginData.username = inValue!;
                        },
                        decoration: const InputDecoration(
                            hintText: "none@none.com",
                            labelText: "Username (eMaill address)")),
                    TextFormField(
                        obscureText: true,
                        validator: (String? inValue){
                          if (inValue!.length < 10){
                            return "Password must be >=10 in length";
                          }
                          return null;
                        },
                        onSaved: (String? inValue){
                          this._loginData.password = inValue!;
                        },
                        decoration: InputDecoration(
                            hintText: "Password", labelText: "Password")),
                    ElevatedButton(
                        child: Text("Log in!"),
                        onPressed: () {
                          if (_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                            print("Username: ${_loginData.username}");
                            print("Password: ${_loginData.password}");
                          }
                        })
                  ],),
                )
            )
        )
    );
  }
}
