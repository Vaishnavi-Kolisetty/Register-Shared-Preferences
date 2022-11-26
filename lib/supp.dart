import 'package:flutter/material.dart';
import 'register1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Supp extends StatefulWidget {
  @override
  State<Supp> createState() => _SuppState();
}

class _SuppState extends State<Supp> {
  late var fname, femail, fphone, fpassword, fdesignation;
  late SharedPreferences logindata;
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      fname = logindata.getString('n1');
      femail = logindata.getString('n2');
      fphone = logindata.getString('n3');
      fpassword = logindata.getString('n4');
      fdesignation = logindata.getString('n5');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black, fontFamily: 'Anton-Regular'),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Name",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        fontFamily: 'Anton-Regular'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$fname",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 113, 113, 113))),
                ),
              ],
            ),
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          /*Container(
                height: 50,
                child: Text(
                  'Email:$femail',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontStyle: FontStyle.italic),
                ),
              ),*/
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        fontFamily: 'Anton-Regular'),
                  ),
                ),
                /*SizedBox(
                  height: 5,
                ),*/
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$femail",
                      //textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 113, 113, 113))),
                ),
              ],
            ),
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "PhoneNo",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        fontFamily: 'Anton-Regular'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$fphone",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 113, 113, 113))),
                ),
              ],
            ),
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        fontFamily: 'Anton-Regular'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$fpassword",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 113, 113, 113))),
                ),
              ],
            ),
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Designation",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        fontFamily: 'Anton-Regular'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$fdesignation",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 113, 113, 113))),
                ),
              ],
            ),
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          TextButton.icon(
            label: Text("Log Out"),
            icon: Icon(Icons.logout),
            onPressed: () {
              logindata.setBool('login', true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (BuildContext ctx) {
                  return Register();
                }),
              );
            },
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
        ],
      ),

      /* Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name:$fname',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Email:$femail',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Phone:$fphone',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Password:$fpassword',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Designation:$fdesignation',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                child: Text("Log Out"),
                onPressed: () {
                  logindata.setBool('login', true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (BuildContext ctx) {
                      return Register();
                    }),
                  );
                }),
          ],
        ),
      ),*/
    );
  }
}
