import 'dart:async';

import 'package:login/Register1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/Material.dart';
import 'supp.dart';

class InputWrapperR extends StatefulWidget {
  @override
  State<InputWrapperR> createState() => _InputWrapperRState();
}

class _InputWrapperRState extends State<InputWrapperR> {
  final _name = TextEditingController();

  final _email = TextEditingController();

  final _phone = TextEditingController();

  final _password = TextEditingController();

  final _designation = TextEditingController();

  late var _uname;
  late var _upass;

  late SharedPreferences logindata;
  late bool newuser = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    /*if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Register()));
    }*/
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _phone.dispose();
    _designation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 475,
      width: 340,
      child: Center(
        child: Form(
          key: formkey,
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(34, 0, 0, 0),
                    offset: const Offset(5.0, 5.0),
                    blurRadius: 10.0,
                    spreadRadius: 10.0,
                  )
                ],
                color: Colors
                    .white, //borderRadius: BorderRadius.horizontal({Radius left = Radius.zero, Radius right = Radius.zero}),
                border: Border.all(
                  width: 30,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0))),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: TextFormField(
                    validator: (var value) {
                      if (value.toString().isEmpty) {
                        return "Please Enter Name";
                      }
                      return null;
                    },
                    onSaved: (var username) {
                      _uname = username;
                    },
                    controller: _name,
                    decoration: InputDecoration(
                        prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(Icons.person)),
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: TextField(
                    controller: _email,
                    decoration: InputDecoration(
                        prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(Icons.email)),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: TextField(
                    controller: _phone,
                    decoration: InputDecoration(
                        prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(Icons.phone)),
                        hintText: "Phone",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: TextFormField(
                    validator: (var value) {
                      if (value.toString().isEmpty) {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                    onSaved: (var pass) {
                      _upass = pass;
                    },
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(Icons.password)),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: TextField(
                    controller: _designation,
                    decoration: InputDecoration(
                        prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(Icons.description)),
                        hintText: "Designation",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      // side: BorderSide(width: 3),
                      elevation: 3,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                    ),
                    child: Text("Register"),
                    onPressed: () {
                      final form = formkey.currentState;
                      if (form != null && !form.validate()) {
                        return;
                      } else {
                        print("Successful");
                      }
                      String fname = _name.text;
                      String femail = _email.text;
                      String fphone = _phone.text;
                      String fpassword = _password.text;
                      String fdesignation = _designation.text;
                      if (fname != '' && fpassword != '') {
                        print('Successfull');
                        logindata.setBool('login', false);

                        logindata.setString('n1', fname);
                        logindata.setString('n2', femail);
                        logindata.setString('n3', fphone);
                        logindata.setString('n4', fpassword);
                        logindata.setString('n5', fdesignation);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (BuildContext ctx) {
                            return Supp();
                          }),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
