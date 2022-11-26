import 'package:flutter/material.dart';
import 'InputWrapper_R.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color.fromARGB(0, 158, 158, 158),
            Color.fromARGB(0, 158, 158, 158),
            Color.fromARGB(0, 158, 158, 158),
          ]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            //Header(),
            Text(
              "Register",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontFamily: 'Lato'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter all the following details to register",
              style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.grey,
                  fontFamily: 'Lato'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              /*decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  )
                  )*/
              child: InputWrapperR(),
            )
          ],
        ),
      ),
    );
  }
}
